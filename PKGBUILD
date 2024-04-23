# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Pascal Ernster <archlinux@hardfalcon.net>
# Contributor: loqs <bugs-archlinux@entropy-collector.net>
# Contributor: kxxt <rsworktech@outlook.com>

# https://releases.electronjs.org/
# https://github.com/stha09/chromium-patches/releases

# Note: source array can be synced with an Electron release after updating $pkgver with:
# bash -c 'source PKGBUILD; _update_sources'

pkgver=23.3.13
_gcc_patches=110-patchset-4
pkgrel=6

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
        dawn-iwyu-add-cstdint-for-uint8_t.patch
        dawn-tint-add-cstdint.patch
        default_app-icon.patch
        electron-launcher.sh
        electron.desktop
        https://github.com/abseil/abseil-cpp/commit/2039d5dff0cef8fe3841519f0418caef6ec47d2d.patch
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
        std-vector-non-const.patch
        swiftshader-add-cstdint-for-uint64_t.patch
        use-system-libraries-in-node.patch
        v8-move-the-Stack-object-from-ThreadLocalTop.patch
        makepkg-source-roller.py
        # BEGIN managed sources
        chromium-mirror::git+https://github.com/chromium/chromium.git#tag=110.0.5481.208
        chromium-mirror_third_party_nan::git+https://github.com/nodejs/nan.git#commit=16fa32231e2ccd89d2804b3f765319128b20c4ac
        chromium-mirror_third_party_electron_node::git+https://github.com/nodejs/node.git#tag=v18.12.1
        chromium-mirror_buildtools_clang_format_script::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/clang/tools/clang-format.git#commit=8b525d2747f2584fc35d8c7e612e66f377858df7
        chromium-mirror_buildtools_third_party_libc++_trunk::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/libcxx.git#commit=2948540a20cbb5b2192119f791b04dd62ca7af1c
        chromium-mirror_buildtools_third_party_libc++abi_trunk::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/libcxxabi.git#commit=123239cdb67b3d69c5af933e364a84019a33575c
        chromium-mirror_buildtools_third_party_libunwind_trunk::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/libunwind.git#commit=5e22a7fe2335161ab267867c8e1be481bf6c8300
        chromium-mirror_chrome_test_data_perf_canvas_bench::git+https://chromium.googlesource.com/chromium/canvas_bench.git#commit=a7b40ea5ae0239517d78845a5fc9b12976bfc732
        chromium-mirror_chrome_test_data_perf_frame_rate_content::git+https://chromium.googlesource.com/chromium/frame_rate/content.git#commit=c10272c88463efeef6bb19c9ec07c42bc8fe22b9
        chromium-mirror_chrome_test_data_xr_webvr_info::git+https://chromium.googlesource.com/external/github.com/toji/webvr.info.git#commit=c58ae99b9ff9e2aa4c524633519570bf33536248
        chromium-mirror_media_cdm_api::git+https://chromium.googlesource.com/chromium/cdm.git#commit=fef0b5aa1bd31efb88dfab804bdbe614f3d54f28
        chromium-mirror_native_client::git+https://chromium.googlesource.com/native_client/src/native_client.git#commit=7c419b0459b994b7c8d4a5ab73cf8fddd1c812b4
        chromium-mirror_net_third_party_quiche_src::git+https://quiche.googlesource.com/quiche.git#commit=bb8ac619a1e6563a94cf2abd0e59df9d795fa8a3
        chromium-mirror_third_party_android_ndk::git+https://chromium.googlesource.com/android_ndk.git#commit=8388a2be5421311dc75c5f937aae13d821a27f3d
        chromium-mirror_third_party_angle::git+https://chromium.googlesource.com/angle/angle.git#commit=ce029c91a662f3ec991288bb689558fe4988ded7
        chromium-mirror_third_party_content_analysis_sdk_src::git+https://chromium.googlesource.com/external/github.com/chromium/content_analysis_sdk.git#commit=3d3f3d6f27288d7b0628ae5259238162c5e5ae76
        chromium-mirror_third_party_dav1d_libdav1d::git+https://chromium.googlesource.com/external/github.com/videolan/dav1d.git#commit=87f9a81cd770e49394a45deca7a3df41243de00b
        chromium-mirror_third_party_dawn::git+https://dawn.googlesource.com/dawn.git#commit=38496b683c4b73b623dae3b6ebba45879c331ada
        chromium-mirror_third_party_highway_src::git+https://chromium.googlesource.com/external/github.com/google/highway.git#commit=8ae5b88670fb918f815b717c7c13d38a9b0eb4bb
        chromium-mirror_third_party_boringssl_src::git+https://boringssl.googlesource.com/boringssl.git#commit=28f96c2686459add7acedcd97cb841030bdda019
        chromium-mirror_third_party_breakpad_breakpad::git+https://chromium.googlesource.com/breakpad/breakpad.git#commit=cc7abac08b0c52e6581b9c9c4226816b17a4c26d
        chromium-mirror_third_party_cast_core_public_src::git+https://chromium.googlesource.com/cast_core/public.git#commit=f4628fda1b370eb238ae69545024d256ca62d719
        chromium-mirror_third_party_catapult::git+https://chromium.googlesource.com/catapult.git#commit=53918cb7df6c5ca7025d5762e2140ef059b2ca6c
        chromium-mirror_third_party_ced_src::git+https://chromium.googlesource.com/external/github.com/google/compact_enc_det.git#commit=ba412eaaacd3186085babcd901679a48863c7dd5
        chromium-mirror_third_party_cld_3_src::git+https://chromium.googlesource.com/external/github.com/google/cld_3.git#commit=b48dc46512566f5a2d41118c8c1116c4f96dc661
        chromium-mirror_third_party_colorama_src::git+https://chromium.googlesource.com/external/colorama.git#commit=799604a1041e9b3bc5d2789ecbd7e8db2e18e6b8
        chromium-mirror_third_party_cpuinfo_src::git+https://chromium.googlesource.com/external/github.com/pytorch/cpuinfo.git#commit=beb46ca0319882f262e682dd596880c92830687f
        chromium-mirror_third_party_crc32c_src::git+https://chromium.googlesource.com/external/github.com/google/crc32c.git#commit=fa5ade41ee480003d9c5af6f43567ba22e4e17e6
        chromium-mirror_third_party_cros_system_api::git+https://chromium.googlesource.com/chromiumos/platform2/system_api.git#commit=fc4f25a24905b745450e97f10c061b9e6eb9d1a5
        chromium-mirror_third_party_crubit_src::git+https://chromium.googlesource.com/external/github.com/google/crubit.git#commit=f5cbdf4b54b0e6b9f63a4464a2c901c82e0f0209
        chromium-mirror_third_party_depot_tools::git+https://chromium.googlesource.com/chromium/tools/depot_tools.git#commit=41a2d0f1a0173723f63ca2994e17c81eaf302b65
        chromium-mirror_third_party_devtools-frontend_src::git+https://chromium.googlesource.com/devtools/devtools-frontend.git#commit=96897dda85a6c504c5c3b01b8d1c8ea0baca62e2
        chromium-mirror_third_party_dom_distiller_js_dist::git+https://chromium.googlesource.com/chromium/dom-distiller/dist.git#commit=199de96b345ada7c6e7e6ba3d2fa7a6911b8767d
        chromium-mirror_third_party_eigen3_src::git+https://chromium.googlesource.com/external/gitlab.com/libeigen/eigen.git#commit=3bb6a48d8c171cf20b5f8e48bfb4e424fbd4f79e
        chromium-mirror_third_party_farmhash_src::git+https://chromium.googlesource.com/external/github.com/google/farmhash.git#commit=816a4ae622e964763ca0862d9dbd19324a1eaf45
        chromium-mirror_third_party_ffmpeg::git+https://chromium.googlesource.com/chromium/third_party/ffmpeg.git#commit=a249b21db6516234e5456716ae074fbb00176b3f
        chromium-mirror_third_party_flac::git+https://chromium.googlesource.com/chromium/deps/flac.git#commit=af862024c8c8fa0ae07ced05e89013d881b00596
        chromium-mirror_third_party_flatbuffers_src::git+https://chromium.googlesource.com/external/github.com/google/flatbuffers.git#commit=e3017029647a88eb6f509ee9744012fffeb0d371
        chromium-mirror_third_party_fontconfig_src::git+https://chromium.googlesource.com/external/fontconfig.git#commit=452be8125f0e2a18a7dfef469e05d19374d36307
        chromium-mirror_third_party_fp16_src::git+https://chromium.googlesource.com/external/github.com/Maratyszcza/FP16.git#commit=0a92994d729ff76a58f692d3028ca1b64b145d91
        chromium-mirror_third_party_gemmlowp_src::git+https://chromium.googlesource.com/external/github.com/google/gemmlowp.git#commit=13d57703abca3005d97b19df1f2db731607a7dc2
        chromium-mirror_third_party_grpc_src::git+https://chromium.googlesource.com/external/github.com/grpc/grpc.git#commit=dd77c67217b10ffeaf766e25eb8b46d2d59de4ff
        chromium-mirror_third_party_freetype_src::git+https://chromium.googlesource.com/chromium/src/third_party/freetype2.git#commit=ace97a02a4461bbdae29da4019c105eead95e277
        chromium-mirror_third_party_freetype-testing_src::git+https://chromium.googlesource.com/external/github.com/freetype/freetype2-testing.git#commit=7a69b1a2b028476f840ab7d4a2ffdfe4eb2c389f
        chromium-mirror_third_party_fxdiv_src::git+https://chromium.googlesource.com/external/github.com/Maratyszcza/FXdiv.git#commit=63058eff77e11aa15bf531df5dd34395ec3017c8
        chromium-mirror_third_party_harfbuzz-ng_src::git+https://chromium.googlesource.com/external/github.com/harfbuzz/harfbuzz.git#commit=2822b589bc837fae6f66233e2cf2eef0f6ce8470
        chromium-mirror_third_party_emoji-segmenter_src::git+https://chromium.googlesource.com/external/github.com/google/emoji-segmenter.git#commit=9ba6d25d0d9313569665d4a9d2b34f0f39f9a50e
        chromium-mirror_third_party_ots_src::git+https://chromium.googlesource.com/external/github.com/khaledhosny/ots.git#commit=46bea9879127d0ff1c6601b078e2ce98e83fcd33
        chromium-mirror_third_party_libgav1_src::git+https://chromium.googlesource.com/codecs/libgav1.git#commit=cd53f7c0d6a1c005e38874d143c8876d375bae70
        chromium-mirror_third_party_googletest_src::git+https://chromium.googlesource.com/external/github.com/google/googletest.git#commit=af29db7ec28d6df1c7f0f745186884091e602e07
        chromium-mirror_third_party_hunspell_dictionaries::git+https://chromium.googlesource.com/chromium/deps/hunspell_dictionaries.git#commit=41cdffd71c9948f63c7ad36e1fb0ff519aa7a37e
        chromium-mirror_third_party_icu::git+https://chromium.googlesource.com/chromium/deps/icu.git#commit=7ff1e9befce5567754dc88392dfaa4704e261ab3
        chromium-mirror_third_party_jsoncpp_source::git+https://chromium.googlesource.com/external/github.com/open-source-parsers/jsoncpp.git#commit=42e892d96e47b1f6e29844cc705e148ec4856448
        chromium-mirror_third_party_leveldatabase_src::git+https://chromium.googlesource.com/external/leveldb.git#commit=d019e3605f222ebc5a3a2484a2cb29db537551dd
        chromium-mirror_third_party_libFuzzer_src_electron23::git+https://chromium.googlesource.com/chromium/llvm-project/compiler-rt/lib/fuzzer.git#commit=debe7d2d1982e540fbd6bd78604bf001753f9e74
        chromium-mirror_third_party_libaddressinput_src::git+https://chromium.googlesource.com/external/libaddressinput.git#commit=df35d6c42da4fa2759e4cfb592afe33817993b89
        chromium-mirror_third_party_libaom_source_libaom::git+https://aomedia.googlesource.com/aom.git#commit=6770d15de0244bde00f67554f70fc8836826902c
        chromium-mirror_third_party_libavif_src::git+https://chromium.googlesource.com/external/github.com/AOMediaCodec/libavif.git#commit=96b8450ca5e5acf173645aafc5c5e91959dfe0c1
        chromium-mirror_third_party_nearby_src::git+https://chromium.googlesource.com/external/github.com/google/nearby-connections.git#commit=ad9c26ec909292c46e3fd71993d8185463615b26
        chromium-mirror_third_party_securemessage_src::git+https://chromium.googlesource.com/external/github.com/google/securemessage.git#commit=fa07beb12babc3b25e0c5b1f38c16aa8cb6b8f84
        chromium-mirror_third_party_ukey2_src::git+https://chromium.googlesource.com/external/github.com/google/ukey2.git#commit=0275885d8e6038c39b8a8ca55e75d1d4d1727f47
        chromium-mirror_third_party_cros_components::git+https://chromium.googlesource.com/external/google3/cros_components.git#commit=3e87937c0da5bcfb9f9e03fa9030cd2fc267eb5c
        chromium-mirror_third_party_libdrm_src::git+https://chromium.googlesource.com/chromiumos/third_party/libdrm.git#commit=b9ca37b3134861048986b75896c0915cbf2e97f9
        chromium-mirror_third_party_expat_src::git+https://chromium.googlesource.com/external/github.com/libexpat/libexpat.git#commit=441f98d02deafd9b090aea568282b28f66a50e36
        chromium-mirror_third_party_libipp_libipp::git+https://chromium.googlesource.com/chromiumos/platform2/libipp.git#commit=6c45a4f3a05cb5dd700414fe4d94cf685159d3ce
        chromium-mirror_third_party_libjpeg_turbo::git+https://chromium.googlesource.com/chromium/deps/libjpeg_turbo.git#commit=ed683925e4897a84b3bffc5c1414c85b97a129a3
        chromium-mirror_third_party_liblouis_src::git+https://chromium.googlesource.com/external/liblouis-github.git#commit=9700847afb92cb35969bdfcbbfbbb74b9c7b3376
        chromium-mirror_third_party_libphonenumber_dist::git+https://chromium.googlesource.com/external/libphonenumber.git#commit=140dfeb81b753388e8a672900fb7a971e9a0d362
        chromium-mirror_third_party_libprotobuf-mutator_src::git+https://chromium.googlesource.com/external/github.com/google/libprotobuf-mutator.git#commit=a304ec48dcf15d942607032151f7e9ee504b5dcf
        chromium-mirror_third_party_libsrtp::git+https://chromium.googlesource.com/chromium/deps/libsrtp.git#commit=5b7c744eb8310250ccc534f3f86a2015b3887a0a
        chromium-mirror_third_party_libsync_src::git+https://chromium.googlesource.com/aosp/platform/system/core/libsync.git#commit=f4f4387b6bf2387efbcfd1453af4892e8982faf6
        chromium-mirror_third_party_libvpx_source_libvpx::git+https://chromium.googlesource.com/webm/libvpx.git#commit=605350bd5b68ac47f595d60cc8ef346588e773c0
        chromium-mirror_third_party_libwebm_source::git+https://chromium.googlesource.com/webm/libwebm.git#commit=e4fbea0c9751ae8aa86629b197a28d8276a2b0da
        chromium-mirror_third_party_libwebp_src::git+https://chromium.googlesource.com/webm/libwebp.git#commit=0aa5f755c6014ed2ea2317bea12a227b04d41490
        chromium-mirror_third_party_libyuv::git+https://chromium.googlesource.com/libyuv/libyuv.git#commit=4a3c79cb31aee310443039c37d64377ed06f1d14
        chromium-mirror_third_party_lss::git+https://chromium.googlesource.com/linux-syscall-support.git#commit=ce877209e11aa69dcfffbd53ef90ea1d07136521
        chromium-mirror_third_party_material_color_utilities_src::git+https://chromium.googlesource.com/external/github.com/material-foundation/material-color-utilities.git#commit=bd6537fb1c4aa2164d97f96e78a9c826e360a0ed
        chromium-mirror_third_party_minigbm_src::git+https://chromium.googlesource.com/chromiumos/platform/minigbm.git#commit=3018207f4d89395cc271278fb9a6558b660885f5
        chromium-mirror_third_party_minizip_src::git+https://chromium.googlesource.com/external/github.com/nmoinvaz/minizip.git#commit=1ff40343b55e738d941abb51c70eddb803db16e2
        chromium-mirror_third_party_nasm::git+https://chromium.googlesource.com/chromium/deps/nasm.git#commit=0873b2bae6a5388a1c55deac8456e3c60a47ca08
        chromium-mirror_third_party_neon_2_sse_src::git+https://chromium.googlesource.com/external/github.com/intel/ARM_NEON_2_x86_SSE.git#commit=a15b489e1222b2087007546b4912e21293ea86ff
        chromium-mirror_third_party_openh264_src::git+https://chromium.googlesource.com/external/github.com/cisco/openh264.git#commit=db956674bbdfbaab5acdd3fdb4117c2fef5527e9
        chromium-mirror_third_party_openscreen_src::git+https://chromium.googlesource.com/openscreen.git#commit=9942fb6d07c9c72b9dcee9e777c544e256f1fb61
        chromium-mirror_third_party_openxr_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/OpenXR-SDK.git#commit=bf21ccb1007bb531b45d9978919a56ea5059c245
        chromium-mirror_third_party_pdfium::git+https://pdfium.googlesource.com/pdfium.git#commit=a0d16d18d072ce77e639a09ed211340a2ad9034e
        chromium-mirror_third_party_perfetto::git+https://android.googlesource.com/platform/external/perfetto.git#commit=39f3c505498164c3ad9ca31a4f5924de5d6aa8d0
        chromium-mirror_third_party_pthreadpool_src::git+https://chromium.googlesource.com/external/github.com/Maratyszcza/pthreadpool.git#commit=1787867f6183f056420e532eec640cba25efafea
        chromium-mirror_third_party_pyelftools::git+https://chromium.googlesource.com/chromiumos/third_party/pyelftools.git#commit=19b3e610c86fcadb837d252c794cb5e8008826ae
        chromium-mirror_third_party_quic_trace_src::git+https://chromium.googlesource.com/external/github.com/google/quic-trace.git#commit=caa0a6eaba816ecb737f9a70782b7c80b8ac8dbc
        chromium-mirror_third_party_pywebsocket3_src::git+https://chromium.googlesource.com/external/github.com/GoogleChromeLabs/pywebsocket3.git#commit=50602a14f1b6da17e0b619833a13addc6ea78bc2
        chromium-mirror_third_party_re2_src::git+https://chromium.googlesource.com/external/github.com/google/re2.git#commit=954656f47fe8fb505d4818da1e128417a79ea500
        chromium-mirror_third_party_ruy_src::git+https://chromium.googlesource.com/external/github.com/google/ruy.git#commit=3168a5c8f4c447fd8cea94078121ee2e2cd87df0
        chromium-mirror_third_party_skia::git+https://skia.googlesource.com/skia.git#commit=aab9fb4100da797d25fe340e9a2fcb2ae30fc2e1
        chromium-mirror_third_party_smhasher_src::git+https://chromium.googlesource.com/external/smhasher.git#commit=e87738e57558e0ec472b2fc3a643b838e5b6e88f
        chromium-mirror_third_party_snappy_src::git+https://chromium.googlesource.com/external/github.com/google/snappy.git#commit=65dc7b383985eb4f63cd3e752136db8d9b4be8c0
        chromium-mirror_third_party_sqlite_src::git+https://chromium.googlesource.com/chromium/deps/sqlite.git#commit=a527890e56f1304053e5d9607aba139baf5b9245
        chromium-mirror_third_party_swiftshader::git+https://swiftshader.googlesource.com/SwiftShader.git#commit=a10c7d244a293b2fc3569fbced1c12c4eae60dbe
        chromium-mirror_third_party_text-fragments-polyfill_src::git+https://chromium.googlesource.com/external/github.com/GoogleChromeLabs/text-fragments-polyfill.git#commit=c036420683f672d685e27415de0a5f5e85bdc23f
        chromium-mirror_third_party_tflite_src::git+https://chromium.googlesource.com/external/github.com/tensorflow/tensorflow.git#commit=be3be938f3c349daf0b0ef4b717fc2fc7010a974
        chromium-mirror_third_party_vulkan-deps::git+https://chromium.googlesource.com/vulkan-deps.git#commit=6b2f5086baa2c60ec7f90423b1f98d8b7f060fae
        chromium-mirror_third_party_vulkan_memory_allocator::git+https://chromium.googlesource.com/external/github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git#commit=ebe84bec02c041d28f902da0214bf442743fc907
        chromium-mirror_third_party_wayland_src::git+https://chromium.googlesource.com/external/anongit.freedesktop.org/git/wayland/wayland.git#commit=c7473676b8abc682e820546287044cee3bca9147
        chromium-mirror_third_party_wayland-protocols_src::git+https://chromium.googlesource.com/external/anongit.freedesktop.org/git/wayland/wayland-protocols.git#commit=83866f19d3d61b28e94d71781646466b3a6623d8
        chromium-mirror_third_party_wayland-protocols_kde::git+https://chromium.googlesource.com/external/github.com/KDE/plasma-wayland-protocols.git#commit=0b07950714b3a36c9b9f71fc025fc7783e82926e
        chromium-mirror_third_party_wayland-protocols_gtk::git+https://chromium.googlesource.com/external/github.com/GNOME/gtk.git#commit=40ebed3a03aef096addc0af09fec4ec529d882a0
        chromium-mirror_third_party_webdriver_pylib::git+https://chromium.googlesource.com/external/github.com/SeleniumHQ/selenium/py.git#commit=fc5e7e70c098bfb189a9a74746809ad3c5c34e04
        chromium-mirror_third_party_webgl_src::git+https://chromium.googlesource.com/external/khronosgroup/webgl.git#commit=d1b65aa5a88f6efd900604dfcda840154e9f16e2
        chromium-mirror_third_party_webgpu-cts_src::git+https://chromium.googlesource.com/external/github.com/gpuweb/cts.git#commit=e583fa45095a98e12cc28748b30c2b1a9e5babcf
        chromium-mirror_third_party_webrtc::git+https://webrtc.googlesource.com/src.git#commit=218b56e516386cd57c7513197528c3124bcd7ef3
        chromium-mirror_third_party_wuffs_src::git+https://skia.googlesource.com/external/github.com/google/wuffs-mirror-release-c.git#commit=fe9d08f2b6e80af691bfb1a718e144c49a1b9eba
        chromium-mirror_third_party_weston_src::git+https://chromium.googlesource.com/external/anongit.freedesktop.org/git/wayland/weston.git#commit=420cfd00f2de91de74bd9d4d8348e43c582d29f0
        chromium-mirror_third_party_xdg-utils::git+https://chromium.googlesource.com/chromium/deps/xdg-utils.git#commit=d80274d5869b17b8c9067a1022e4416ee7ed5e0d
        chromium-mirror_third_party_xnnpack_src::git+https://chromium.googlesource.com/external/github.com/google/XNNPACK.git#commit=a50369c0fdd15f0f35b1a91c964644327a88d480
        chromium-mirror_tools_page_cycler_acid3::git+https://chromium.googlesource.com/chromium/deps/acid3.git#commit=6be0a66a1ebd7ebc5abc1b2f405a945f6d871521
        chromium-mirror_v8::git+https://chromium.googlesource.com/v8/v8.git#commit=fffe4e12b98cdef0072009c96209c6d3a13e5189
        chromium-mirror_third_party_angle_third_party_glmark2_src::git+https://chromium.googlesource.com/external/github.com/glmark2/glmark2.git#commit=ca8de51fedb70bace5351c6b002eb952c747e889
        chromium-mirror_third_party_angle_third_party_rapidjson_src::git+https://chromium.googlesource.com/external/github.com/Tencent/rapidjson.git#commit=781a4e667d84aeedbeb8184b7b62425ea66ec59f
        chromium-mirror_third_party_angle_third_party_VK-GL-CTS_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/VK-GL-CTS.git#commit=9f4465eccb37e785b1716c07910c2ce7f9ea208f
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
        chromium-mirror_third_party_dawn_third_party_protobuf_electron23::git+https://chromium.googlesource.com/external/github.com/protocolbuffers/protobuf.git#commit=fde7cf7358ec7cd69e8db9be4f1fa6a5c431386a
        chromium-mirror_third_party_openscreen_src_third_party_tinycbor_src::git+https://chromium.googlesource.com/external/github.com/intel/tinycbor.git#commit=d393c16f3eb30d0c47e6f9d92db62272f0ec4dc7
        chromium-mirror_third_party_vulkan-deps_glslang_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/glslang.git#commit=f9b760e6c73bca9cba4b8a7e8d18993b89d62dd4
        chromium-mirror_third_party_vulkan-deps_spirv-cross_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/SPIRV-Cross.git#commit=a89dea3c499b1e322b39c7e6127af2777c4aa49b
        chromium-mirror_third_party_vulkan-deps_spirv-headers_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/SPIRV-Headers.git#commit=70ff9d939cd7fd0c758756ac57ab0c7c6d6c64d6
        chromium-mirror_third_party_vulkan-deps_spirv-tools_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/SPIRV-Tools.git#commit=43c99b5ee087704a5ae0909d0ce7be3eff416905
        chromium-mirror_third_party_vulkan-deps_vulkan-headers_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Headers.git#commit=75a6b83f213da085ba33b82f053b956219a48730
        chromium-mirror_third_party_vulkan-deps_vulkan-loader_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Loader.git#commit=96488e2b2e0dadd37e2caaa67f8fa010b2b1902e
        chromium-mirror_third_party_vulkan-deps_vulkan-tools_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Tools.git#commit=dda9ae0f9113ad3816ba5f84e1a59b1529e82630
        chromium-mirror_third_party_vulkan-deps_vulkan-validation-layers_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-ValidationLayers.git#commit=e4a4c1653c5ac15d379d20a0ca82799e00263fdb
        # END managed sources
       )
sha256sums=('0fc3b2f75594191960a3c6703e03ae2dd3d794616ca910c95bfc76d93cac586d'
            '8c7f93037cc236024cc8be815b2c2bd84f6dc9e32685299e31d4c6c42efde8b7'
            '30df59a9e2d95dcb720357ec4a83d9be51e59cc5551365da4c0073e68ccdec44'
            '4c12d31d020799d31355faa7d1fe2a5a807f7458e7f0c374adf55edb37032152'
            '3255477d02d49ef86d47c727b9369f46dc787319bb648bf267a68f37e2041e50'
            '94baaaa6fbec0af6ec2e967f0b7440b4261a927e853e212d84f0aeaf56ae53f0'
            'f41215af1f98d552cdfde7e924ba6d2f77883310aad57ebba7fe73d3883f8668'
            'dd2d248831dd4944d385ebf008426e66efe61d6fdf66f8932c963a12167947b4'
            'b406bc9adb7fadcfbd26f204f3e0ef8c31a41fa09181edb28626167ac58fe038'
            '4484200d90b76830b69eea3a471c103999a3ce86bb2c29e6c14c945bf4102bae'
            'cfeb521f9520d8e9ea17ba2af08749b8df5ee697aa51d577a4afb92bd6632afb'
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
            '893bc04c7fceba2f0a7195ed48551d55f066bbc530ec934c89c55768e6f3949c'
            '208f2ebcef5c690207e6e798ffbf9e92214e9d35f415c2f6b93efebad831b7e2'
            'ff588a8a4fd2f79eb8a4f11cf1aa151298ffb895be566c57cc355d47f161f53f'
            '49c3e599366909ddac6a50fa6f9420e01a7c0ffd029a20567a41d741a15ec9f7'
            '3ae82375ba212c31fd4ba6f1fa4e2445eeca8eb8c952176131ad57c0258db224'
            'edb4d73245b8cafb158131f6b55f06d845d79d1631819a1ad3890bd8492a6f19'
            '3d5af1414e90349a6f412d8264c9b613346a38adecf226447d1d0d511f9410d3'
            'e1f95efe4080a7607bca089808af108f60831ce6cd20d752e68fb898f38e01f3'
            '863e7d3baad20ebdd6517de72b89c465a3fb8b5d453d89e7590a44972a04d06a'
            'a437bfb5feed44a0bab58c81b79ef272f40b092e2f8f5a438a539b9127ae641b'
            '669953f9a685243b7aa9a6bca67257344e4e1e83eb5b8d0b4d46c669959027e0'
            '7d03e2187fc60aa42550ec3bf4d99c39c3b6ed9a3f6a7b1f71596314c8c16078'
            '5abf726ce9e19c0b0e7818a7ced615a1a6d16f306e7315b9e6db53118c0669b5'
            '045eb27642ac8f49b52efec7c52bb6ea3c908552ffadc50449a23b27da7a4737'
            '8a8c21768a1f3764e6887cfc907dd857e9fc00a1269dd858e2ba98d70aef889d'
            'a62dd76d5ebcae2e2302509f057d21c35ffd69549ee7cdac47b2a85616dcc9be'
            'fc01430b6e492bf4fc990b9142508724e9ecff53ea062ab96a26d30c25e1cc79'
            'd9735e3ee68a1cb7de467757d2eed31568e2c50812b0d2570ab78be3f49225d0'
            'ae9228e3e775fcdb1e5d18128d7ba5bfff838365734806159a66e82d6dab3288'
            'b4d566efee32c021ca51913c8df93a2f65e3c792ecebc175772ce5dec2353cf4'
            'c9b25d8692fd7ce5425b5630058b5c4c0044827376e0a40b99a196f3fda87339'
            '778212324a91fc28075621a21d074a859944a9c6770080b200e23abd99adb392'
            'f8b0e845424f628c595e26acd125e5d85615a29daa8fb7f9f26ab78ccd2e08bc'
            '922fa61c8707263361e9f36e4f6e21f2791ad561e1efbde223b236fffaa1ab02'
            'b735e52955164219139df179ba6e3a3d7ee2bc37bb471656baf091aa77ef640b'
            '63b6ba622ea9d69d7372e857d17c1ab31ff5bf3542e91c30642d478a6420289b'
            'bc9e95d8294e5cdf65a25113504ca89c8ba66d1c8d7f0486dcdbaa366a1175f3'
            '81811280743f918fd9f9588ce45cc363cc7703a1e205738c2c7500ac19253bac'
            '8b97c25874c17644300d1cbe6ac1fceb705bf18297e27699ba20497fc47ae239'
            'e6a28c25e3d93c9c37414149ff44ac7a1bbb4d8a167061f8ee9679dc065af1bb'
            '197fffc4315ef9388699de6777ef0afad76fd2ade512b9b1386911ad8253c071'
            'f5a4b337697d317878370cb0f7acecc74c076ce0d093a426a746323eb1ee3d7d'
            '4f5fd6719234fbc67c517e20e2170db66d37455d69bec880624a0a0304a0e91c'
            'a786934e93d73e0a2b922c28222b9c392e4ab895b810bffe7ef6b6f73a2b7d99'
            'fd0b02f624e3c2c539bfb584b2f9ea8998d73bc9e79ba232a9989e9771671a43'
            '35fe9d0a87a9351b3a0e554a1416e9e62a15e47879d96ce17e3168df3496e048'
            'ef606444182a77666d786c2a6930e5d7437cc890ae649be38de1ecf17f9b5b86'
            '47f3f3d044cc0658274833022db1e7695964b1da8f37cb905882d15457212fba'
            'df0acdfb644f92cd0bb87a27fb9814df80a252749199587aabea12aa3ab98c64'
            '6258126c4c354ccacd0ec5f9f82c6970d576359c7aba86e44277b459d1645325'
            '9314dd7737694fb6979618fee99180b82771a4a06fd439fdc60fdfce2cc8f277'
            '1a4b6ce88d2a16e742c8c9f8f4c674a68635e6d47243070c5650f0129b2ce9c1'
            '52b74ae6143349a2c0f67be057e5f131de377bc9923f7e67b03f07f811b787bb'
            '128b9c887b4a71b1fda1a8c8120d63b3fdec570cc72a6c3c32be13782c8487c5'
            '5d0c4f261d36707f926fa9ef9a39349f1cccac8ae6443a8f8571c1625eb90c41'
            '1a1e2859649a95beef8dba22e8c77735652a212bc88a9bb4dfe1458667dcabbc'
            'd14603290459614af96a447cd729ae26b039e3cc38c266363827f4cb3845e632'
            '5b1e30d5dd10208f1ed6cd468babf2f80d7a8cf57ee168574b1c04bf9c2bfae6'
            '12081574c11ef21850e9d2cf62580216296a6b7af48f679e6c28e05a376d1f3d'
            '0f27ab5434870f31886d7c958ced4ff335a09a1080637fb50afdf95db19e3442'
            'd59a4abc4b367f4869a9a632657ebb5ca4ab805ccc3bc57466b96e611be0a3e9'
            '88cdf771889253831a8873b3234e80cd0b6604bd1fc31a93cff36fa9c2281159'
            'af81f653b73270d4b8f9d1e92ecf39821498c08f4ca5c69872e39bac90b40083'
            '5a720c28ef8557e80c4b660b2000529c0de428a05b34d0ced5bc56b1097a69ec'
            '409ee4de1d8d203c839118b398d508788cdd270ec9295b3c5375ac33f39c12af'
            '92fe0e99dea519a56b80321646b7b2b674564f4e8d036cbbf4d98e8588531720'
            '4cb48d3f9b69cf23f6f8a9fd5b2a773b062d8c0e1d47211317ab12ea8128fe26'
            '9f58ce3d45baf6796965aa79109af62c330f82b97d320bb5d7bbbdea0e579a92'
            '41d2cb4288578890154d831b3ffd8f53d24aa20810a9b5708666b75265a34865'
            '4fcb8ebca4a72800397c5e08d1c5eae878767f5df960b0e4214d0de775fe160c'
            'db4e457424f8e86c73edb9d48bcfaa048f6ff7d5b64b57e33d0c7189e92c81a2'
            '41b670e05fa795e78d79fafac2aefb3d149f37a6c0e2316b0b362fed5fbb40eb'
            '60e06310ece3ffbab5436a140defc4cfcc873342ebea1f196dd6a3ca25e733f7'
            '0d16c91a7d27c89fdf11c131875eb4007db2a85c894c79a6840928e13b9d74ae'
            '66b8f66432b1325861b5f411c71ec49fa171d9a0063bf958242ddde6ce09c12f'
            '9c888babaaf59afc855d944e8b26ab573d5e80026dc3bc8dc64720b8f5bb27a2'
            '3682f4939269cbee893cc0ca54822e9305761e0a8e548a23455934a25b2c7531'
            '1a273225e8f25d924bea44c42d652306ff721f35b2b57e1b8029dc3396a482b3'
            'cc74c39e0133905a1f4f264590b44282df4231b73972e7a9708b311e46e00f88'
            'e854e84d1456ce5aacd1618ebef6a757786d5356ae9b7853b7773ce74b2301e2'
            'aee63d4631edaafb03f5cacfc75ef2f8976f76d972895beb3ce42f9dbc74e83e'
            '4070e77bf7afd9fb949067f63c3580d1f5badacfe4c2ab187129ba20446efd04'
            '9c8de69ad47af04565a89920c08f44694f97d7a16f8f23610e5beaf9f38cb71c'
            '25906418111df0d29db783092d94148e130592d722393ad4bd76809c6f63f9bd'
            '698e598c6f94a46eb9a26020a74d8904def28553157712af8afc3e809771ff25'
            '9341676174943fbc5268e023c3e572171289fc4748401723a6dcaef50f793dcd'
            'df9c701c8fc8c6aff626e3bd354de7486e02386f6d1c54cb41e1fadbe730083f'
            '7b32c27a5513c451032132fe5dc724de23d3b0738a0609a96bd44deee1d46681'
            '8900ad62887512fdc8f1e66c83b712764e9c033ab7f9513f54347bc09bc47195'
            '4c4eef3fca2afc98f69423cf27b8d289c5861271425b0a159fe3336b468aba9a'
            'e475d42b746955422ff9e905354091d0b17cdb2c8989cc6beb6470e76a4aa1dd'
            'c7ef8205f3c0455cca339e50014c2e07a41e41cce0e872f1c1a788532516a89b'
            '9010695b87eef676b62ec429879972c135987dab6eb53b0a4edf1b5a7cb0bb8b'
            '1617fad681c1f653a12c4efd68646255f1530c572a79530205f23fb222eac876'
            '1936b4652116234bcf1a55b75c9f476a3e4b1ff589601fcf0788d22c39eed545'
            'd1c16289a7869f143d72e6d574d4f27f439fd2fd027064dcce1dd6a6aee75d00'
            'c2389ead088f21c5729b58f5930ad97cd4c83878c03e30586de25a9cf128573e'
            '7b3047375481a7a07a2dc65178b65d1ab8d94e980dd1e5b6425ea79dcec33678'
            'b8680bd4b53632b4e7ad590b02214fbd73b4cc73a9fa8cf4e0e3069596c675cd'
            '09082c1944cd33fab47be3342148ea103a1a442fc96a15e521bc66b3631c2ff5'
            'ac044abd2d176c561f61f12982a63de0b59f6b0c31fed6e9d01b9c49a7cddb11'
            '3047e861dc6768a97bb19ab35db13dacf49670a4f5749d0c31a74dda7ae9975e'
            '99995f0ca85ab0e85bd291e5336657df41409a48ca5439dcaf162d8b11ac0ec6'
            'dc1206af7485794e1644097b08736e39c8fa50296e514561f8805c6d28b58925'
            '599bbbabf9e2dc2006dd9e3e9636c4f648360726173793bf6a5a5414698762c5'
            '2ff1f5187cb467cea878c48b9485b7ad0a1a499491a376f53db929249e5b24e9'
            '0936aae861b92a5b1aa67d23209b9d56fc0c435e2c25f41c14c14ee90b50201a'
            '46a23b5fcdfc52e738ad4e28010b0369c3677705d0ce342f779159a7b90b2f49'
            '3624b28203c972ea54b490342be74fbd99d4b4748123f9e2837a54ca01c8b392'
            'c2e942b6bdbaab284856a53d3f04979ab15043843004340b8277d364a37099eb'
            '738c002f354f00eab9d2e21134fa8342c3295569ce132ef1388fcef7ba52ef01'
            'c629aa14fd2e424017423aff2399cab2ca8453b6587b5918ea509326c40c32db'
            '108a67f21c2bdf2dbc4838f3ba32c992325a29cb62a14b377f8a04a9ad5b2b82'
            '324f27125d43878ce180631d852b1892616e290160447c8df47e0f1d9449bc99'
            '2f85bad09e5bb409fc0afc28c1b8d20b3c7ab28ef7066ffd68c9575fc60ea67c'
            '965802bae3a0b3809747f4ad117a1d7da3d756a22d0f2bc56f5e4460dce16709'
            '51bc3369ec18057a024c24e079cc0e15afdfb196021e4bdbde800d6ed294632d'
            '9b1942dbc8a2c8d3ba0532b33e64aa0361f4d9cab19644a833682d3b85471d81'
            '1da28304d237ba934e76394107e46fed0e4120fd2b257f1c667c2d11b52d959b'
            'a9a8839d08232091a0cd381f51380a0a6ebe841f5a8e50a6047aae7b8e34c681'
            '02696a90c7831e3fa903df105573c5f10f4934602fb0e90c846fb44213c40b27'
            'b5f1b797e59e54882fbfb9088f79037d050359a00b053f5209a7b1b52aacc541'
            '2b83c7bfac666f30563b1cf37ff0e0f98b64af11c1d90f0525c4fcf3d2e25630'
            'eadb6928a58a85f9d6a382cd8aca3117f1d5920d063386e78ee932f7d57af090'
            '6a7be311617446dd1534863e8f3e02159caaa9c4efbc7d2564c83c1a4faaa31b'
            '2d2b64a30b8fdab74ec93f2d4b0eb65a05a4fba5840cad7f89a7e68fdb49c329'
            '8fa4f52720fb5fce6a0cefcdf119f57f3b419078dc543ba9567b77eb7fba8604'
            '8ff1ae14f717541f1293defb51d47a51fbabf4be1c64de617e62bdb314349f95'
            '71191c953111a08a0e0df6a724bd331a9efb1994b872d2c081f3214324097720'
            'e4c0d826020609ff7125800d24ed5886c2174e7d1cb217738520483cd181d4fe'
            'e67cdb017c07a7ec72a06f1062dc2f124d97527869604575fe48610ff98b581a'
            '716cc81139f11a2b438802d37f245f885fc9a0c69ef429a11b156145c903a932'
            '765481b6f185c9912534bc5643c9496c789e93184af443a8a089b3b5408c6303'
            'd1ca991f6981ebd00019c3c7fd07c44e67a9046b18a8a85ce95832460a07d1fe'
            'ab64ed58bc07cf32f01109663bff36aa15110ef16496ca139c8e221fd75bed43'
            'd5eb36e64dbaa763631bb74f8f2cfba65f774eab2bfe1e134d5bd7271bfb291c'
            '8c630a78542df7c8c698c3d76dbf913c55cde0b9520f6a5f8a703be67b0af03a'
            'af7fcf80a4d5f12c29eb1c442194de7635947657ed51cccc0c4e3d14dee3add6'
            '355d9ea34b8773a8f0705c07fb76c266ba6bb26ab3b877c22a712f20b51b2da6'
            '785f769c6c0d465f79038ec4f4c210025043285c345041667b122296c6b961e1'
            'c07cb7d7fe3b65ffe869aea3e236cb4e68b36f997df39508da6ab051ad1b330f'
            '0434674e57fc3c000ca5b0a496d51bb8f8b6422e24547c8698450fba0e459bcd'
            'fc7fcecb1f97995e17bd743274c8e49bb5969ef27783dced4cd6e2ee4a971a75'
            '75b897d38208c985cbe08443ad9253db04a716066fd92b0d05f2fd2fee32b4ff'
            '7d89448b9cccc0e2309ce34fef37ed85fd08fd2b030422e456fc531ebb1e8f80'
            '1bb2d779cfccdf9848513e27c90b2c5f8a155ef47395b0fefc10e04306a391ed'
            '4364e1c1b8f5bc7704e1dee4f31b816b96a627f9f17ab7fd0bf0e859e548be6c'
            '913987d9bb343b530f8a7fad3f214205c5743ff902cef179f2a9ee6301284bd8'
            '8b697686e8f3f385bd7fed5d07c6ac996ce4a8286d02f238b6ae21a5df05f48c'
            'a2c801702c22bba3dc0ec5cb05f88ccda99f9db732ec754ee266319bb3f5475a'
            '9bea94c2778d37b07e2946dca3369fa83f8bdd6c5629d0d9b5d8838efda62bb7'
            'af76cfa2d58e36bb7d08da54abddce33c7b153f9ed320630b3fb2bd24b14fcbe'
            'cab6fdf195b06b79353d35ada75c5b41f98d75d09e0930d16bcc004a1d0bfe98')

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
  patch -Np1 -i "${srcdir}/iwyu-add-stdint.h-for-various-int-types-in-comp.patch"
  patch -Np1 -i "${srcdir}/iwyu-add-stdint.h-for-various-integer-types-in-net.patch"
  patch -Np1 -i "${srcdir}/iwyu-add-cstdint-for-int-types-in-s2cellid.patch"
  filterdiff -p1 -x gin/time_clamper.h < ../random-fixes-for-gcc13.patch | patch -Np1
  patch -Np1 -i "${srcdir}/more-fixes-for-gcc13.patch"

  # Additional GCC13 patches
  patch -Np1  <../2039d5dff0cef8fe3841519f0418caef6ec47d2d.patch -d third_party/abseil-cpp
  filterdiff -p1 -x include/GLSLANG/ShaderLang.h < ../5d1ac2e0d5f61913aad62dadb65a7fea6f1b93ae.patch | patch -Np1 -d third_party/angle
  patch -Np1  <../dawn-tint-add-cstdint.patch -d third_party/dawn

  # https://crbug.com/v8/13630
  # https://crrev.com/c/4200636
  # https://github.com/nodejs/node/pull/46125#issuecomment-1407721276
  patch -Np1 -d v8 <../v8-move-the-Stack-object-from-ThreadLocalTop.patch

  # Revert ffmpeg roll requiring new channel layout API support
  # https://crbug.com/1325301
  patch -Rp1 -i ../REVERT-roll-src-third_party-ffmpeg-m102.patch
  # Revert switch from AVFrame::pkt_duration to AVFrame::duration
  patch -Rp1 -i ../REVERT-roll-src-third_party-ffmpeg-m106.patch

  # Fixes for building with libstdc++ instead of libc++
  patch -Np1 -i ../patches/chromium-103-VirtualCursor-std-layout.patch
  patch -Np1 -i ../patches/chromium-110-NativeThemeBase-fabs.patch
  patch -Np1 -i ../patches/chromium-110-CredentialUIEntry-const.patch
  patch -Np1 -i ../patches/chromium-110-DarkModeLABColorSpace-pow.patch

  # Electron specific fixes
  patch -d third_party/electron_node/tools/inspector_protocol/jinja2 \
    -Np1 -i ../../../../../../jinja-python-3.10.patch
  patch -Np1 -i ../use-system-libraries-in-node.patch
  patch -Np1 -i ../default_app-icon.patch  # Icon from .desktop file

  # Fix build with libxml2 2.12
  patch -Np1 -i ../libxml2-2.12.patch

  # Fix build with ICU 74
  patch -Np1 -i ../icu-74.patch
  # Fix crash with system ICU: https://chromium-review.googlesource.com/c/chromium/src/+/4154277
  git cherry-pick -n 4885090741554be61cb2ed10194cefb29bf8be64

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
    'use_system_libffi=true'
    'is_component_ffmpeg=false'
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
