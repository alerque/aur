# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: loqs <bugs-archlinux@entropy-collector.net>

# https://releases.electronjs.org/
# https://gitlab.com/Matt.Jolly/chromium-patches/-/tags

# Note: PKGBUILD source array can be updated to sources matching an exact Electron release with:
# python makepkg-source-roller.py update v$pkgver $pkgname

_use_suffix=1
pkgver=28.2.5
_gcc_patches=120
# shellcheck disable=SC2034
pkgrel=1
_major_ver=${pkgver%%.*}
pkgname="electron${_major_ver}"
pkgdesc='Build cross platform desktop apps with web technologies'
arch=(x86_64)
url='https://electronjs.org'
license=(MIT custom)
depends=(c-ares
         glibc # libc.so libm.so
         gcc-libs # libgcc_s.so
         gtk3 libgtk-3.so
         libevent
         libffi libffi.so
         libpulse libpulse.so
         nss # libnss3.so
         zlib libz.so)
makedepends=(clang
             git
             gn
             gperf
             harfbuzz-icu
             http-parser
             java-runtime-headless
             libnotify
             libva
             lld
             llvm
             ninja
             npm
             pciutils
             pipewire
             python
             python-httplib2
             python-pyparsing
             python-requests
             python-six
             qt5-base
             wget
             yarn)
optdepends=('kde-cli-tools: file deletion support (kioclient5)'
            'pipewire: WebRTC desktop sharing under Wayland'
            'qt5-base: enable Qt5 with --enable-features=AllowQt'
            'gtk4: for --gtk-version=4 (GTK4 IME might work better on Wayland)'
            'trash-cli: file deletion support (trash-put)'
            'xdg-utils: open URLs with desktop’s default (xdg-email, xdg-open)')
options=('!lto') # Electron adds its own flags for ThinLTO
source=("git+https://github.com/electron/electron.git#tag=v$pkgver"
        https://gitlab.com/Matt.Jolly/chromium-patches/-/archive/$_gcc_patches/chromium-patches-$_gcc_patches.tar.bz2
        default_app-icon.patch
        electron-launcher.sh
        electron.desktop
        icu-74.patch
        drop-flags-unsupported-by-clang16.patch
        jinja-python-3.10.patch
        libxml2-2.12.patch
        use-system-libraries-in-node.patch
        "makepkg-source-roller.py"
        # BEGIN managed sources
        # END managed sources
       )
sha256sums=('SKIP'
            'ffee1082fbe3d0c9e79dacb8405d5a0e1aa94d6745089a30b093f647354894d2'
            'dd2d248831dd4944d385ebf008426e66efe61d6fdf66f8932c963a12167947b4'
            'b0ac3422a6ab04859b40d4d7c0fd5f703c893c9ec145c9894c468fbc0a4d457c'
            '4484200d90b76830b69eea3a471c103999a3ce86bb2c29e6c14c945bf4102bae'
            'ff9ebd86b0010e1c604d47303ab209b1d76c3e888c423166779cefbc22de297f'
            '8d1cdf3ddd8ff98f302c90c13953f39cd804b3479b13b69b8ef138ac57c83556'
            '55dbe71dbc1f3ab60bf1fa79f7aea7ef1fe76436b1d7df48728a1f8227d2134e'
            '1808df5ba4d1e2f9efa07ac6b510bec866fa6d60e44505d82aea3f6072105a71'
            'ff588a8a4fd2f79eb8a4f11cf1aa151298ffb895be566c57cc355d47f161f53f'
            '1eebf52f298ffb0a5525fa64b28039a6a0b5d83c07c3457262c88e9cc4bb0451')

# Possible replacements are listed in build/linux/unbundle/replace_gn_files.py
# Keys are the names in the above script; values are the dependencies in Arch
declare -gA _system_libs=(
  # [brotli]=brotli
  [dav1d]="dav1d libdav1d.so"
  # [ffmpeg]="ffmpeg libavcodec.so libavcodec.so libavformat.so libavutil.so" # YouTube playback stopped working in Chromium 120
  [flac]="flac libFLAC.so"
  [fontconfig]="fontconfig libfontconfig.so"
  [freetype]="freetype2 libfreetype.so"
  [harfbuzz-ng]="harfbuzz libharfbuzz.so libharfbuzz-subset.so"
  [icu]="icu libicui18n.so libicuuc.so"
  # [jsoncpp]="jsoncpp libjsoncpp.so"  # needs libstdc++
  #[libaom]=aom
  # [libavif]=libavif # libavif.so libavutil.so # needs https://github.com/AOMediaCodec/libavif/commit/5410b23f76
  [libdrm]=libdrm # libdrm.so
  [libjpeg]="libjpeg libjpeg.so"
  [libpng]="libpng libpng16.so"
  #[libvpx]=libvpx
  [libwebp]="libwebp libwebpdemux.so libwebpmux.so libwebp.so"
  [libxml]="libxml2 libxml2.so"
  [libxslt]="libxslt libxslt.so"
  [opus]="opus libopus.so"
  # [re2]="re2 libre2.so" # needs libstdc++
  # [snappy]=snappy # libsnappy.so # needs libstdc++
  # [woff2]="woff2 libwoff2dec.so" # needs libstdc++
  [zlib]=minizip # libminizip.so
)
_unwanted_bundled_libs=(
  $(printf "%s\n" ${!_system_libs[@]} | sed 's/^libjpeg$/&_turbo/')
)
depends+=(${_system_libs[@]})

prepare() {
  sed -i "s|@ELECTRON@|${pkgname}|" electron-launcher.sh
  sed -i "s|@ELECTRON@|${pkgname}|" electron.desktop
  sed -i "s|@ELECTRON_NAME@|Electron ${_major_ver}|" electron.desktop

  cp -r chromium-mirror_third_party_depot_tools depot_tools
  export PATH+=":$PWD/depot_tools" DEPOT_TOOLS_UPDATE=0
  export VPYTHON_BYPASS='manually managed python not supported by chrome operations'

  echo "Putting together electron sources"
  # Generate gclient gn args file and prepare-electron-source-tree.sh
  python makepkg-source-roller.py generate electron/DEPS $pkgname
  bash prepare-electron-source-tree.sh "$CARCH"
  mv electron src/electron

  echo "Running hooks..."
  # depot_tools/gclient.py runhooks
  src/build/landmines.py
  src/build/util/lastchange.py -o src/build/util/LASTCHANGE
  src/build/util/lastchange.py -m GPU_LISTS_VERSION \
    --revision-id-only --header src/gpu/config/gpu_lists_version.h
  src/build/util/lastchange.py -m SKIA_COMMIT_HASH \
    -s src/third_party/skia --header src/skia/ext/skia_commit_hash.h
  src/build/util/lastchange.py \
    -s src/third_party/dawn --revision src/gpu/webgpu/DAWN_VERSION
  src/tools/update_pgo_profiles.py --target=linux update \
    --gs-url-base=chromium-optimization-profiles/pgo_profiles
  depot_tools/download_from_google_storage.py --no_resume --extract --no_auth \
    --bucket chromium-nodejs -s src/third_party/node/node_modules.tar.gz.sha1

  src/electron/script/apply_all_patches.py \
      src/electron/patches/config.json

  pushd src
  pushd electron
  yarn install --frozen-lockfile
  popd

  echo "Applying local patches..."

  # Upstream fixes

  # Fix build with libxml2 2.12
  patch -Np1 -i ../libxml2-2.12.patch

  # Fix build with ICU 74
  patch -Np1 -i ../icu-74.patch

  # Drop compiler flags that need newer clang
  patch -Np1 -i ../drop-flags-unsupported-by-clang16.patch

  # Fixes for building with libstdc++ instead of libc++
  patch -Np1 -i ../chromium-patches-*/chromium-119-at-spi-variable-consumption.patch
  patch -Np1 -i ../chromium-patches-*/chromium-119-clang16.patch

  # Link to system tools required by the build
  mkdir -p third_party/node/linux/node-linux-x64/bin
  ln -sfn /usr/bin/node third_party/node/linux/node-linux-x64/bin/
  mkdir -p third_party/jdk/current/bin
  ln -sfn /usr/bin/java third_party/jdk/current/bin/
  ln -sfn /usr/bin/clang-format buildtools/linux64

  # Electron specific fixes
  patch -Np1 -i "${srcdir}/jinja-python-3.10.patch" -d "third_party/electron_node/tools/inspector_protocol/jinja2"
  patch -Np1 -i "${srcdir}/use-system-libraries-in-node.patch"
  # patch -Np1 -i "${srcdir}/default_app-icon.patch"  # Icon from .desktop file

  # Allow building against system libraries in official builds
  echo "Patching Chromium for using system libraries..."
  sed -i 's/OFFICIAL_BUILD/GOOGLE_CHROME_BUILD/' \
    tools/generate_shim_headers/generate_shim_headers.py
  # Remove bundled libraries for which we will use the system copies; this
  # *should* do what the remove_bundled_libraries.py script does, with the
  # added benefit of not having to list all the remaining libraries
  local _lib
  for _lib in ${_unwanted_bundled_libs[@]}; do
    find "third_party/$_lib" -type f \
      \! -path "third_party/$_lib/chromium/*" \
      \! -path "third_party/$_lib/google/*" \
      \! -path "third_party/harfbuzz-ng/utils/hb_scoped.h" \
        \! -regex '.*\.\(gn\|gni\|isolate\)' \
        -delete
  done

  ./build/linux/unbundle/replace_gn_files.py \
    --system-libraries "${!_system_libs[@]}"
}

build() {
  cd src

  export CC=clang
  export CXX=clang++
  export AR=ar
  export NM=nm

  local _flags=(
    'custom_toolchain="//build/toolchain/linux/unbundle:default"'
    'host_toolchain="//build/toolchain/linux/unbundle:default"'
    'clang_base_path="/usr"'
    'clang_use_chrome_plugins=false'
    'symbol_level=0' # sufficient for backtraces on x86(_64)
    'chrome_pgo_phase=0' # needs newer clang to read the bundled PGO profile
    'treat_warnings_as_errors=false'
    'disable_fieldtrial_testing_config=true'
    'blink_enable_generated_code_formatting=false'
    'ffmpeg_branding="Chrome"'
    'proprietary_codecs=true'
    'rtc_use_pipewire=true'
    'link_pulseaudio=true'
    'use_custom_libcxx=true' # https://github.com/llvm/llvm-project/issues/61705
    'use_sysroot=false'
    'use_system_libffi=true'
    'enable_hangout_services_extension=true'
    'enable_widevine=false'
    'enable_nacl=false'
    'enable_rust=false'
  )

  if [[ -n ${_system_libs[icu]+set} ]]; then
    _flags+=('icu_use_data_file=false')
  fi

  # Facilitate deterministic builds (taken from build/config/compiler/BUILD.gn)
  CFLAGS+='   -Wno-builtin-macro-redefined'
  CXXFLAGS+=' -Wno-builtin-macro-redefined'
  CPPFLAGS+=' -D__DATE__=  -D__TIME__=  -D__TIMESTAMP__='

  # Do not warn about unknown warning options
  CFLAGS+='   -Wno-unknown-warning-option'
  CXXFLAGS+=' -Wno-unknown-warning-option'

  # Let Chromium set its own symbol level
  CFLAGS=${CFLAGS/-g }
  CXXFLAGS=${CXXFLAGS/-g }

  # https://github.com/ungoogled-software/ungoogled-chromium-archlinux/issues/123
  CFLAGS=${CFLAGS/-fexceptions}
  CFLAGS=${CFLAGS/-fcf-protection}
  CXXFLAGS=${CXXFLAGS/-fexceptions}
  CXXFLAGS=${CXXFLAGS/-fcf-protection}

  # This appears to cause random segfaults when combined with ThinLTO
  # https://bugs.archlinux.org/task/73518
  CFLAGS=${CFLAGS/-fstack-clash-protection}
  CXXFLAGS=${CXXFLAGS/-fstack-clash-protection}

  # https://crbug.com/957519#c122
  CXXFLAGS=${CXXFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS}

  export CHROMIUM_BUILDTOOLS_PATH="${PWD}/buildtools"
  gn gen out/Release \
      --args="import(\"//electron/build/args/release.gn\") ${_flags[*]}"
  ninja -C out/Release electron electron_dist_zip
  # ninja -C out/Release third_party/electron_node:headers
}

package() {
  install -dm755 "${pkgdir:?}/usr/lib/${pkgname}"
  bsdtar -xf src/out/Release/dist.zip -C "${pkgdir}/usr/lib/${pkgname}"

  chmod u+s "${pkgdir}/usr/lib/${pkgname}/chrome-sandbox"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  for l in "${pkgdir}/usr/lib/${pkgname}"/{LICENSE,LICENSES.chromium.html}; do
    ln -s  \
      "$(realpath --relative-to="${pkgdir}/usr/share/licenses/${pkgname}" "${l}")" \
      "${pkgdir}/usr/share/licenses/${pkgname}"
  done

  install -Dm755 "${srcdir}/electron-launcher.sh" \
    "${pkgdir}/usr/bin/${pkgname}"

  # Install .desktop and icon file (see default_app-icon.patch)
  install -Dm644 electron.desktop \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 src/electron/default_app/icon.png \
          "${pkgdir}/usr/share/pixmaps/${pkgname}.png"  # hicolor has no 1024x1024
}
