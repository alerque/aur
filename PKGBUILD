# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: loqs <bugs-archlinux@entropy-collector.net>
# Contributor: kxxt <rsworktech@outlook.com>

# https://releases.electronjs.org/
# https://gitlab.com/Matt.Jolly/chromium-patches/-/tags

# Note: PKGBUILD source array can be updated to sources matching an exact Electron release with:
# python makepkg-source-roller.py update v$pkgver $pkgname

pkgver=28.2.5
_gcc_patches=120
pkgrel=3
_major_ver=${pkgver%%.*}
pkgname="electron${_major_ver}"
pkgdesc='Build cross platform desktop apps with web technologies'
arch=(x86_64)
url='https://electronjs.org'
license=(MIT BSD-3-Clause)
depends=(c-ares
         gcc-libs # libgcc_s.so
         glibc # libc.so libm.so
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
             # Electron ships a vendored nodejs. Meanwhile the npm dependency pulls in nodejs whith is Arch's freshest version.
             # Pinning the closest LTS here makes the build environment more consistent with the vendored copy.
             nodejs-lts-hydrogen
             npm
             patchutils
             pciutils
             pipewire
             python
             python-httplib2
             python-pyparsing
             python-requests
             python-six
             rust
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
        drop-flags-unsupported-by-clang16.patch
        electron-launcher.sh
        electron.desktop
        icu-74.patch
        jinja-python-3.10.patch
        libxml2-2.12.patch
        use-system-libraries-in-node.patch
        makepkg-source-roller.py
        # BEGIN managed sources
        chromium-mirror::git+https://github.com/chromium/chromium.git#tag=120.0.6099.291
        chromium-mirror_third_party_nan::git+https://github.com/nodejs/nan.git#commit=e14bdcd1f72d62bca1d541b66da43130384ec213
        chromium-mirror_third_party_electron_node::git+https://github.com/nodejs/node.git#tag=v18.18.2
        chromium-mirror_third_party_clang-format_script::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/clang/tools/clang-format.git#commit=e5337933f2951cacd3aeacd238ce4578163ca0b9
        chromium-mirror_third_party_libc++_src::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/libcxx.git#commit=a429c26ae25c26a569ff12390d5f9be70c5e286b
        chromium-mirror_third_party_libc++abi_src::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/libcxxabi.git#commit=2ca9f38714b1465b9f55b5fbd0da5e4342811e2b
        chromium-mirror_third_party_libunwind_src::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/libunwind.git#commit=7686b5d38c69d14932abfb1c1a66ba56c78791ad
        chromium-mirror_chrome_test_data_perf_canvas_bench::git+https://chromium.googlesource.com/chromium/canvas_bench.git#commit=a7b40ea5ae0239517d78845a5fc9b12976bfc732
        chromium-mirror_chrome_test_data_perf_frame_rate_content::git+https://chromium.googlesource.com/chromium/frame_rate/content.git#commit=c10272c88463efeef6bb19c9ec07c42bc8fe22b9
        chromium-mirror_chrome_test_data_xr_webvr_info::git+https://chromium.googlesource.com/external/github.com/toji/webvr.info.git#commit=c58ae99b9ff9e2aa4c524633519570bf33536248
        chromium-mirror_media_cdm_api::git+https://chromium.googlesource.com/chromium/cdm.git#commit=fef0b5aa1bd31efb88dfab804bdbe614f3d54f28
        chromium-mirror_native_client::git+https://chromium.googlesource.com/native_client/src/native_client.git#commit=f9cb132c419b9e019853103e88c518026b9f5083
        chromium-mirror_net_third_party_quiche_src::git+https://quiche.googlesource.com/quiche.git#commit=a01a131ca6df63e774809d623f47e8cf28c574cc
        chromium-mirror_third_party_angle::git+https://chromium.googlesource.com/angle/angle.git#commit=6fff8ebc937f07e31473ac014a55f662248ab39a
        chromium-mirror_third_party_anonymous_tokens_src::git+https://chromium.googlesource.com/external/github.com/google/anonymous-tokens.git#commit=47d423347823088a21b26262ca553eadb8e5b220
        chromium-mirror_third_party_content_analysis_sdk_src::git+https://chromium.googlesource.com/external/github.com/chromium/content_analysis_sdk.git#commit=9a408736204513e0e95dd2ab3c08de0d95963efc
        chromium-mirror_third_party_dav1d_libdav1d::git+https://chromium.googlesource.com/external/github.com/videolan/dav1d.git#commit=47107e384bd1dc25674acf04d000a8cdc6195234
        chromium-mirror_third_party_dawn::git+https://dawn.googlesource.com/dawn.git#commit=c7ed440d75861649d8a1ef4b775384f31211d902
        chromium-mirror_third_party_highway_src::git+https://chromium.googlesource.com/external/github.com/google/highway.git#commit=8f20644eca693cfb74aa795b0006b6779c370e7a
        chromium-mirror_third_party_google_benchmark_src::git+https://chromium.googlesource.com/external/github.com/google/benchmark.git#commit=b177433f3ee2513b1075140c723d73ab8901790f
        chromium-mirror_third_party_boringssl_src::git+https://boringssl.googlesource.com/boringssl.git#commit=c38dc29860a72540eb2c4fdb8a8bfb27ef94ddf3
        chromium-mirror_third_party_breakpad_breakpad::git+https://chromium.googlesource.com/breakpad/breakpad.git#commit=8988364bcddd9b194b0bf931c10bc125987330ed
        chromium-mirror_third_party_cast_core_public_src::git+https://chromium.googlesource.com/cast_core/public.git#commit=71f51fd6fa45fac73848f65421081edd723297cd
        chromium-mirror_third_party_catapult::git+https://chromium.googlesource.com/catapult.git#commit=47efdb4b1428e549c58a6d6c2fa79c4a8ceaf9b4
        chromium-mirror_third_party_ced_src::git+https://chromium.googlesource.com/external/github.com/google/compact_enc_det.git#commit=ba412eaaacd3186085babcd901679a48863c7dd5
        chromium-mirror_third_party_chromium-variations::git+https://chromium.googlesource.com/chromium-variations.git#commit=cb7fe7e32de8b885ccdd6293444d8e4028b03eca
        chromium-mirror_third_party_cld_3_src::git+https://chromium.googlesource.com/external/github.com/google/cld_3.git#commit=b48dc46512566f5a2d41118c8c1116c4f96dc661
        chromium-mirror_third_party_colorama_src::git+https://chromium.googlesource.com/external/colorama.git#commit=3de9f013df4b470069d03d250224062e8cf15c49
        chromium-mirror_third_party_cpu_features_src::git+https://chromium.googlesource.com/external/github.com/google/cpu_features.git#commit=936b9ab5515dead115606559502e3864958f7f6e
        chromium-mirror_third_party_cpuinfo_src::git+https://chromium.googlesource.com/external/github.com/pytorch/cpuinfo.git#commit=76d5e8f5b563daa65340a60fce0e9aec73a936df
        chromium-mirror_third_party_crc32c_src::git+https://chromium.googlesource.com/external/github.com/google/crc32c.git#commit=fa5ade41ee480003d9c5af6f43567ba22e4e17e6
        chromium-mirror_third_party_cros_system_api::git+https://chromium.googlesource.com/chromiumos/platform2/system_api.git#commit=00c21541508ea2c6863f1cda24ef88ef30309ae8
        chromium-mirror_third_party_crossbench::git+https://chromium.googlesource.com/crossbench.git#commit=06981428c28d66678ebec13ca1fac3785cf51bb1
        chromium-mirror_third_party_depot_tools::git+https://chromium.googlesource.com/chromium/tools/depot_tools.git#commit=9f3b33a275e7a5b19d8ce4aba7960d2a38858681
        chromium-mirror_third_party_devtools-frontend_src::git+https://chromium.googlesource.com/devtools/devtools-frontend.git#commit=a6c7f00333881a7ecf7044b725052ab0c8776d6f
        chromium-mirror_third_party_dom_distiller_js_dist::git+https://chromium.googlesource.com/chromium/dom-distiller/dist.git#commit=199de96b345ada7c6e7e6ba3d2fa7a6911b8767d
        chromium-mirror_third_party_eigen3_src::git+https://chromium.googlesource.com/external/gitlab.com/libeigen/eigen.git#commit=aa6964bf3a34fd607837dd8123bc42465185c4f8
        chromium-mirror_third_party_farmhash_src::git+https://chromium.googlesource.com/external/github.com/google/farmhash.git#commit=816a4ae622e964763ca0862d9dbd19324a1eaf45
        chromium-mirror_third_party_ffmpeg::git+https://chromium.googlesource.com/chromium/third_party/ffmpeg.git#commit=e1ca3f06adec15150a171bc38f550058b4bbb23b
        chromium-mirror_third_party_flac::git+https://chromium.googlesource.com/chromium/deps/flac.git#commit=689da3a7ed50af7448c3f1961d1791c7c1d9c85c
        chromium-mirror_third_party_flatbuffers_src::git+https://chromium.googlesource.com/external/github.com/google/flatbuffers.git#commit=bcb9ef187628fe07514e57756d05e6a6296f7dc5
        chromium-mirror_third_party_fontconfig_src::git+https://chromium.googlesource.com/external/fontconfig.git#commit=2fb3419a92156569bc1ec707401258c922cd0d99
        chromium-mirror_third_party_fp16_src::git+https://chromium.googlesource.com/external/github.com/Maratyszcza/FP16.git#commit=0a92994d729ff76a58f692d3028ca1b64b145d91
        chromium-mirror_third_party_gemmlowp_src::git+https://chromium.googlesource.com/external/github.com/google/gemmlowp.git#commit=13d57703abca3005d97b19df1f2db731607a7dc2
        chromium-mirror_third_party_grpc_src::git+https://chromium.googlesource.com/external/github.com/grpc/grpc.git#commit=822dab21d9995c5cf942476b35ca12a1aa9d2737
        chromium-mirror_third_party_freetype_src::git+https://chromium.googlesource.com/chromium/src/third_party/freetype2.git#commit=55d0287cfc31115760cb13caa346b407ef0c0ceb
        chromium-mirror_third_party_freetype-testing_src::git+https://chromium.googlesource.com/external/github.com/freetype/freetype2-testing.git#commit=7a69b1a2b028476f840ab7d4a2ffdfe4eb2c389f
        chromium-mirror_third_party_fxdiv_src::git+https://chromium.googlesource.com/external/github.com/Maratyszcza/FXdiv.git#commit=63058eff77e11aa15bf531df5dd34395ec3017c8
        chromium-mirror_third_party_harfbuzz-ng_src::git+https://chromium.googlesource.com/external/github.com/harfbuzz/harfbuzz.git#commit=f26fd69d858642d76413b8f4068eaf9b57c40a5f
        chromium-mirror_third_party_emoji-segmenter_src::git+https://chromium.googlesource.com/external/github.com/google/emoji-segmenter.git#commit=9ba6d25d0d9313569665d4a9d2b34f0f39f9a50e
        chromium-mirror_third_party_ots_src::git+https://chromium.googlesource.com/external/github.com/khaledhosny/ots.git#commit=46bea9879127d0ff1c6601b078e2ce98e83fcd33
        chromium-mirror_third_party_libgav1_src::git+https://chromium.googlesource.com/codecs/libgav1.git#commit=df0023cc95b8e606a2fd243522d823401ef86637
        chromium-mirror_third_party_googletest_src::git+https://chromium.googlesource.com/external/github.com/google/googletest.git#commit=af29db7ec28d6df1c7f0f745186884091e602e07
        chromium-mirror_third_party_hunspell_dictionaries::git+https://chromium.googlesource.com/chromium/deps/hunspell_dictionaries.git#commit=41cdffd71c9948f63c7ad36e1fb0ff519aa7a37e
        chromium-mirror_third_party_icu::git+https://chromium.googlesource.com/chromium/deps/icu.git#commit=a622de35ac311c5ad390a7af80724634e5dc61ed
        chromium-mirror_third_party_jsoncpp_source::git+https://chromium.googlesource.com/external/github.com/open-source-parsers/jsoncpp.git#commit=42e892d96e47b1f6e29844cc705e148ec4856448
        chromium-mirror_third_party_leveldatabase_src::git+https://chromium.googlesource.com/external/leveldb.git#commit=068d5ee1a3ac40dabd00d211d5013af44be55bea
        chromium-mirror_third_party_libFuzzer_src::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/compiler-rt/lib/fuzzer.git#commit=758bd21f103a501b362b1ca46fa8fcb692eaa303
        chromium-mirror_third_party_fuzztest_src::git+https://chromium.googlesource.com/external/github.com/google/fuzztest.git#commit=b5dbc33890d9586e4f6a213f1bf163ad287e6aa4
        chromium-mirror_third_party_libaddressinput_src::git+https://chromium.googlesource.com/external/libaddressinput.git#commit=e8712e415627f22d0b00ebee8db99547077f39bd
        chromium-mirror_third_party_libaom_source_libaom::git+https://aomedia.googlesource.com/aom.git#commit=1dbe1c7fae2456f91ccc79fecb919e9ffea0727a
        chromium-mirror_third_party_libavif_src::git+https://chromium.googlesource.com/external/github.com/AOMediaCodec/libavif.git#commit=1a78d970b8315e7cc6a8601861ec75189c50c214
        chromium-mirror_third_party_libavifinfo_src::git+https://aomedia.googlesource.com/libavifinfo.git#commit=b496868f7c3fd17dfeeecc0364fe37e19edd548a
        chromium-mirror_third_party_nearby_src::git+https://chromium.googlesource.com/external/github.com/google/nearby-connections.git#commit=629e7ba7c964a62c97f6a882bffaec3c8490bb1e
        chromium-mirror_third_party_beto-core_src::git+https://beto-core.googlesource.com/beto-core.git#commit=b902b346037ea3f4aadf8177021f6f917b16e648
        chromium-mirror_third_party_securemessage_src::git+https://chromium.googlesource.com/external/github.com/google/securemessage.git#commit=fa07beb12babc3b25e0c5b1f38c16aa8cb6b8f84
        chromium-mirror_third_party_speedometer_v3.0::git+https://chromium.googlesource.com/external/github.com/WebKit/Speedometer.git#commit=5107c739c1b2a008e7293e3b489c4f80a8fb2e01
        chromium-mirror_third_party_ukey2_src::git+https://chromium.googlesource.com/external/github.com/google/ukey2.git#commit=0275885d8e6038c39b8a8ca55e75d1d4d1727f47
        chromium-mirror_third_party_cros-components_src::git+https://chromium.googlesource.com/external/google3/cros_components.git#commit=25159cae8d540780cbeb994692ce4a3ea14cc094
        chromium-mirror_third_party_libdrm_src::git+https://chromium.googlesource.com/chromiumos/third_party/libdrm.git#commit=98e1db501173303e58ef6a1def94ab7a2d84afc1
        chromium-mirror_third_party_expat_src::git+https://chromium.googlesource.com/external/github.com/libexpat/libexpat.git#commit=441f98d02deafd9b090aea568282b28f66a50e36
        chromium-mirror_third_party_libipp_libipp::git+https://chromium.googlesource.com/chromiumos/platform2/libipp.git#commit=2209bb84a8e122dab7c02fe66cc61a7b42873d7f
        chromium-mirror_third_party_libjpeg_turbo::git+https://chromium.googlesource.com/chromium/deps/libjpeg_turbo.git#commit=9b894306ec3b28cea46e84c32b56773a98c483da
        chromium-mirror_third_party_liblouis_src::git+https://chromium.googlesource.com/external/liblouis-github.git#commit=9700847afb92cb35969bdfcbbfbbb74b9c7b3376
        chromium-mirror_third_party_libphonenumber_dist::git+https://chromium.googlesource.com/external/libphonenumber.git#commit=140dfeb81b753388e8a672900fb7a971e9a0d362
        chromium-mirror_third_party_libprotobuf-mutator_src::git+https://chromium.googlesource.com/external/github.com/google/libprotobuf-mutator.git#commit=a304ec48dcf15d942607032151f7e9ee504b5dcf
        chromium-mirror_third_party_libsrtp::git+https://chromium.googlesource.com/chromium/deps/libsrtp.git#commit=5b7c744eb8310250ccc534f3f86a2015b3887a0a
        chromium-mirror_third_party_libsync_src::git+https://chromium.googlesource.com/aosp/platform/system/core/libsync.git#commit=f4f4387b6bf2387efbcfd1453af4892e8982faf6
        chromium-mirror_third_party_libvpx_source_libvpx::git+https://chromium.googlesource.com/webm/libvpx.git#commit=424723dc025ce451dab9568239a46b18d0919b4d
        chromium-mirror_third_party_libwebm_source::git+https://chromium.googlesource.com/webm/libwebm.git#commit=e4fbea0c9751ae8aa86629b197a28d8276a2b0da
        chromium-mirror_third_party_libwebp_src::git+https://chromium.googlesource.com/webm/libwebp.git#commit=ca332209cb5567c9b249c86788cb2dbf8847e760
        chromium-mirror_third_party_libyuv::git+https://chromium.googlesource.com/libyuv/libyuv.git#commit=04821d1e7d60845525e8db55c7bcd41ef5be9406
        chromium-mirror_third_party_lss::git+https://chromium.googlesource.com/linux-syscall-support.git#commit=ce877209e11aa69dcfffbd53ef90ea1d07136521
        chromium-mirror_third_party_material_color_utilities_src::git+https://chromium.googlesource.com/external/github.com/material-foundation/material-color-utilities.git#commit=234a000e507d586c20df6e3bf5b9e035bc5ce7b1
        chromium-mirror_third_party_minigbm_src::git+https://chromium.googlesource.com/chromiumos/platform/minigbm.git#commit=3018207f4d89395cc271278fb9a6558b660885f5
        chromium-mirror_third_party_nasm::git+https://chromium.googlesource.com/chromium/deps/nasm.git#commit=7fc833e889d1afda72c06220e5bed8fb43b2e5ce
        chromium-mirror_third_party_neon_2_sse_src::git+https://chromium.googlesource.com/external/github.com/intel/ARM_NEON_2_x86_SSE.git#commit=a15b489e1222b2087007546b4912e21293ea86ff
        chromium-mirror_third_party_openh264_src::git+https://chromium.googlesource.com/external/github.com/cisco/openh264.git#commit=09a4f3ec842a8932341b195c5b01e141c8a16eb7
        chromium-mirror_third_party_openscreen_src::git+https://chromium.googlesource.com/openscreen.git#commit=971d6055e7b78c474e2e734e55a2991fbb7ab665
        chromium-mirror_third_party_openxr_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/OpenXR-SDK.git#commit=58a00cf85c39ad5ec4dc43a769624e420c06179a
        chromium-mirror_third_party_pdfium::git+https://pdfium.googlesource.com/pdfium.git#commit=a3895af47f600e3f9677f31fa39e15bd01c18457
        chromium-mirror_third_party_perfetto::git+https://android.googlesource.com/platform/external/perfetto.git#commit=7ce535ddfc62d30166f35a8ed0f121da5eb0437c
        chromium-mirror_third_party_pthreadpool_src::git+https://chromium.googlesource.com/external/github.com/Maratyszcza/pthreadpool.git#commit=4fe0e1e183925bf8cfa6aae24237e724a96479b8
        chromium-mirror_third_party_pyelftools::git+https://chromium.googlesource.com/chromiumos/third_party/pyelftools.git#commit=19b3e610c86fcadb837d252c794cb5e8008826ae
        chromium-mirror_third_party_quic_trace_src::git+https://chromium.googlesource.com/external/github.com/google/quic-trace.git#commit=caa0a6eaba816ecb737f9a70782b7c80b8ac8dbc
        chromium-mirror_third_party_pywebsocket3_src::git+https://chromium.googlesource.com/external/github.com/GoogleChromeLabs/pywebsocket3.git#commit=50602a14f1b6da17e0b619833a13addc6ea78bc2
        chromium-mirror_third_party_re2_src::git+https://chromium.googlesource.com/external/github.com/google/re2.git#commit=3d9bdbd0e208d3274a1cb1275c94d8b7626ddde2
        chromium-mirror_third_party_ruy_src::git+https://chromium.googlesource.com/external/github.com/google/ruy.git#commit=6ffa93a89376555b09134c59b84d8f5e9cfc6ce6
        chromium-mirror_third_party_skia::git+https://skia.googlesource.com/skia.git#commit=349c1179c43ef46f2804404952b9460dc007d76a
        chromium-mirror_third_party_smhasher_src::git+https://chromium.googlesource.com/external/smhasher.git#commit=e87738e57558e0ec472b2fc3a643b838e5b6e88f
        chromium-mirror_third_party_snappy_src::git+https://chromium.googlesource.com/external/github.com/google/snappy.git#commit=c9f9edf6d75bb065fa47468bf035e051a57bec7c
        chromium-mirror_third_party_sqlite_src::git+https://chromium.googlesource.com/chromium/deps/sqlite.git#commit=cd9486849ba3c3ec753f556fd29c0aabee122a28
        chromium-mirror_third_party_swiftshader::git+https://swiftshader.googlesource.com/SwiftShader.git#commit=d9ec9befba05a8dfca09c1e88f3f7be0e4b153c6
        chromium-mirror_third_party_text-fragments-polyfill_src::git+https://chromium.googlesource.com/external/github.com/GoogleChromeLabs/text-fragments-polyfill.git#commit=c036420683f672d685e27415de0a5f5e85bdc23f
        chromium-mirror_third_party_tflite_src::git+https://chromium.googlesource.com/external/github.com/tensorflow/tensorflow.git#commit=21e56c30e480ac67bed48335a5d122c59a6a6805
        chromium-mirror_third_party_vulkan-deps::git+https://chromium.googlesource.com/vulkan-deps.git#commit=2b783ed328d3a46e6a7a21218ced6b4dd1684114
        chromium-mirror_third_party_vulkan_memory_allocator::git+https://chromium.googlesource.com/external/github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git#commit=56300b29fbfcc693ee6609ddad3fdd5b7a449a21
        chromium-mirror_third_party_wayland_src::git+https://chromium.googlesource.com/external/anongit.freedesktop.org/git/wayland/wayland.git#commit=3fda2fbf51db54398c0155facee82cc9533958a2
        chromium-mirror_third_party_wayland-protocols_src::git+https://chromium.googlesource.com/external/anongit.freedesktop.org/git/wayland/wayland-protocols.git#commit=4624cfaaf563cd7be5e2e2087c8de6d3a48ea867
        chromium-mirror_third_party_wayland-protocols_kde::git+https://chromium.googlesource.com/external/github.com/KDE/plasma-wayland-protocols.git#commit=0b07950714b3a36c9b9f71fc025fc7783e82926e
        chromium-mirror_third_party_wayland-protocols_gtk::git+https://chromium.googlesource.com/external/github.com/GNOME/gtk.git#commit=40ebed3a03aef096addc0af09fec4ec529d882a0
        chromium-mirror_third_party_webdriver_pylib::git+https://chromium.googlesource.com/external/github.com/SeleniumHQ/selenium/py.git#commit=fc5e7e70c098bfb189a9a74746809ad3c5c34e04
        chromium-mirror_third_party_webgl_src::git+https://chromium.googlesource.com/external/khronosgroup/webgl.git#commit=f4bf599a8b575df685c31d9c4729a70a04e377ed
        chromium-mirror_third_party_webgpu-cts_src::git+https://chromium.googlesource.com/external/github.com/gpuweb/cts.git#commit=3dbe4ce12983ccc1ad42e228057c7d8adc17cb78
        chromium-mirror_third_party_webrtc::git+https://webrtc.googlesource.com/src.git#commit=5ab829e4ca8f63be6b4ed1d98eee382d7307d34e
        chromium-mirror_third_party_wuffs_src::git+https://skia.googlesource.com/external/github.com/google/wuffs-mirror-release-c.git#commit=fe9d08f2b6e80af691bfb1a718e144c49a1b9eba
        chromium-mirror_third_party_weston_src::git+https://chromium.googlesource.com/external/anongit.freedesktop.org/git/wayland/weston.git#commit=ccf29cb237c3ed09c5f370f35239c93d07abfdd7
        chromium-mirror_third_party_xdg-utils::git+https://chromium.googlesource.com/chromium/deps/xdg-utils.git#commit=cb54d9db2e535ee4ef13cc91b65a1e2741a94a44
        chromium-mirror_third_party_xnnpack_src::git+https://chromium.googlesource.com/external/github.com/google/XNNPACK.git#commit=bbbaa7352a3ea729987d3e654d37be93e8009691
        chromium-mirror_tools_page_cycler_acid3::git+https://chromium.googlesource.com/chromium/deps/acid3.git#commit=a926d0a32e02c4c03ae95bb798e6c780e0e184ba
        chromium-mirror_third_party_zstd_src::git+https://chromium.googlesource.com/external/github.com/facebook/zstd.git#commit=cdceb0fce59785c841bf697e00067163106064e1
        chromium-mirror_v8::git+https://chromium.googlesource.com/v8/v8.git#commit=71b6b5a68e0883c155e01368aace6eb6d71b85f3
        chromium-mirror_third_party_angle_third_party_glmark2_src::git+https://chromium.googlesource.com/external/github.com/glmark2/glmark2.git#commit=ca8de51fedb70bace5351c6b002eb952c747e889
        chromium-mirror_third_party_angle_third_party_rapidjson_src::git+https://chromium.googlesource.com/external/github.com/Tencent/rapidjson.git#commit=781a4e667d84aeedbeb8184b7b62425ea66ec59f
        chromium-mirror_third_party_angle_third_party_VK-GL-CTS_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/VK-GL-CTS.git#commit=7d738783bf286e82937e431c295d4682f3767267
        chromium-mirror_third_party_dawn_buildtools::git+https://chromium.googlesource.com/chromium/src/buildtools.git#commit=a9a6f0c49d0e8fa0cda37337430b4736ab3dc944
        chromium-mirror_third_party_dawn_build::git+https://chromium.googlesource.com/chromium/src/build.git#commit=e2f4d00875f7d00fad39d5af2c6869ac7c7413cc
        chromium-mirror_third_party_dawn_tools_clang::git+https://chromium.googlesource.com/chromium/src/tools/clang.git#commit=86aed39db276fb876a2b98c93cc6ff8940377903
        chromium-mirror_third_party_dawn_testing::git+https://chromium.googlesource.com/chromium/src/testing.git#commit=035a9b18047370df7403758b006e6c9696d6b84d
        chromium-mirror_third_party_dawn_third_party_jinja2::git+https://chromium.googlesource.com/chromium/src/third_party/jinja2.git#commit=515dd10de9bf63040045902a4a310d2ba25213a0
        chromium-mirror_third_party_dawn_third_party_markupsafe::git+https://chromium.googlesource.com/chromium/src/third_party/markupsafe.git#commit=006709ba3ed87660a17bd4548c45663628f5ed85
        chromium-mirror_third_party_dawn_third_party_glfw::git+https://chromium.googlesource.com/external/github.com/glfw/glfw.git#commit=62e175ef9fae75335575964c845a302447c012c7
        chromium-mirror_third_party_dawn_third_party_zlib::git+https://chromium.googlesource.com/chromium/src/third_party/zlib.git#commit=526382e41c9c5275dc329db4328b54e4f344a204
        chromium-mirror_third_party_dawn_third_party_abseil-cpp::git+https://chromium.googlesource.com/chromium/src/third_party/abseil-cpp.git#commit=4ef9b33175828ea46d091e7e5ec28259d39a8ba5
        chromium-mirror_third_party_dawn_third_party_dxc::git+https://chromium.googlesource.com/external/github.com/microsoft/DirectXShaderCompiler.git#commit=64030a4e01e27c608b6c5f1ab5add43575e086f9
        chromium-mirror_third_party_dawn_third_party_dxheaders::git+https://chromium.googlesource.com/external/github.com/microsoft/DirectX-Headers.git#commit=980971e835876dc0cde415e8f9bc646e64667bf7
        chromium-mirror_third_party_dawn_third_party_khronos_OpenGL-Registry::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/OpenGL-Registry.git#commit=5bae8738b23d06968e7c3a41308568120943ae77
        chromium-mirror_third_party_dawn_third_party_khronos_EGL-Registry::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/EGL-Registry.git#commit=7dea2ed79187cd13f76183c4b9100159b9e3e071
        chromium-mirror_third_party_dawn_third_party_protobuf_electron28::git+https://chromium.googlesource.com/external/github.com/protocolbuffers/protobuf.git#commit=2b673bbb57e34fe1bd4570f726fc86b769a3a3d2
        chromium-mirror_third_party_dawn_third_party_partition_alloc::git+https://chromium.googlesource.com/chromium/src/base/allocator/partition_allocator.git#commit=6f90cb04abb81942abaab7b63d34c02882208172
        chromium-mirror_third_party_openscreen_src_third_party_tinycbor_src::git+https://chromium.googlesource.com/external/github.com/intel/tinycbor.git#commit=d393c16f3eb30d0c47e6f9d92db62272f0ec4dc7
        chromium-mirror_third_party_vulkan-deps_glslang_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/glslang.git#commit=ebb0a8b28e5ea7a13146a24b3ad87b1966dbdfa3
        chromium-mirror_third_party_vulkan-deps_spirv-cross_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/SPIRV-Cross.git#commit=2de1265fca722929785d9acdec4ab728c47a0254
        chromium-mirror_third_party_vulkan-deps_spirv-headers_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/SPIRV-Headers.git#commit=88bc5e321c2839707df8b1ab534e243e00744177
        chromium-mirror_third_party_vulkan-deps_spirv-tools_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/SPIRV-Tools.git#commit=5084f58e5d187b16f84d2af936ff94ea2f46a00c
        chromium-mirror_third_party_vulkan-deps_vulkan-headers_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Headers.git#commit=f4bfcd885214675a6a0d7d4df07f52b511e6ea16
        chromium-mirror_third_party_vulkan-deps_vulkan-loader_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Loader.git#commit=7b7d15bc9f1d782e4d6ea34e61fd9a36a7952208
        chromium-mirror_third_party_vulkan-deps_vulkan-tools_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Tools.git#commit=f7017f23337b90a2b2ceb65a4e1050e8ad89e065
        chromium-mirror_third_party_vulkan-deps_vulkan-utility-libraries_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Utility-Libraries.git#commit=dcfce25b439a2785f2c90b184e1964898070b4f1
        chromium-mirror_third_party_vulkan-deps_vulkan-validation-layers_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-ValidationLayers.git#commit=281e1c1c6b51bb6b33f88c18ed4da58ac3024311
        # END managed sources
       )
sha256sums=('SKIP'
            'ffee1082fbe3d0c9e79dacb8405d5a0e1aa94d6745089a30b093f647354894d2'
            'dd2d248831dd4944d385ebf008426e66efe61d6fdf66f8932c963a12167947b4'
            '8d1cdf3ddd8ff98f302c90c13953f39cd804b3479b13b69b8ef138ac57c83556'
            'b0ac3422a6ab04859b40d4d7c0fd5f703c893c9ec145c9894c468fbc0a4d457c'
            '4484200d90b76830b69eea3a471c103999a3ce86bb2c29e6c14c945bf4102bae'
            'ff9ebd86b0010e1c604d47303ab209b1d76c3e888c423166779cefbc22de297f'
            '55dbe71dbc1f3ab60bf1fa79f7aea7ef1fe76436b1d7df48728a1f8227d2134e'
            '1808df5ba4d1e2f9efa07ac6b510bec866fa6d60e44505d82aea3f6072105a71'
            'ff588a8a4fd2f79eb8a4f11cf1aa151298ffb895be566c57cc355d47f161f53f'
            '3ae82375ba212c31fd4ba6f1fa4e2445eeca8eb8c952176131ad57c0258db224'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

# Possible replacements are listed in build/linux/unbundle/replace_gn_files.py
# Keys are the names in the above script; values are the dependencies in Arch
# plus any so names that are provided + linked
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
  rbash prepare-electron-source-tree.sh "$CARCH"
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

  ## Upstream fixes

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

  local _clang_version=$(
    clang --version | grep -m1 version | sed 's/.* \([0-9]\+\).*/\1/')

  _flags+=(
    "clang_version=\"$_clang_version\""
  )

  # Allow the use of nightly features with stable Rust compiler
  # https://github.com/ungoogled-software/ungoogled-chromium/pull/2696#issuecomment-1918173198
  export RUSTC_BOOTSTRAP=1

  _flags+=(
    "rustc_version=\"$(rustc --version)\""
  )

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
