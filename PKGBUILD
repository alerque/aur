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
sha256sums=('SKIP'
            '8c7f93037cc236024cc8be815b2c2bd84f6dc9e32685299e31d4c6c42efde8b7'
            '30df59a9e2d95dcb720357ec4a83d9be51e59cc5551365da4c0073e68ccdec44'
            '4c12d31d020799d31355faa7d1fe2a5a807f7458e7f0c374adf55edb37032152'
            '3255477d02d49ef86d47c727b9369f46dc787319bb648bf267a68f37e2041e50'
            '94baaaa6fbec0af6ec2e967f0b7440b4261a927e853e212d84f0aeaf56ae53f0'
            'f41215af1f98d552cdfde7e924ba6d2f77883310aad57ebba7fe73d3883f8668'
            'dd2d248831dd4944d385ebf008426e66efe61d6fdf66f8932c963a12167947b4'
            'b0ac3422a6ab04859b40d4d7c0fd5f703c893c9ec145c9894c468fbc0a4d457c'
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
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
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
