# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Pascal Ernster <archlinux@hardfalcon.net>
# Contributor: loqs <bugs-archlinux@entropy-collector.net>
# Contributor: kxxt <rsworktech@outlook.com>

# https://releases.electronjs.org/
# https://github.com/stha09/chromium-patches/releases

# Note: source array can be synced with an Electron release after updating $pkgver with:
# bash -c 'source PKGBUILD; _update_sources'

pkgver=22.3.27
_gcc_patches=108-patchset-2
pkgrel=5

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
         nss # libnss3.so
         wayland
         zlib libz.so)
makedepends=(clang
             git
             gn
             gperf
             harfbuzz-icu
             http-parser
             java-runtime-headless
             libnotify
             lld
             llvm
             ninja
             # Electron ships a vendored nodejs. Meanwhile the npm dependency pulls in nodejs whith is Arch's freshest version.
             # Pinning the closest LTS here makes the build environment more consistent with the vendored copy.
             # nodejs-lts-gallium TODO: use this when dropping to AUR
             nodejs-lts-hydrogen # not correct, but better than nothing
             npm
             patchutils
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
            'libappindicator-gtk3: StatusNotifierItem support'
            'pipewire: WebRTC desktop sharing under Wayland'
            'qt5-base: enable Qt5 with --enable-features=AllowQt'
            'trash-cli: file deletion support (trash-put)'
            'xdg-utils: open URLs with desktop’s default (xdg-email, xdg-open)')
options=('!lto') # Electron adds its own flags for ThinLTO
source=("git+https://github.com/electron/electron.git#tag=v$pkgver"
        "https://github.com/stha09/chromium-patches/releases/download/chromium-$_gcc_patches/chromium-$_gcc_patches.tar.xz"
        REVERT-roll-src-third_party-ffmpeg-m102.patch
        REVERT-roll-src-third_party-ffmpeg-m106.patch
        add-missing-includes-causing-build-errors.patch
        angle-wayland-include-protocol.patch
        chromium-icu72.patch
        comp-viz-add-cstdint.patch
        dawn-iwyu-add-cstdint-for-uint8_t.patch
        dawn-tint-add-cstdint.patch
        default_app-icon.patch
        electron-launcher.sh
        electron.desktop
        https://github.com/google/angle/commit/5d1ac2e0d5f61913aad62dadb65a7fea6f1b93ae.patch
        icu-74.patch
        iwyu-add-cstdint-for-int-types-in-s2cellid.patch
        iwyu-add-cstdint-for-uintptr_t-in-device.patch
        iwyu-add-stdint.h-for-int-types-in-gpu_feature_info.patch
        iwyu-add-stdint.h-for-integer-types-in-ui.patch
        iwyu-add-stdint.h-for-uint32_t-in-cc.patch
        iwyu-add-stdint.h-for-uint32_t-in-chrome_pdf.patch
        iwyu-add-stdint.h-for-uint64_t-in-EncounteredSurface.patch
        iwyu-add-stdint.h-for-various-int-types-in-base.patch
        iwyu-add-stdint.h-for-various-int-types-in-comp.patch
        iwyu-add-stdint.h-for-various-integer-types-in-net.patch
        jinja-python-3.10.patch
        libxml2-2.12.patch
        more-fixes-for-gcc13.patch
        openscreen-iwyu-add-stdint.h.patch
        pdfium-iwyu-add-stdint.h-for-uint32_t.patch
        random-fixes-for-gcc13.patch
        re-fix-TFLite-build-error-on-linux-with-system-zlib.patch
        std-vector-non-const.patch
        swiftshader-add-cstdint-for-uint64_t.patch
        use-system-libraries-in-node.patch
        v8-enhance-Date-parser-to-take-Unicode-SPACE.patch
        makepkg-source-roller.py
        # BEGIN managed sources
        chromium-mirror::git+https://github.com/chromium/chromium.git#tag=108.0.5359.215
        chromium-mirror_third_party_nan::git+https://github.com/nodejs/nan.git#commit=16fa32231e2ccd89d2804b3f765319128b20c4ac
        chromium-mirror_third_party_electron_node::git+https://github.com/nodejs/node.git#tag=v16.17.1
        chromium-mirror_buildtools_clang_format_script::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/clang/tools/clang-format.git#commit=8b525d2747f2584fc35d8c7e612e66f377858df7
        chromium-mirror_buildtools_third_party_libc++_trunk::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/libcxx.git#commit=64d36e572d3f9719c5d75011a718f33f11126851
        chromium-mirror_buildtools_third_party_libc++abi_trunk::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/libcxxabi.git#commit=9572e56a12c88c011d504a707ca94952be4664f9
        chromium-mirror_buildtools_third_party_libunwind_trunk::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/libunwind.git#commit=1111799723f6a003e6f52202b9bf84387c552081
        chromium-mirror_chrome_test_data_perf_canvas_bench::git+https://chromium.googlesource.com/chromium/canvas_bench.git#commit=a7b40ea5ae0239517d78845a5fc9b12976bfc732
        chromium-mirror_chrome_test_data_perf_frame_rate_content::git+https://chromium.googlesource.com/chromium/frame_rate/content.git#commit=c10272c88463efeef6bb19c9ec07c42bc8fe22b9
        chromium-mirror_chrome_test_data_xr_webvr_info::git+https://chromium.googlesource.com/external/github.com/toji/webvr.info.git#commit=c58ae99b9ff9e2aa4c524633519570bf33536248
        chromium-mirror_media_cdm_api::git+https://chromium.googlesource.com/chromium/cdm.git#commit=fef0b5aa1bd31efb88dfab804bdbe614f3d54f28
        chromium-mirror_native_client::git+https://chromium.googlesource.com/native_client/src/native_client.git#commit=7d275eb5878e29cf3d7338617c1e0c5e5856195a
        chromium-mirror_net_third_party_quiche_src::git+https://quiche.googlesource.com/quiche.git#commit=a338ea8277642f6d78022dc8e3aaed182a804413
        chromium-mirror_third_party_android_ndk::git+https://chromium.googlesource.com/android_ndk.git#commit=8388a2be5421311dc75c5f937aae13d821a27f3d
        chromium-mirror_third_party_angle::git+https://chromium.googlesource.com/angle/angle.git#commit=ceec659ac60b0c8ee9d9c602ca1a878ec1d3a88f
        chromium-mirror_third_party_content_analysis_sdk_src::git+https://chromium.googlesource.com/external/github.com/chromium/content_analysis_sdk.git#commit=3d3f3d6f27288d7b0628ae5259238162c5e5ae76
        chromium-mirror_third_party_dav1d_libdav1d::git+https://chromium.googlesource.com/external/github.com/videolan/dav1d.git#commit=87f9a81cd770e49394a45deca7a3df41243de00b
        chromium-mirror_third_party_dawn::git+https://dawn.googlesource.com/dawn.git#commit=b8f6a47669f5e32ad7e65eac4ff9d26d2c43927f
        chromium-mirror_third_party_libjxl_src::git+https://chromium.googlesource.com/external/github.com/libjxl/libjxl.git#commit=8001738dc9cd8dc6fa24cf75fefd08f909b2ac3c
        chromium-mirror_third_party_highway_src::git+https://chromium.googlesource.com/external/github.com/google/highway.git#commit=8ae5b88670fb918f815b717c7c13d38a9b0eb4bb
        chromium-mirror_third_party_boringssl_src::git+https://boringssl.googlesource.com/boringssl.git#commit=1ccef4908ce04adc6d246262846f3cd8a111fa44
        chromium-mirror_third_party_breakpad_breakpad::git+https://chromium.googlesource.com/breakpad/breakpad.git#commit=e085b3b50bde862d0cf3ce4594e3f391bcf5faec
        chromium-mirror_third_party_cast_core_public_src::git+https://chromium.googlesource.com/cast_core/public.git#commit=469e045e514c09701ab674d023cbaa6562866f83
        chromium-mirror_third_party_catapult::git+https://chromium.googlesource.com/catapult.git#commit=4793433248183dd073e608f655204d4acfdc7193
        chromium-mirror_third_party_ced_src::git+https://chromium.googlesource.com/external/github.com/google/compact_enc_det.git#commit=ba412eaaacd3186085babcd901679a48863c7dd5
        chromium-mirror_third_party_cld_3_src::git+https://chromium.googlesource.com/external/github.com/google/cld_3.git#commit=b48dc46512566f5a2d41118c8c1116c4f96dc661
        chromium-mirror_third_party_colorama_src::git+https://chromium.googlesource.com/external/colorama.git#commit=799604a1041e9b3bc5d2789ecbd7e8db2e18e6b8
        chromium-mirror_third_party_cpuinfo_src::git+https://chromium.googlesource.com/external/github.com/pytorch/cpuinfo.git#commit=beb46ca0319882f262e682dd596880c92830687f
        chromium-mirror_third_party_crc32c_src::git+https://chromium.googlesource.com/external/github.com/google/crc32c.git#commit=fa5ade41ee480003d9c5af6f43567ba22e4e17e6
        chromium-mirror_third_party_cros_system_api::git+https://chromium.googlesource.com/chromiumos/platform2/system_api.git#commit=67bca80707449bad87a17de8c937634ff1ab3272
        chromium-mirror_third_party_crubit_src::git+https://chromium.googlesource.com/external/github.com/google/crubit.git#commit=2c34caee7c3b4c2dfbcb0e935efcbc05ebc0f61d
        chromium-mirror_third_party_depot_tools::git+https://chromium.googlesource.com/chromium/tools/depot_tools.git#commit=2c0a8c736a59044e4acc7be9e172343adc5c4310
        chromium-mirror_third_party_devtools-frontend_src::git+https://chromium.googlesource.com/devtools/devtools-frontend.git#commit=33bb29b551b54b0ac67025e8b3e0ce69352c9504
        chromium-mirror_third_party_dom_distiller_js_dist::git+https://chromium.googlesource.com/chromium/dom-distiller/dist.git#commit=199de96b345ada7c6e7e6ba3d2fa7a6911b8767d
        chromium-mirror_third_party_eigen3_src::git+https://chromium.googlesource.com/external/gitlab.com/libeigen/eigen.git#commit=b3bf8d6a13585ff248c079402654647d298de60b
        chromium-mirror_third_party_farmhash_src::git+https://chromium.googlesource.com/external/github.com/google/farmhash.git#commit=816a4ae622e964763ca0862d9dbd19324a1eaf45
        chromium-mirror_third_party_ffmpeg::git+https://chromium.googlesource.com/chromium/third_party/ffmpeg.git#commit=b9f01c3c54576330b2cf8918c54d5ee5be8faefe
        chromium-mirror_third_party_flac::git+https://chromium.googlesource.com/chromium/deps/flac.git#commit=af862024c8c8fa0ae07ced05e89013d881b00596
        chromium-mirror_third_party_flatbuffers_src::git+https://chromium.googlesource.com/external/github.com/google/flatbuffers.git#commit=0fe13cb28ce5a3fb81f654b21cb37c9821194962
        chromium-mirror_third_party_fontconfig_src::git+https://chromium.googlesource.com/external/fontconfig.git#commit=452be8125f0e2a18a7dfef469e05d19374d36307
        chromium-mirror_third_party_fp16_src::git+https://chromium.googlesource.com/external/github.com/Maratyszcza/FP16.git#commit=4dfe081cf6bcd15db339cf2680b9281b8451eeb3
        chromium-mirror_third_party_gemmlowp_src::git+https://chromium.googlesource.com/external/github.com/google/gemmlowp.git#commit=13d57703abca3005d97b19df1f2db731607a7dc2
        chromium-mirror_third_party_grpc_src::git+https://chromium.googlesource.com/external/github.com/grpc/grpc.git#commit=dd77c67217b10ffeaf766e25eb8b46d2d59de4ff
        chromium-mirror_third_party_freetype_src::git+https://chromium.googlesource.com/chromium/src/third_party/freetype2.git#commit=0b62c1e43dc4b0e3c50662aac757e4f7321e5466
        chromium-mirror_third_party_freetype-testing_src::git+https://chromium.googlesource.com/external/github.com/freetype/freetype2-testing.git#commit=7a69b1a2b028476f840ab7d4a2ffdfe4eb2c389f
        chromium-mirror_third_party_fxdiv_src::git+https://chromium.googlesource.com/external/github.com/Maratyszcza/FXdiv.git#commit=63058eff77e11aa15bf531df5dd34395ec3017c8
        chromium-mirror_third_party_harfbuzz-ng_src::git+https://chromium.googlesource.com/external/github.com/harfbuzz/harfbuzz.git#commit=56c467093598ec559a7148b61e112e9de52b7076
        chromium-mirror_third_party_emoji-segmenter_src::git+https://chromium.googlesource.com/external/github.com/google/emoji-segmenter.git#commit=9ba6d25d0d9313569665d4a9d2b34f0f39f9a50e
        chromium-mirror_third_party_ots_src::git+https://chromium.googlesource.com/external/github.com/khaledhosny/ots.git#commit=46bea9879127d0ff1c6601b078e2ce98e83fcd33
        chromium-mirror_third_party_libgav1_src::git+https://chromium.googlesource.com/codecs/libgav1.git#commit=cd53f7c0d6a1c005e38874d143c8876d375bae70
        chromium-mirror_third_party_googletest_src::git+https://chromium.googlesource.com/external/github.com/google/googletest.git#commit=af29db7ec28d6df1c7f0f745186884091e602e07
        chromium-mirror_third_party_hunspell_dictionaries::git+https://chromium.googlesource.com/chromium/deps/hunspell_dictionaries.git#commit=41cdffd71c9948f63c7ad36e1fb0ff519aa7a37e
        chromium-mirror_third_party_icu::git+https://chromium.googlesource.com/chromium/deps/icu.git#commit=da07448619763d1cde255b361324242646f5b268
        chromium-mirror_third_party_jsoncpp_source::git+https://chromium.googlesource.com/external/github.com/open-source-parsers/jsoncpp.git#commit=42e892d96e47b1f6e29844cc705e148ec4856448
        chromium-mirror_third_party_leveldatabase_src::git+https://chromium.googlesource.com/external/leveldb.git#commit=d019e3605f222ebc5a3a2484a2cb29db537551dd
        chromium-mirror_third_party_libFuzzer_src_electron22::git+https://chromium.googlesource.com/chromium/llvm-project/compiler-rt/lib/fuzzer.git#commit=debe7d2d1982e540fbd6bd78604bf001753f9e74
        chromium-mirror_third_party_libaddressinput_src::git+https://chromium.googlesource.com/external/libaddressinput.git#commit=df35d6c42da4fa2759e4cfb592afe33817993b89
        chromium-mirror_third_party_libaom_source_libaom::git+https://aomedia.googlesource.com/aom.git#commit=fcf671adc2f301c2d1fe3cfa6d545d59c5084d3d
        chromium-mirror_third_party_libavif_src::git+https://chromium.googlesource.com/external/github.com/AOMediaCodec/libavif.git#commit=de7e6c0d98abcd6843c4a9bf4cee731141dca566
        chromium-mirror_third_party_nearby_src::git+https://chromium.googlesource.com/external/github.com/google/nearby-connections.git#commit=4bd0337c105c502de845ba9501ad6e0350f613b9
        chromium-mirror_third_party_securemessage_src::git+https://chromium.googlesource.com/external/github.com/google/securemessage.git#commit=fa07beb12babc3b25e0c5b1f38c16aa8cb6b8f84
        chromium-mirror_third_party_ukey2_src::git+https://chromium.googlesource.com/external/github.com/google/ukey2.git#commit=0275885d8e6038c39b8a8ca55e75d1d4d1727f47
        chromium-mirror_third_party_cros_components::git+https://chromium.googlesource.com/external/google3/cros_components.git#commit=a0979aacb8744f42ed7abd966a6b0ac7578a73e9
        chromium-mirror_third_party_libdrm_src::git+https://chromium.googlesource.com/chromiumos/third_party/libdrm.git#commit=56f81e6776c1c100c3f627b2c1feb9dcae2aad3c
        chromium-mirror_third_party_expat_src::git+https://chromium.googlesource.com/external/github.com/libexpat/libexpat.git#commit=53fbdf5b8925a426e1b41a9e09b833986b87524e
        chromium-mirror_third_party_libipp_libipp::git+https://chromium.googlesource.com/chromiumos/platform2/libipp.git#commit=6c45a4f3a05cb5dd700414fe4d94cf685159d3ce
        chromium-mirror_third_party_libjpeg_turbo::git+https://chromium.googlesource.com/chromium/deps/libjpeg_turbo.git#commit=ed683925e4897a84b3bffc5c1414c85b97a129a3
        chromium-mirror_third_party_liblouis_src::git+https://chromium.googlesource.com/external/liblouis-github.git#commit=9700847afb92cb35969bdfcbbfbbb74b9c7b3376
        chromium-mirror_third_party_libphonenumber_dist::git+https://chromium.googlesource.com/external/libphonenumber.git#commit=140dfeb81b753388e8a672900fb7a971e9a0d362
        chromium-mirror_third_party_libprotobuf-mutator_src::git+https://chromium.googlesource.com/external/github.com/google/libprotobuf-mutator.git#commit=a304ec48dcf15d942607032151f7e9ee504b5dcf
        chromium-mirror_third_party_libsrtp::git+https://chromium.googlesource.com/chromium/deps/libsrtp.git#commit=5b7c744eb8310250ccc534f3f86a2015b3887a0a
        chromium-mirror_third_party_libsync_src::git+https://chromium.googlesource.com/aosp/platform/system/core/libsync.git#commit=f4f4387b6bf2387efbcfd1453af4892e8982faf6
        chromium-mirror_third_party_libvpx_source_libvpx::git+https://chromium.googlesource.com/webm/libvpx.git#commit=9d6d0624d7943a09cc0be9df1a7402522989ac1a
        chromium-mirror_third_party_libwebm_source::git+https://chromium.googlesource.com/webm/libwebm.git#commit=e4fbea0c9751ae8aa86629b197a28d8276a2b0da
        chromium-mirror_third_party_libwebp_src::git+https://chromium.googlesource.com/webm/libwebp.git#commit=7366f7f394af26de814296152c50e673ed0a832f
        chromium-mirror_third_party_libyuv::git+https://chromium.googlesource.com/libyuv/libyuv.git#commit=00950840d1c9bcbb3eb6ebc5aac5793e71166c8b
        chromium-mirror_third_party_lss::git+https://chromium.googlesource.com/linux-syscall-support.git#commit=ce877209e11aa69dcfffbd53ef90ea1d07136521
        chromium-mirror_third_party_minigbm_src::git+https://chromium.googlesource.com/chromiumos/platform/minigbm.git#commit=d73fa7ff377919d94d4ed675cc91a070f0631548
        chromium-mirror_third_party_minizip_src::git+https://chromium.googlesource.com/external/github.com/nmoinvaz/minizip.git#commit=1ff40343b55e738d941abb51c70eddb803db16e2
        chromium-mirror_third_party_nasm::git+https://chromium.googlesource.com/chromium/deps/nasm.git#commit=9215e8e1d0fe474ffd3e16c1a07a0f97089e6224
        chromium-mirror_third_party_neon_2_sse_src::git+https://chromium.googlesource.com/external/github.com/intel/ARM_NEON_2_x86_SSE.git#commit=a15b489e1222b2087007546b4912e21293ea86ff
        chromium-mirror_third_party_openh264_src::git+https://chromium.googlesource.com/external/github.com/cisco/openh264.git#commit=fac04ceb3e966f613ed17e98178e9d690280bba6
        chromium-mirror_third_party_openscreen_src::git+https://chromium.googlesource.com/openscreen.git#commit=940f6edf1274146fa1bfbda146b98d6aa16a0887
        chromium-mirror_third_party_openxr_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/OpenXR-SDK.git#commit=bf21ccb1007bb531b45d9978919a56ea5059c245
        chromium-mirror_third_party_pdfium::git+https://pdfium.googlesource.com/pdfium.git#commit=9d2c662f557544e5edb74a60b52fb297f4c5dfee
        chromium-mirror_third_party_perfetto::git+https://android.googlesource.com/platform/external/perfetto.git#commit=280f0b23c5c8b98248cf0ccf3d011c4fd4bb74f5
        chromium-mirror_third_party_pthreadpool_src::git+https://chromium.googlesource.com/external/github.com/Maratyszcza/pthreadpool.git#commit=1787867f6183f056420e532eec640cba25efafea
        chromium-mirror_third_party_pyelftools::git+https://chromium.googlesource.com/chromiumos/third_party/pyelftools.git#commit=19b3e610c86fcadb837d252c794cb5e8008826ae
        chromium-mirror_third_party_quic_trace_src::git+https://chromium.googlesource.com/external/github.com/google/quic-trace.git#commit=c7b993eb750e60c307e82f75763600d9c06a6de1
        chromium-mirror_third_party_pywebsocket3_src::git+https://chromium.googlesource.com/external/github.com/GoogleChromeLabs/pywebsocket3.git#commit=50602a14f1b6da17e0b619833a13addc6ea78bc2
        chromium-mirror_third_party_re2_src::git+https://chromium.googlesource.com/external/github.com/google/re2.git#commit=d2836d1b1c34c4e330a85a1006201db474bf2c8a
        chromium-mirror_third_party_ruy_src::git+https://chromium.googlesource.com/external/github.com/google/ruy.git#commit=841ea4172ba904fe3536789497f9565f2ef64129
        chromium-mirror_third_party_skia::git+https://skia.googlesource.com/skia.git#commit=8c5e09f079a3e8eeb97532cf1cbc6e0934ce40f7
        chromium-mirror_third_party_smhasher_src::git+https://chromium.googlesource.com/external/smhasher.git#commit=e87738e57558e0ec472b2fc3a643b838e5b6e88f
        chromium-mirror_third_party_snappy_src::git+https://chromium.googlesource.com/external/github.com/google/snappy.git#commit=65dc7b383985eb4f63cd3e752136db8d9b4be8c0
        chromium-mirror_third_party_sqlite_src::git+https://chromium.googlesource.com/chromium/deps/sqlite.git#commit=b48b7b78fcdf0227c59a1fde8bc7e19362239e97
        chromium-mirror_third_party_swiftshader::git+https://swiftshader.googlesource.com/SwiftShader.git#commit=b22b1b1f2dddcf5eacc8d2a37e7d27f650e1c1e2
        chromium-mirror_third_party_text-fragments-polyfill_src::git+https://chromium.googlesource.com/external/github.com/GoogleChromeLabs/text-fragments-polyfill.git#commit=c036420683f672d685e27415de0a5f5e85bdc23f
        chromium-mirror_third_party_tflite_src::git+https://chromium.googlesource.com/external/github.com/tensorflow/tensorflow.git#commit=14b52bb67edccf9f250085f83cc0e8aad03824f0
        chromium-mirror_third_party_vulkan-deps::git+https://chromium.googlesource.com/vulkan-deps.git#commit=f310d85385dfddbe1deeb05deda1045593225710
        chromium-mirror_third_party_vulkan_memory_allocator::git+https://chromium.googlesource.com/external/github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git#commit=ebe84bec02c041d28f902da0214bf442743fc907
        chromium-mirror_third_party_wayland_src::git+https://chromium.googlesource.com/external/anongit.freedesktop.org/git/wayland/wayland.git#commit=c7473676b8abc682e820546287044cee3bca9147
        chromium-mirror_third_party_wayland-protocols_src::git+https://chromium.googlesource.com/external/anongit.freedesktop.org/git/wayland/wayland-protocols.git#commit=83866f19d3d61b28e94d71781646466b3a6623d8
        chromium-mirror_third_party_wayland-protocols_kde::git+https://chromium.googlesource.com/external/github.com/KDE/plasma-wayland-protocols.git#commit=0b07950714b3a36c9b9f71fc025fc7783e82926e
        chromium-mirror_third_party_wayland-protocols_gtk::git+https://chromium.googlesource.com/external/github.com/GNOME/gtk.git#commit=40ebed3a03aef096addc0af09fec4ec529d882a0
        chromium-mirror_third_party_webdriver_pylib::git+https://chromium.googlesource.com/external/github.com/SeleniumHQ/selenium/py.git#commit=fc5e7e70c098bfb189a9a74746809ad3c5c34e04
        chromium-mirror_third_party_webgl_src::git+https://chromium.googlesource.com/external/khronosgroup/webgl.git#commit=d1b65aa5a88f6efd900604dfcda840154e9f16e2
        chromium-mirror_third_party_webgpu-cts_src::git+https://chromium.googlesource.com/external/github.com/gpuweb/cts.git#commit=eba1a78f3d741241b0dbee728561b61e9587a686
        chromium-mirror_third_party_webrtc::git+https://webrtc.googlesource.com/src.git#commit=93081d594f7efff72958a79251f53731b99e902b
        chromium-mirror_third_party_wuffs_src::git+https://skia.googlesource.com/external/github.com/google/wuffs-mirror-release-c.git#commit=a8205c2fe7564b12fea81ee028ba670112cc7719
        chromium-mirror_third_party_weston_src::git+https://chromium.googlesource.com/external/anongit.freedesktop.org/git/wayland/weston.git#commit=420cfd00f2de91de74bd9d4d8348e43c582d29f0
        chromium-mirror_third_party_xdg-utils::git+https://chromium.googlesource.com/chromium/deps/xdg-utils.git#commit=d80274d5869b17b8c9067a1022e4416ee7ed5e0d
        chromium-mirror_third_party_xnnpack_src::git+https://chromium.googlesource.com/external/github.com/google/XNNPACK.git#commit=e8f74a9763aa36559980a0c2f37f587794995622
        chromium-mirror_tools_page_cycler_acid3::git+https://chromium.googlesource.com/chromium/deps/acid3.git#commit=6be0a66a1ebd7ebc5abc1b2f405a945f6d871521
        chromium-mirror_v8::git+https://chromium.googlesource.com/v8/v8.git#commit=18a6255a7b7c82e94089589396db33b2f66f83a0
        chromium-mirror_third_party_angle_third_party_glmark2_src::git+https://chromium.googlesource.com/external/github.com/glmark2/glmark2.git#commit=ca8de51fedb70bace5351c6b002eb952c747e889
        chromium-mirror_third_party_angle_third_party_rapidjson_src::git+https://chromium.googlesource.com/external/github.com/Tencent/rapidjson.git#commit=781a4e667d84aeedbeb8184b7b62425ea66ec59f
        chromium-mirror_third_party_angle_third_party_VK-GL-CTS_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/VK-GL-CTS.git#commit=f4ed7376e1da2e720211bcddd605bc0599e91920
        chromium-mirror_third_party_dawn_build::git+https://chromium.googlesource.com/chromium/src/build.git#commit=01569374d46a14b225586c564146a8e1749520b6
        chromium-mirror_third_party_dawn_buildtools::git+https://chromium.googlesource.com/chromium/src/buildtools.git#commit=cccaf48c82bcf4ddafa6f8aa9f06014a1ef434bf
        chromium-mirror_third_party_dawn_tools_clang::git+https://chromium.googlesource.com/chromium/src/tools/clang.git#commit=a5e0d72349d028a4023927d6d166a8478355fac3
        chromium-mirror_third_party_dawn_testing::git+https://chromium.googlesource.com/chromium/src/testing.git#commit=e3e8c19554e8f47da85d35e4f990cdc30a061196
        chromium-mirror_third_party_dawn_third_party_jinja2::git+https://chromium.googlesource.com/chromium/src/third_party/jinja2.git#commit=ee69aa00ee8536f61db6a451f3858745cf587de6
        chromium-mirror_third_party_dawn_third_party_markupsafe::git+https://chromium.googlesource.com/chromium/src/third_party/markupsafe.git#commit=0944e71f4b2cb9a871bcbe353f95e889b64a611a
        chromium-mirror_third_party_dawn_third_party_glfw::git+https://chromium.googlesource.com/external/github.com/glfw/glfw.git#commit=62e175ef9fae75335575964c845a302447c012c7
        chromium-mirror_third_party_dawn_third_party_zlib::git+https://chromium.googlesource.com/chromium/src/third_party/zlib.git#commit=64bbf988543996eb8df9a86877b32917187eba8f
        chromium-mirror_third_party_dawn_third_party_abseil-cpp::git+https://chromium.googlesource.com/chromium/src/third_party/abseil-cpp.git#commit=bc3ab29356a081d0b5dd4ac55e30f4b45d8794cc
        chromium-mirror_third_party_dawn_third_party_benchmark::git+https://chromium.googlesource.com/external/github.com/google/benchmark.git#commit=e991355c02b93fe17713efe04cbc2e278e00fdbd
        chromium-mirror_third_party_dawn_third_party_protobuf_electron22::git+https://chromium.googlesource.com/external/github.com/protocolbuffers/protobuf.git#commit=fde7cf7358ec7cd69e8db9be4f1fa6a5c431386a
        chromium-mirror_third_party_openscreen_src_third_party_tinycbor_src::git+https://chromium.googlesource.com/external/github.com/intel/tinycbor.git#commit=d393c16f3eb30d0c47e6f9d92db62272f0ec4dc7
        chromium-mirror_third_party_vulkan-deps_glslang_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/glslang.git#commit=5755de46b07e4374c05fb1081f65f7ae1f8cca81
        chromium-mirror_third_party_vulkan-deps_spirv-cross_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/SPIRV-Cross.git#commit=f09ba2777714871bddb70d049878af34b94fa54d
        chromium-mirror_third_party_vulkan-deps_spirv-headers_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/SPIRV-Headers.git#commit=85a1ed200d50660786c1a88d9166e871123cce39
        chromium-mirror_third_party_vulkan-deps_spirv-tools_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/SPIRV-Tools.git#commit=b53d3a6be38b032dedbc72639dfc6249b5e92697
        chromium-mirror_third_party_vulkan-deps_vulkan-headers_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Headers.git#commit=98f440ce6868c94f5ec6e198cc1adda4760e8849
        chromium-mirror_third_party_vulkan-deps_vulkan-loader_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Loader.git#commit=61187c40845c92a80bcd2216089dd01badcda7ac
        chromium-mirror_third_party_vulkan-deps_vulkan-tools_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Tools.git#commit=e52fa1cf2d95503d28f9d020800cbab15aaa304b
        chromium-mirror_third_party_vulkan-deps_vulkan-validation-layers_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-ValidationLayers.git#commit=ada4a476f4dfadda94f21ca80d35f7a0cd37cba9
        # END managed sources
       )
sha256sums=('SKIP'
            '40ef8af65e78901bb8554eddbbb5ebc55c0b8e7927f6ca51b2a353d1c7c50652'
            '30df59a9e2d95dcb720357ec4a83d9be51e59cc5551365da4c0073e68ccdec44'
            '4c12d31d020799d31355faa7d1fe2a5a807f7458e7f0c374adf55edb37032152'
            '3255477d02d49ef86d47c727b9369f46dc787319bb648bf267a68f37e2041e50'
            'cd0d9d2a1d6a522d47c3c0891dabe4ad72eabbebc0fe5642b9e22efa3d5ee572'
            'dabb5ab204b63be73d3c5c8b7c1fa74053105a285852ba3bbc4fb77646608572'
            'bfafedebd915e1824562329a3afc8589401342eff87dba53c78502b869023b7e'
            '94baaaa6fbec0af6ec2e967f0b7440b4261a927e853e212d84f0aeaf56ae53f0'
            'f41215af1f98d552cdfde7e924ba6d2f77883310aad57ebba7fe73d3883f8668'
            'dd2d248831dd4944d385ebf008426e66efe61d6fdf66f8932c963a12167947b4'
            'b0ac3422a6ab04859b40d4d7c0fd5f703c893c9ec145c9894c468fbc0a4d457c'
            '4484200d90b76830b69eea3a471c103999a3ce86bb2c29e6c14c945bf4102bae'
            '48fe31d28bf17b720bb22a42a20e8e2f9a558e8c1b7e2fcc19fd14c7242dfdb8'
            '547e092f6a20ebd15e486b31111145bc94b8709ec230da89c591963001378845'
            'd97dc00f66fa5868584e4b6d5ef817911eab2dc8022a37c75a00d063f4dac483'
            'ffe499d63c9c1074cbc3995c188c89b748388dbb9dccf975ce28a434c723acf7'
            '94995b4e37671dcd27968bd5a2ebcf50e67bd22659a4bb4a5d0a4f81ff54f471'
            '0914be53b2205b34e4da96f5a94505ac2a01e3639ff433535a23be2d0d581fa7'
            'f6a0e149ef5195883c56a875ae366ed92d9960652f2657bfb65b5408badafc65'
            '7af466e4b5985cc9f0b33df2f3cd2e458c7cbfd7190505d105aad4401c9d072b'
            '727588a1b42f6cfe54acf4759a0c3ad3778590d5a5cefcdcb54b579ba16b09c8'
            '0003e737072f4f1b22ff932221595e85dd9bf65720ccac36f840cccb8000e3e1'
            '6b3c296de83c333678bc3d7cac939f33bbadae94c96299566ff2e31121c46256'
            '5dfbfd073f78c887bbffca2b644116571cc9b1196867e44e8fc0cbb40afcf1bc'
            '55dbe71dbc1f3ab60bf1fa79f7aea7ef1fe76436b1d7df48728a1f8227d2134e'
            'bfae9e773edfd0ddbc617777fdd4c0609cba2b048be7afe40f97768e4eb6117e'
            '9d1f69f668e12fc14b4ccbcf88cb5a3acf666df06dafa8834f037bd8110ca17f'
            '8c9662bed23bfd66ae76d044541f316624386ca4b3baef57a47289feb3db58a9'
            '890b6836cea4c31513166db720b210da20d20bcd97a713545268cceffd707af5'
            '3fb0636e9560760d99e7c9606b1c9b59eef9d91ed3419cc95b43302759f249be'
            '9015b9d6d5b4c1e7248d6477a4b4b6bd6a3ebdc57225d2d8efcd79fc61790716'
            '893bc04c7fceba2f0a7195ed48551d55f066bbc530ec934c89c55768e6f3949c'
            '208f2ebcef5c690207e6e798ffbf9e92214e9d35f415c2f6b93efebad831b7e2'
            'ff588a8a4fd2f79eb8a4f11cf1aa151298ffb895be566c57cc355d47f161f53f'
            'b83406a881d66627757d9cbc05e345cbb2bd395a48b6d4c970e5e1cb3f6ed454'
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
            'SKIP')

# Possible replacements are listed in build/linux/unbundle/replace_gn_files.py
# Keys are the names in the above script; values are the dependencies in Arch
# plus any so names that are provided + linked
declare -gA _system_libs=(
  [brotli]=brotli
  [dav1d]="dav1d libdav1d.so"
  [ffmpeg]=ffmpeg
  [flac]="flac libFLAC.so"
  [fontconfig]="fontconfig libfontconfig.so"
  [freetype]="freetype2 libfreetype.so"
  [harfbuzz-ng]="harfbuzz libharfbuzz.so libharfbuzz-subset.so"
  [icu]="icu libicui18n.so libicuuc.so"
  [jsoncpp]="jsoncpp libjsoncpp.so"  # needs libstdc++
  [libaom]=aom
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
  [snappy]=snappy # libsnappy.so # needs libstdc++
  [woff2]="woff2 libwoff2dec.so" # needs libstdc++
  [zlib]=minizip # libminizip.so
)
_unwanted_bundled_libs=(
  $(printf "%s\n" ${!_system_libs[@]} | sed 's/^libjpeg$/&_turbo/')
)
depends+=(${_system_libs[@]})

_update_sources() {
  python makepkg-source-roller.py update "v$pkgver" "$pkgname"
  updpkgsums
}

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

  pushd src/electron
  patch -Np1 -i ../../std-vector-non-const.patch
  popd

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
  # Create sysmlink to system clang-format
  ln -s /usr/bin/clang-format src/buildtools/linux64
  # Create sysmlink to system Node.js
  mkdir -p src/third_party/node/linux/node-linux-x64/bin
  ln -sf /usr/bin/node src/third_party/node/linux/node-linux-x64/bin
  # Use system java
  mkdir -p src/third_party/jdk/current/bin
  ln -sfn /usr/bin/java src/third_party/jdk/current/bin/
  src/electron/script/apply_all_patches.py \
      src/electron/patches/config.json

  pushd src
  pushd electron
  yarn install --frozen-lockfile
  popd

  echo "Applying local patches..."

  ## Upstream fixes

  # GCC13 patches for chromium (https://github.com/archlinux/svntogit-packages/commit/470e5cbc7b58b4955664cdae386161d22c17d980)
  patch -Np1 -i "${srcdir}/swiftshader-add-cstdint-for-uint64_t.patch" -d "third_party/swiftshader"
  patch -Np1 -i "${srcdir}/dawn-iwyu-add-cstdint-for-uint8_t.patch" -d "third_party/dawn"
  patch -Np1 -i "${srcdir}/iwyu-add-stdint.h-for-various-int-types-in-base.patch"
  patch -Np1 -i "${srcdir}/iwyu-add-cstdint-for-uintptr_t-in-device.patch"
  patch -Np1 -i "${srcdir}/iwyu-add-stdint.h-for-uint32_t-in-chrome_pdf.patch"
  patch -Np1 -i "${srcdir}/iwyu-add-stdint.h-for-uint64_t-in-EncounteredSurface.patch"
  patch -Np1 -i "${srcdir}/iwyu-add-stdint.h-for-integer-types-in-ui.patch"
  patch -Np1 -i "${srcdir}/openscreen-iwyu-add-stdint.h.patch" -d "third_party/openscreen/src"
  patch -Np1 -i "${srcdir}/pdfium-iwyu-add-stdint.h-for-uint32_t.patch" -d "third_party/pdfium"
  patch -Np1 -i "${srcdir}/iwyu-add-stdint.h-for-uint32_t-in-cc.patch"
  patch -Np1 -i "${srcdir}/add-missing-includes-causing-build-errors.patch"
  patch -Np1 -i "${srcdir}/iwyu-add-stdint.h-for-int-types-in-gpu_feature_info.patch"
  filterdiff -p1 -x components/viz/common/view_transition_element_resource_id.h "${srcdir}/iwyu-add-stdint.h-for-various-int-types-in-comp.patch" | patch -Np1
  patch -Np1 -i "${srcdir}/iwyu-add-stdint.h-for-various-integer-types-in-net.patch"
  patch -Np1 -i "${srcdir}/iwyu-add-cstdint-for-int-types-in-s2cellid.patch"
  filterdiff -p1 -x gin/time_clamper.h < ../random-fixes-for-gcc13.patch | patch -Np1
  patch -Np1 -i "${srcdir}/more-fixes-for-gcc13.patch"

  # Additional GCC13 patches
  filterdiff -p1 -x include/GLSLANG/ShaderLang.h < ../5d1ac2e0d5f61913aad62dadb65a7fea6f1b93ae.patch | patch -Np1 -d third_party/angle
  patch -Np1  <../dawn-tint-add-cstdint.patch -d third_party/dawn
  patch -Np1 -i ../comp-viz-add-cstdint.patch

  # Upstream fixes
  patch -Np1 -i ../re-fix-TFLite-build-error-on-linux-with-system-zlib.patch
  patch -Np1 -i ../chromium-icu72.patch
  patch -Np1 -d v8 <../v8-enhance-Date-parser-to-take-Unicode-SPACE.patch

  # Revert ffmpeg roll requiring new channel layout API support
  # https://crbug.com/1325301
  patch -Rp1 -i ../REVERT-roll-src-third_party-ffmpeg-m102.patch
  # Revert switch from AVFrame::pkt_duration to AVFrame::duration
  patch -Rp1 -i ../REVERT-roll-src-third_party-ffmpeg-m106.patch

  # https://crbug.com/angleproject/7582
  patch -Np0 -i ../angle-wayland-include-protocol.patch

  # Fixes for building with libstdc++ instead of libc++
  patch -Np1 -i ../patches/chromium-103-VirtualCursor-std-layout.patch

  # Electron specific fixes
  patch -d third_party/electron_node/tools/inspector_protocol/jinja2 \
    -Np1 -i ../../../../../../jinja-python-3.10.patch
  patch -Np1 -i ../use-system-libraries-in-node.patch
  patch -Np1 -i ../default_app-icon.patch  # Icon from .desktop file

  # Fix build with libxml2 2.12
  patch -Np1 -i ../libxml2-2.12.patch

  # Fix build with ICU 74
  patch -Np1 -i ../icu-74.patch

  # Allow building against system libraries in official builds
  echo "Patching Chromium for using system libraries..."
  sed -i 's/OFFICIAL_BUILD/GOOGLE_CHROME_BUILD/' \
    tools/generate_shim_headers/generate_shim_headers.py
  # Remove bundled libraries for which we will use the system copies; this
  # *should* do what the remove_bundled_libraries.py script does, with the
  # added benefit of not having to list all the remaining libraries
  local _lib
  for _lib in ${_unwanted_bundled_libs[@]}; do
    third_party_dir="third_party/$_lib"
    if [ ! -d "${third_party_dir}" ]; then
      third_party_dir="base/${third_party_dir}"
    fi
    find "${third_party_dir}" -type f \
        \! -path "${third_party_dir}/chromium/*" \
        \! -path "${third_party_dir}/google/*" \
        \! -path 'third_party/harfbuzz-ng/utils/hb_scoped.h' \
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
    'rtc_use_pipewire=true'
    'link_pulseaudio=true'
    'use_custom_libcxx=false'
    'use_gnome_keyring=false'
    'use_sysroot=false'
    'use_system_libwayland=true'
    'use_system_wayland_scanner=true'
    'is_component_ffmpeg=false'
  )

  if [[ -n ${_system_libs[icu]+set} ]]; then
    _flags+=('icu_use_data_file=false')
  fi

  # https://github.com/webpack/webpack/issues/14532
  export NODE_OPTIONS=--openssl-legacy-provider

  # https://bugs.chromium.org/p/chromium/issues/detail?id=1374347
  LDFLAGS+=' -Wl,--undefined-version'

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
