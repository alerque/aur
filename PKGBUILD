# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: loqs <bugs-archlinux@entropy-collector.net>
# Contributor: kxxt <rsworktech@outlook.com>

# https://releases.electronjs.org/
# https://gitlab.com/Matt.Jolly/chromium-patches/-/tags

# Note: source array can be synced with an Electron release after updating $pkgver with:
# bash -c 'source PKGBUILD; _update_sources'

pkgver=32.2.8
_gcc_patches=127-1
pkgrel=1
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
             # Electron ships a vendored nodejs. Meanwhile the npm dependency pulls in nodejs which is Arch's freshest version.
             # Pinning the closest LTS here makes the build environment more consistent with the vendored copy.
             nodejs-lts-iron
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
             rsync
             rust
             rust-bindgen
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
        # Chromium
        allow-ANGLEImplementation-kVulkan.patch
        compiler-rt-adjust-paths.patch
        increase-fortify-level.patch
        blink-fix-missing-stdlib-include.patch
        # Electron
        default_app-icon.patch
        electron-launcher.sh
        electron.desktop
        jinja-python-3.10.patch
        use-system-libraries-in-node.patch
        makepkg-source-roller.py
        # BEGIN managed sources
        chromium-mirror::git+https://github.com/chromium/chromium.git#tag=128.0.6613.186
        chromium-mirror_third_party_nan::git+https://github.com/nodejs/nan.git#commit=e14bdcd1f72d62bca1d541b66da43130384ec213
        chromium-mirror_third_party_electron_node::git+https://github.com/nodejs/node.git#tag=v20.18.1
        chromium-mirror_third_party_engflow-reclient-configs::git+https://github.com/EngFlow/reclient-configs.git#commit=955335c30a752e9ef7bff375baab5e0819b6c00d
        chromium-mirror_third_party_clang-format_script::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/clang/tools/clang-format.git#commit=3c0acd2d4e73dd911309d9e970ba09d58bf23a62
        chromium-mirror_third_party_libc++_src::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/libcxx.git#commit=6bb75caa139ee1e686d2205910454cf6ea212e58
        chromium-mirror_third_party_libc++abi_src::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/libcxxabi.git#commit=a3c7d3e2f3e1e724b4651891b1a71257cbd88acc
        chromium-mirror_third_party_libunwind_src::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/libunwind.git#commit=d09db732ff68f40fd3581306c650b17ea1955b4e
        chromium-mirror_chrome_test_data_perf_canvas_bench::git+https://chromium.googlesource.com/chromium/canvas_bench.git#commit=a7b40ea5ae0239517d78845a5fc9b12976bfc732
        chromium-mirror_chrome_test_data_perf_frame_rate_content::git+https://chromium.googlesource.com/chromium/frame_rate/content.git#commit=c10272c88463efeef6bb19c9ec07c42bc8fe22b9
        chromium-mirror_chrome_test_data_xr_webvr_info::git+https://chromium.googlesource.com/external/github.com/toji/webvr.info.git#commit=c58ae99b9ff9e2aa4c524633519570bf33536248
        chromium-mirror_media_cdm_api::git+https://chromium.googlesource.com/chromium/cdm.git#commit=fef0b5aa1bd31efb88dfab804bdbe614f3d54f28
        chromium-mirror_native_client::git+https://chromium.googlesource.com/native_client/src/native_client.git#commit=ad617ab7dd5f23a67fcff244b3c3263ffcc7e66d
        chromium-mirror_net_third_party_quiche_src::git+https://quiche.googlesource.com/quiche.git#commit=aecfea159d58ef53bd690688e4aca512fc4a3d35
        chromium-mirror_testing_libfuzzer_fuzzers_wasm_corpus::git+https://chromium.googlesource.com/v8/fuzzer_wasm_corpus.git#commit=f650ff816f2ef227f61ea2e9f222aa69708ab367
        chromium-mirror_third_party_accessibility_test_framework_src::git+https://chromium.googlesource.com/external/github.com/google/Accessibility-Test-Framework-for-Android.git#commit=4a764c690353ea136c82f1a696a70bf38d1ef5fe
        chromium-mirror_third_party_angle::git+https://chromium.googlesource.com/angle/angle.git#commit=713102774487cf1a8b3f433529eb8181cbcec31a
        chromium-mirror_third_party_anonymous_tokens_src::git+https://chromium.googlesource.com/external/github.com/google/anonymous-tokens.git#commit=76bfcccb6418239183df55111f2f24782d9f3680
        chromium-mirror_third_party_content_analysis_sdk_src::git+https://chromium.googlesource.com/external/github.com/chromium/content_analysis_sdk.git#commit=9a408736204513e0e95dd2ab3c08de0d95963efc
        chromium-mirror_third_party_dav1d_libdav1d::git+https://chromium.googlesource.com/external/github.com/videolan/dav1d.git#commit=2355eeb8f254a1c34dbb0241be5c70cdf6ed46d1
        chromium-mirror_third_party_dawn::git+https://dawn.googlesource.com/dawn.git#commit=a79093138c06b0ca942f99ddc39b225dafa4776d
        chromium-mirror_third_party_highway_src::git+https://chromium.googlesource.com/external/github.com/google/highway.git#commit=8295336dd70f1201d42c22ab5b0861de38cf8fbf
        chromium-mirror_third_party_google_benchmark_src::git+https://chromium.googlesource.com/external/github.com/google/benchmark.git#commit=344117638c8ff7e239044fd0fa7085839fc03021
        chromium-mirror_third_party_boringssl_src::git+https://boringssl.googlesource.com/boringssl.git#commit=f01108e4761e1d4189cb134322c3cb01dc71ef87
        chromium-mirror_third_party_breakpad_breakpad::git+https://chromium.googlesource.com/breakpad/breakpad.git#commit=81819541a78c49e9109d2267462775e801f89ce6
        chromium-mirror_third_party_cast_core_public_src::git+https://chromium.googlesource.com/cast_core/public.git#commit=71f51fd6fa45fac73848f65421081edd723297cd
        chromium-mirror_third_party_catapult::git+https://chromium.googlesource.com/catapult.git#commit=523ebded2f72a446544e2d9271ef39857f4e6ae7
        chromium-mirror_third_party_ced_src::git+https://chromium.googlesource.com/external/github.com/google/compact_enc_det.git#commit=ba412eaaacd3186085babcd901679a48863c7dd5
        chromium-mirror_third_party_chromium-variations::git+https://chromium.googlesource.com/chromium-variations.git#commit=c134de595151ae72a112767e22da4448eb50e57f
        chromium-mirror_third_party_cld_3_src::git+https://chromium.googlesource.com/external/github.com/google/cld_3.git#commit=b48dc46512566f5a2d41118c8c1116c4f96dc661
        chromium-mirror_third_party_colorama_src::git+https://chromium.googlesource.com/external/colorama.git#commit=3de9f013df4b470069d03d250224062e8cf15c49
        chromium-mirror_third_party_cpu_features_src::git+https://chromium.googlesource.com/external/github.com/google/cpu_features.git#commit=936b9ab5515dead115606559502e3864958f7f6e
        chromium-mirror_third_party_cpuinfo_src::git+https://chromium.googlesource.com/external/github.com/pytorch/cpuinfo.git#commit=ca678952a9a8eaa6de112d154e8e104b22f9ab3f
        chromium-mirror_third_party_crc32c_src::git+https://chromium.googlesource.com/external/github.com/google/crc32c.git#commit=fa5ade41ee480003d9c5af6f43567ba22e4e17e6
        chromium-mirror_third_party_cros_system_api::git+https://chromium.googlesource.com/chromiumos/platform2/system_api.git#commit=86bdf11581c80f776bfdf54db7f39f930fd6abaf
        chromium-mirror_third_party_crossbench::git+https://chromium.googlesource.com/crossbench.git#commit=b03a515f9e56280ecabfb254b188349d1a049827
        chromium-mirror_third_party_depot_tools::git+https://chromium.googlesource.com/chromium/tools/depot_tools.git#commit=31e21628c3a558d4f2189712e25849d608b3ff8c
        chromium-mirror_third_party_devtools-frontend_src::git+https://chromium.googlesource.com/devtools/devtools-frontend.git#commit=47f04a536265028feb1254a3663853e0ce526455
        chromium-mirror_third_party_dom_distiller_js_dist::git+https://chromium.googlesource.com/chromium/dom-distiller/dist.git#commit=199de96b345ada7c6e7e6ba3d2fa7a6911b8767d
        chromium-mirror_third_party_eigen3_src::git+https://chromium.googlesource.com/external/gitlab.com/libeigen/eigen.git#commit=33d0937c6bdf5ec999939fb17f2a553183d14a74
        chromium-mirror_third_party_farmhash_src::git+https://chromium.googlesource.com/external/github.com/google/farmhash.git#commit=816a4ae622e964763ca0862d9dbd19324a1eaf45
        chromium-mirror_third_party_ffmpeg::git+https://chromium.googlesource.com/chromium/third_party/ffmpeg.git#commit=d941d9677bb4802f01750fd908ec284fb72c84df
        chromium-mirror_third_party_flac::git+https://chromium.googlesource.com/chromium/deps/flac.git#commit=689da3a7ed50af7448c3f1961d1791c7c1d9c85c
        chromium-mirror_third_party_flatbuffers_src::git+https://chromium.googlesource.com/external/github.com/google/flatbuffers.git#commit=fb9afbafc7dfe226b9db54d4923bfb8839635274
        chromium-mirror_third_party_fontconfig_src::git+https://chromium.googlesource.com/external/fontconfig.git#commit=14d466b30a8ab4a9d789977ed94f2c30e7209267
        chromium-mirror_third_party_fp16_src::git+https://chromium.googlesource.com/external/github.com/Maratyszcza/FP16.git#commit=0a92994d729ff76a58f692d3028ca1b64b145d91
        chromium-mirror_third_party_gemmlowp_src::git+https://chromium.googlesource.com/external/github.com/google/gemmlowp.git#commit=13d57703abca3005d97b19df1f2db731607a7dc2
        chromium-mirror_third_party_grpc_src::git+https://chromium.googlesource.com/external/github.com/grpc/grpc.git#commit=822dab21d9995c5cf942476b35ca12a1aa9d2737
        chromium-mirror_third_party_freetype_src::git+https://chromium.googlesource.com/chromium/src/third_party/freetype2.git#commit=37cefe33b284d0bad4ec52bcccc1a8c2d8704340
        chromium-mirror_third_party_freetype-testing_src::git+https://chromium.googlesource.com/external/github.com/freetype/freetype2-testing.git#commit=7a69b1a2b028476f840ab7d4a2ffdfe4eb2c389f
        chromium-mirror_third_party_fxdiv_src::git+https://chromium.googlesource.com/external/github.com/Maratyszcza/FXdiv.git#commit=63058eff77e11aa15bf531df5dd34395ec3017c8
        chromium-mirror_third_party_harfbuzz-ng_src::git+https://chromium.googlesource.com/external/github.com/harfbuzz/harfbuzz.git#commit=1da053e87f0487382404656edca98b85fe51f2fd
        chromium-mirror_third_party_instrumented_libs::git+https://chromium.googlesource.com/chromium/third_party/instrumented_libraries.git#commit=bb6dbcf2df7a9beb34c3773ef4df161800e3aed9
        chromium-mirror_third_party_emoji-segmenter_src::git+https://chromium.googlesource.com/external/github.com/google/emoji-segmenter.git#commit=9ba6d25d0d9313569665d4a9d2b34f0f39f9a50e
        chromium-mirror_third_party_ots_src::git+https://chromium.googlesource.com/external/github.com/khaledhosny/ots.git#commit=46bea9879127d0ff1c6601b078e2ce98e83fcd33
        chromium-mirror_third_party_libgav1_src::git+https://chromium.googlesource.com/codecs/libgav1.git#commit=a2f139e9123bdb5edf7707ac6f1b73b3aa5038dd
        chromium-mirror_third_party_googletest_src::git+https://chromium.googlesource.com/external/github.com/google/googletest.git#commit=cee1ba1f24fb12b9ae8f31e70dca3f73dbb12cc2
        chromium-mirror_third_party_hunspell_dictionaries::git+https://chromium.googlesource.com/chromium/deps/hunspell_dictionaries.git#commit=41cdffd71c9948f63c7ad36e1fb0ff519aa7a37e
        chromium-mirror_third_party_icu::git+https://chromium.googlesource.com/chromium/deps/icu.git#commit=9408c6fd4a39e6fef0e1c4077602e1c83b15f3fb
        chromium-mirror_third_party_jsoncpp_source::git+https://chromium.googlesource.com/external/github.com/open-source-parsers/jsoncpp.git#commit=42e892d96e47b1f6e29844cc705e148ec4856448
        chromium-mirror_third_party_leveldatabase_src::git+https://chromium.googlesource.com/external/leveldb.git#commit=068d5ee1a3ac40dabd00d211d5013af44be55bea
        chromium-mirror_third_party_libFuzzer_src::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/compiler-rt/lib/fuzzer.git#commit=758bd21f103a501b362b1ca46fa8fcb692eaa303
        chromium-mirror_third_party_fuzztest_src::git+https://chromium.googlesource.com/external/github.com/google/fuzztest.git#commit=32eb84a95951fa3a0148fb3e6a1a02f830ded136
        chromium-mirror_third_party_libaddressinput_src::git+https://chromium.googlesource.com/external/libaddressinput.git#commit=e8712e415627f22d0b00ebee8db99547077f39bd
        chromium-mirror_third_party_libaom_source_libaom::git+https://aomedia.googlesource.com/aom.git#commit=93b8eee4f428675195c5c76e8da719ff50c2a01c
        chromium-mirror_third_party_libavif_src::git+https://chromium.googlesource.com/external/github.com/AOMediaCodec/libavif.git#commit=03acd65314fe29e6627cf4eab752819f6ee15d74
        chromium-mirror_third_party_crabbyavif_src::git+https://chromium.googlesource.com/external/github.com/webmproject/CrabbyAvif.git#commit=716408df5cb6d43ebe31cb24194979b81a83b03c
        chromium-mirror_third_party_libavifinfo_src::git+https://aomedia.googlesource.com/libavifinfo.git#commit=8d8b58a3f517ef8d1794baa28ca6ae7d19f65514
        chromium-mirror_third_party_nearby_src::git+https://chromium.googlesource.com/external/github.com/google/nearby-connections.git#commit=76651429b8f96fc6c80949ba8f4e18c4b738e216
        chromium-mirror_third_party_beto-core_src::git+https://beto-core.googlesource.com/beto-core.git#commit=08537fdd2b0990270ea0214a61dfd318f293bc15
        chromium-mirror_third_party_securemessage_src::git+https://chromium.googlesource.com/external/github.com/google/securemessage.git#commit=fa07beb12babc3b25e0c5b1f38c16aa8cb6b8f84
        chromium-mirror_third_party_speedometer_v3.0::git+https://chromium.googlesource.com/external/github.com/WebKit/Speedometer.git#commit=8d67f28d0281ac4330f283495b7f48286654ad7d
        chromium-mirror_third_party_ukey2_src::git+https://chromium.googlesource.com/external/github.com/google/ukey2.git#commit=0275885d8e6038c39b8a8ca55e75d1d4d1727f47
        chromium-mirror_third_party_cros-components_src::git+https://chromium.googlesource.com/external/google3/cros_components.git#commit=39e57dd0d30ed019d6fb07c24b350f5fe78a1625
        chromium-mirror_third_party_libdrm_src::git+https://chromium.googlesource.com/chromiumos/third_party/libdrm.git#commit=98e1db501173303e58ef6a1def94ab7a2d84afc1
        chromium-mirror_third_party_expat_src::git+https://chromium.googlesource.com/external/github.com/libexpat/libexpat.git#commit=a59c3edffa54a77b8d7b268ef527da541076ca6a
        chromium-mirror_third_party_libipp_libipp::git+https://chromium.googlesource.com/chromiumos/platform2/libipp.git#commit=2209bb84a8e122dab7c02fe66cc61a7b42873d7f
        chromium-mirror_third_party_libjpeg_turbo::git+https://chromium.googlesource.com/chromium/deps/libjpeg_turbo.git#commit=ccfbe1c82a3b6dbe8647ceb36a3f9ee711fba3cf
        chromium-mirror_third_party_liblouis_src::git+https://chromium.googlesource.com/external/liblouis-github.git#commit=9700847afb92cb35969bdfcbbfbbb74b9c7b3376
        chromium-mirror_third_party_libphonenumber_dist::git+https://chromium.googlesource.com/external/libphonenumber.git#commit=140dfeb81b753388e8a672900fb7a971e9a0d362
        chromium-mirror_third_party_libprotobuf-mutator_src::git+https://chromium.googlesource.com/external/github.com/google/libprotobuf-mutator.git#commit=a304ec48dcf15d942607032151f7e9ee504b5dcf
        chromium-mirror_third_party_libsrtp::git+https://chromium.googlesource.com/chromium/deps/libsrtp.git#commit=7a7e64c8b5a632f55929cb3bb7d3e6fb48c3205a
        chromium-mirror_third_party_libsync_src::git+https://chromium.googlesource.com/aosp/platform/system/core/libsync.git#commit=f4f4387b6bf2387efbcfd1453af4892e8982faf6
        chromium-mirror_third_party_libvpx_source_libvpx::git+https://chromium.googlesource.com/webm/libvpx.git#commit=057e53d759ac05417bbc7880b1d2e2ac7f08fc67
        chromium-mirror_third_party_libwebm_source::git+https://chromium.googlesource.com/webm/libwebm.git#commit=e4fbea0c9751ae8aa86629b197a28d8276a2b0da
        chromium-mirror_third_party_libwebp_src::git+https://chromium.googlesource.com/webm/libwebp.git#commit=845d5476a866141ba35ac133f856fa62f0b7445f
        chromium-mirror_third_party_libyuv::git+https://chromium.googlesource.com/libyuv/libyuv.git#commit=a6a2ec654b1be1166b376476a7555c89eca0c275
        chromium-mirror_third_party_lss::git+https://chromium.googlesource.com/linux-syscall-support.git#commit=ce877209e11aa69dcfffbd53ef90ea1d07136521
        chromium-mirror_third_party_material_color_utilities_src::git+https://chromium.googlesource.com/external/github.com/material-foundation/material-color-utilities.git#commit=13434b50dcb64a482cc91191f8cf6151d90f5465
        chromium-mirror_third_party_minigbm_src::git+https://chromium.googlesource.com/chromiumos/platform/minigbm.git#commit=3018207f4d89395cc271278fb9a6558b660885f5
        chromium-mirror_third_party_nasm::git+https://chromium.googlesource.com/chromium/deps/nasm.git#commit=f477acb1049f5e043904b87b825c5915084a9a29
        chromium-mirror_third_party_neon_2_sse_src::git+https://chromium.googlesource.com/external/github.com/intel/ARM_NEON_2_x86_SSE.git#commit=a15b489e1222b2087007546b4912e21293ea86ff
        chromium-mirror_third_party_openh264_src::git+https://chromium.googlesource.com/external/github.com/cisco/openh264.git#commit=09a4f3ec842a8932341b195c5b01e141c8a16eb7
        chromium-mirror_third_party_openscreen_src::git+https://chromium.googlesource.com/openscreen.git#commit=4f7c05781bc43e93706b0330eb830e2bc33fcb6c
        chromium-mirror_third_party_openxr_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/OpenXR-SDK.git#commit=95fe35ffb383710a6e0567e958ead9a3b66e930c
        chromium-mirror_third_party_pdfium::git+https://pdfium.googlesource.com/pdfium.git#commit=66c80ddf43e3c3181d404607dcdc0cf37fdf7675
        chromium-mirror_third_party_perfetto::git+https://android.googlesource.com/platform/external/perfetto.git#commit=077d742d9f9738a0453e408560a283a7514c9e8e
        chromium-mirror_third_party_protobuf-javascript_src::git+https://chromium.googlesource.com/external/github.com/protocolbuffers/protobuf-javascript.git#commit=e34549db516f8712f678fcd4bc411613b5cc5295
        chromium-mirror_third_party_pthreadpool_src::git+https://chromium.googlesource.com/external/github.com/Maratyszcza/pthreadpool.git#commit=4fe0e1e183925bf8cfa6aae24237e724a96479b8
        chromium-mirror_third_party_pyelftools::git+https://chromium.googlesource.com/chromiumos/third_party/pyelftools.git#commit=19b3e610c86fcadb837d252c794cb5e8008826ae
        chromium-mirror_third_party_quic_trace_src::git+https://chromium.googlesource.com/external/github.com/google/quic-trace.git#commit=caa0a6eaba816ecb737f9a70782b7c80b8ac8dbc
        chromium-mirror_third_party_pywebsocket3_src::git+https://chromium.googlesource.com/external/github.com/GoogleChromeLabs/pywebsocket3.git#commit=50602a14f1b6da17e0b619833a13addc6ea78bc2
        chromium-mirror_third_party_re2_src::git+https://chromium.googlesource.com/external/github.com/google/re2.git#commit=6dcd83d60f7944926bfd308cc13979fc53dd69ca
        chromium-mirror_third_party_ruy_src::git+https://chromium.googlesource.com/external/github.com/google/ruy.git#commit=c08ec529fc91722bde519628d9449258082eb847
        chromium-mirror_third_party_skia::git+https://skia.googlesource.com/skia.git#commit=cd98397d0c2c3eb1d5a8d76aade3c87c2e0d28ac
        chromium-mirror_third_party_smhasher_src::git+https://chromium.googlesource.com/external/smhasher.git#commit=e87738e57558e0ec472b2fc3a643b838e5b6e88f
        chromium-mirror_third_party_snappy_src::git+https://chromium.googlesource.com/external/github.com/google/snappy.git#commit=c9f9edf6d75bb065fa47468bf035e051a57bec7c
        chromium-mirror_third_party_sqlite_src::git+https://chromium.googlesource.com/chromium/deps/sqlite.git#commit=9e45bccab2b8de8140c1732b0ec490db0362f730
        chromium-mirror_third_party_swiftshader::git+https://swiftshader.googlesource.com/SwiftShader.git#commit=c4dfa69de7deecf52c6b53badbc8bb7be1a05e8c
        chromium-mirror_third_party_text-fragments-polyfill_src::git+https://chromium.googlesource.com/external/github.com/GoogleChromeLabs/text-fragments-polyfill.git#commit=c036420683f672d685e27415de0a5f5e85bdc23f
        chromium-mirror_third_party_tflite_src::git+https://chromium.googlesource.com/external/github.com/tensorflow/tensorflow.git#commit=f9122e774969459927e9d956674c0aac06eb3b68
        chromium-mirror_third_party_vulkan-deps::git+https://chromium.googlesource.com/vulkan-deps.git#commit=d8095b45a0b2dcc2a85327ff4cc306c618dfa39a
        chromium-mirror_third_party_glslang_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/glslang.git#commit=dc9f6f61adaec755a09e1943cf7014c688443bcb
        chromium-mirror_third_party_spirv-cross_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/SPIRV-Cross.git#commit=b8fcf307f1f347089e3c46eb4451d27f32ebc8d3
        chromium-mirror_third_party_spirv-headers_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/SPIRV-Headers.git#commit=db5a00f8cebe81146cafabf89019674a3c4bf03d
        chromium-mirror_third_party_spirv-tools_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/SPIRV-Tools.git#commit=a0817526b8e391732632e6a887134be256a20a18
        chromium-mirror_third_party_vulkan-headers_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Headers.git#commit=fabe9e2672334fdb9a622d42a2e8f94578952082
        chromium-mirror_third_party_vulkan-loader_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Loader.git#commit=5892ebe2d7505c2238a643288d9a5b2e68784a36
        chromium-mirror_third_party_vulkan-tools_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Tools.git#commit=2cee0d5b1d8c34e26fd6d9992d3d428ac4c5139d
        chromium-mirror_third_party_vulkan-utility-libraries_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Utility-Libraries.git#commit=67522b34edde86dbb97e164280291f387ade55fc
        chromium-mirror_third_party_vulkan-validation-layers_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-ValidationLayers.git#commit=919599474e6e6639527e7c3775ed1064665412d3
        chromium-mirror_third_party_vulkan_memory_allocator::git+https://chromium.googlesource.com/external/github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git#commit=56300b29fbfcc693ee6609ddad3fdd5b7a449a21
        chromium-mirror_third_party_wayland_src::git+https://chromium.googlesource.com/external/anongit.freedesktop.org/git/wayland/wayland.git#commit=31577177454b89db37ceabd94e1640d398adbc87
        chromium-mirror_third_party_wayland-protocols_src::git+https://chromium.googlesource.com/external/anongit.freedesktop.org/git/wayland/wayland-protocols.git#commit=c7e9c4f5d396cda4051e49b15d7d0e4f91e4efac
        chromium-mirror_third_party_wayland-protocols_kde::git+https://chromium.googlesource.com/external/github.com/KDE/plasma-wayland-protocols.git#commit=0b07950714b3a36c9b9f71fc025fc7783e82926e
        chromium-mirror_third_party_wayland-protocols_gtk::git+https://chromium.googlesource.com/external/github.com/GNOME/gtk.git#commit=40ebed3a03aef096addc0af09fec4ec529d882a0
        chromium-mirror_third_party_webdriver_pylib::git+https://chromium.googlesource.com/external/github.com/SeleniumHQ/selenium/py.git#commit=fc5e7e70c098bfb189a9a74746809ad3c5c34e04
        chromium-mirror_third_party_webgl_src::git+https://chromium.googlesource.com/external/khronosgroup/webgl.git#commit=1b6371436a0a60e6b9a4ae2a40a8eba198e3af02
        chromium-mirror_third_party_webgpu-cts_src::git+https://chromium.googlesource.com/external/github.com/gpuweb/cts.git#commit=198d1770062c1a8aba86e7d6e001bb47bea028ee
        chromium-mirror_third_party_webrtc::git+https://webrtc.googlesource.com/src.git#commit=f237dc146debcfde3d70038c2b66f71bfea8d24b
        chromium-mirror_third_party_wuffs_src::git+https://skia.googlesource.com/external/github.com/google/wuffs-mirror-release-c.git#commit=e3f919ccfe3ef542cfc983a82146070258fb57f8
        chromium-mirror_third_party_weston_src::git+https://chromium.googlesource.com/external/anongit.freedesktop.org/git/wayland/weston.git#commit=ccf29cb237c3ed09c5f370f35239c93d07abfdd7
        chromium-mirror_third_party_xdg-utils::git+https://chromium.googlesource.com/chromium/deps/xdg-utils.git#commit=cb54d9db2e535ee4ef13cc91b65a1e2741a94a44
        chromium-mirror_third_party_xnnpack_src::git+https://chromium.googlesource.com/external/github.com/google/XNNPACK.git#commit=8df2e765487685757ab5dabd12516cd0a24e3e25
        chromium-mirror_tools_page_cycler_acid3::git+https://chromium.googlesource.com/chromium/deps/acid3.git#commit=a926d0a32e02c4c03ae95bb798e6c780e0e184ba
        chromium-mirror_third_party_zstd_src::git+https://chromium.googlesource.com/external/github.com/facebook/zstd.git#commit=0ff651dd876823b99fa5c5f53292be28381aee9b
        chromium-mirror_v8::git+https://chromium.googlesource.com/v8/v8.git#commit=d213b3bbc0ecf17ccd2849fdef3bccb1946b01b3
        chromium-mirror_third_party_angle_third_party_glmark2_src::git+https://chromium.googlesource.com/external/github.com/glmark2/glmark2.git#commit=ca8de51fedb70bace5351c6b002eb952c747e889
        chromium-mirror_third_party_angle_third_party_rapidjson_src::git+https://chromium.googlesource.com/external/github.com/Tencent/rapidjson.git#commit=781a4e667d84aeedbeb8184b7b62425ea66ec59f
        chromium-mirror_third_party_angle_third_party_VK-GL-CTS_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/VK-GL-CTS.git#commit=5b2dfe7c775aa7b7909432944ba3535abcd25fc9
        chromium-mirror_third_party_dawn_buildtools::git+https://chromium.googlesource.com/chromium/src/buildtools.git#commit=9cac81256beb5d4d36c8801afeae38fea34b8486
        chromium-mirror_third_party_dawn_build::git+https://chromium.googlesource.com/chromium/src/build.git#commit=5328cf8d5599a47ce0157bd390e7de050b3efe69
        chromium-mirror_third_party_dawn_tools_clang::git+https://chromium.googlesource.com/chromium/src/tools/clang.git#commit=303336503ee5018769a2681538289058dbd28947
        chromium-mirror_third_party_dawn_testing::git+https://chromium.googlesource.com/chromium/src/testing.git#commit=1bd0da6657e330cf26ed0702b3f456393587ad7c
        chromium-mirror_third_party_dawn_third_party_jinja2::git+https://chromium.googlesource.com/chromium/src/third_party/jinja2.git#commit=e2d024354e11cc6b041b0cff032d73f0c7e43a07
        chromium-mirror_third_party_dawn_third_party_markupsafe::git+https://chromium.googlesource.com/chromium/src/third_party/markupsafe.git#commit=0bad08bb207bbfc1d6f3bbc82b9242b0c50e5794
        chromium-mirror_third_party_dawn_third_party_glfw::git+https://chromium.googlesource.com/external/github.com/glfw/glfw.git#commit=b35641f4a3c62aa86a0b3c983d163bc0fe36026d
        chromium-mirror_third_party_dawn_third_party_zlib::git+https://chromium.googlesource.com/chromium/src/third_party/zlib.git#commit=209717dd69cd62f24cbacc4758261ae2dd78cfac
        chromium-mirror_third_party_dawn_third_party_abseil-cpp::git+https://chromium.googlesource.com/chromium/src/third_party/abseil-cpp.git#commit=f81f6c011baf9b0132a5594c034fe0060820711d
        chromium-mirror_third_party_dawn_third_party_dxc::git+https://chromium.googlesource.com/external/github.com/microsoft/DirectXShaderCompiler.git#commit=ee5422d3f33c0bfd8643ce7782eb3a216cf15dea
        chromium-mirror_third_party_dawn_third_party_dxheaders::git+https://chromium.googlesource.com/external/github.com/microsoft/DirectX-Headers.git#commit=980971e835876dc0cde415e8f9bc646e64667bf7
        chromium-mirror_third_party_dawn_third_party_webgpu-headers::git+https://chromium.googlesource.com/external/github.com/webgpu-native/webgpu-headers.git#commit=8049c324dc7b3c09dc96ea04cb02860f272c8686
        chromium-mirror_third_party_dawn_third_party_khronos_OpenGL-Registry::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/OpenGL-Registry.git#commit=5bae8738b23d06968e7c3a41308568120943ae77
        chromium-mirror_third_party_dawn_third_party_khronos_EGL-Registry::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/EGL-Registry.git#commit=7dea2ed79187cd13f76183c4b9100159b9e3e071
        chromium-mirror_third_party_dawn_third_party_protobuf::git+https://chromium.googlesource.com/chromium/src/third_party/protobuf.git#commit=41759e11ec427e29e1a72b9401d2af3f6e02d839
        chromium-mirror_third_party_dawn_tools_protoc_wrapper::git+https://chromium.googlesource.com/chromium/src/tools/protoc_wrapper.git#commit=b5ea227bd88235ab3ccda964d5f3819c4e2d8032
        chromium-mirror_third_party_dawn_third_party_jsoncpp::git+https://github.com/open-source-parsers/jsoncpp.git#commit=69098a18b9af0c47549d9a271c054d13ca92b006
        chromium-mirror_third_party_dawn_third_party_langsvr::git+https://github.com/google/langsvr.git#commit=303c526231a90049a3e384549720f3fbd453cf66
        chromium-mirror_third_party_dawn_third_party_partition_alloc::git+https://chromium.googlesource.com/chromium/src/base/allocator/partition_allocator.git#commit=2e6b2efb6f435aa3dd400cb3bdcead2a601f8f9a
        chromium-mirror_third_party_openscreen_src_third_party_tinycbor_src::git+https://chromium.googlesource.com/external/github.com/intel/tinycbor.git#commit=d393c16f3eb30d0c47e6f9d92db62272f0ec4dc7
        # END managed sources
        )
sha256sums=('6b2db9fce0f503ced9ed15c8711fd14d8a631e4cb45c11b061df7341da94293c'
            '3dfc43d901b96273201ba6d6d8b932b07c3661942d42a8bb0aae2c547757c73d'
            '1a5bc75a90abad153c8eb6dbdce138132a5f11190b0a40c925958a72d706b2aa'
            'b3de01b7df227478687d7517f61a777450dca765756002c80c4915f271e2d961'
            'd634d2ce1fc63da7ac41f432b1e84c59b7cceabf19d510848a7cff40c8025342'
            'a4a822e135b253c93089a80c679842cc470c6936742767ae09d952646889abd6'
            'dd2d248831dd4944d385ebf008426e66efe61d6fdf66f8932c963a12167947b4'
            '13fcf26193f4417fd5dfbc82a3f24e5c7a1cce82f729f6a73f1b1d3a7b580b34'
            '4484200d90b76830b69eea3a471c103999a3ce86bb2c29e6c14c945bf4102bae'
            '55dbe71dbc1f3ab60bf1fa79f7aea7ef1fe76436b1d7df48728a1f8227d2134e'
            'ff588a8a4fd2f79eb8a4f11cf1aa151298ffb895be566c57cc355d47f161f53f'
            '2c8cd28cee0e1df1862e801794f210d2b7cac652f943cf94f43c2abe26f2a2f4'
            'baa35155ba83c8c0ae5faf1f82a92a7ed5fa6b4e61c7c5369fee8fc068e75dec'
            '0b7a546ee6913c49519c10c293ac530ff381641a8a465fa2e184d6dbe0fb784d'
            '07dc86368ae75c7605ef15ab9b95db07bdb53840b7ff5ccf8dc6014e13dcafcf'
            '3522166c3ca75316a172b7cc4fe12bba9367e30fed16df8193ede2e236dca8c5'
            'b7ab26b28122102827dbbefa54a38f9d59729bbdab889dcc6dba672141590717'
            'e65012ae3fceb5a01c33b17b56335744d18a2655ae72387f13a52002d8b5c74c'
            '3fd66bdf2e745fb731505f6b080f3cb9452515d41db9d4c18b46308ecae7cf5b'
            '924e66f1a1894812d63523c04151892a66d2e386805f9c782ec6981d34a45001'
            '5abf726ce9e19c0b0e7818a7ced615a1a6d16f306e7315b9e6db53118c0669b5'
            '045eb27642ac8f49b52efec7c52bb6ea3c908552ffadc50449a23b27da7a4737'
            '8a8c21768a1f3764e6887cfc907dd857e9fc00a1269dd858e2ba98d70aef889d'
            'a62dd76d5ebcae2e2302509f057d21c35ffd69549ee7cdac47b2a85616dcc9be'
            'ea64becd0becfeda1fd59134b2cde815048431a7346797a17c07e67eff6b8980'
            'cc95975be1b66198a19df01a3371bcf95aed43a31fb08296d826341604e9aded'
            'ece1dee7d933f441230b956458bd3c134f31659cf112c85ec276f085391dd106'
            'de6dba1f7c67cb568c5f23e75a994422944ce46c01fc35bddae4ebc023a7145a'
            'da4e3dce6b0053cedcdefcab1a8d01e5b5272b6d8527ac1ef8fb98bed1ea6e3e'
            '5fb406ade86dd0627eb4323d3822072bc65927424e642fad3eb92565617335d5'
            '89a368f0652d857d38402d6f3c5cded3c1757230ab7abe01df850a7bf8359119'
            'dcf5b7cf2f74ea877c7c6021047784a47fae63e285d1438d7ec7801b3c7ed551'
            '3532cd2676d90bf56333aff4892c5a62f69434b8c7318191fb2fb88549179449'
            '48bdb7a462a52e890a9b8536d21924d0a4fe3f0dcb9a90a976fcd7a3e2526899'
            'bd07cc3f0dfa91629028ed53691eec8e0bf9bed7b3a602f4b8e78a7472e4e6fb'
            'afc7b2852565a1d746563544304229e74a9cbdc061d6afdb12721227bea804cb'
            '39b3274c037521ac8a9c220c01c19c0b68e4cfa069b6d73c2d69631e6becb594'
            'af24f30b90d5942ecb89b9e5f373de70ec16ce590788a03a8d21f714bbca7337'
            '835cd6f003cf35fab1930a4242707f5784dfbe0b00325403a8df7030dd9f4ad0'
            '8b97c25874c17644300d1cbe6ac1fceb705bf18297e27699ba20497fc47ae239'
            '9fb8a52d2203feed8b6b734d86ef986c79d6e38773a1739982deda05a2522479'
            'e6a28c25e3d93c9c37414149ff44ac7a1bbb4d8a167061f8ee9679dc065af1bb'
            '9e950d9f0bf7f0b52de6744de0922583b4b32281e87f0488c2d1cfc533665aa5'
            '6125206b56f365874ba812038dbcd4271f8a73235ab4d211c42b7fd2d636bbc8'
            'afeeed068a01f09c576a0b33a0faf7fdb79552862cde5cb01622eb50c46629d7'
            '4f5fd6719234fbc67c517e20e2170db66d37455d69bec880624a0a0304a0e91c'
            '77fb29fc727d5ddf4c16dc6ce5687b9715b473d21370c007c781d898e710490e'
            '9235955e7a1b127578862e802c907a11b101000e701ab71ab1cc60f915b9fdb7'
            '910f4e9be9d0120da373f450781beb9f42703a9e162d747f4eb105aa6b990ce2'
            '650381277124cf6afcdb051ea6299d4aa79853d1a960477461b2b60ef0443a41'
            '47f3f3d044cc0658274833022db1e7695964b1da8f37cb905882d15457212fba'
            '8a0d0c77df5016c6898c203583388bd47d62998d2dff851782aa5f7567d25eb2'
            '6258126c4c354ccacd0ec5f9f82c6970d576359c7aba86e44277b459d1645325'
            '754c24c09cecc31032c1a30be066c5cac6b6c3b09f047b376f227f71242ab801'
            'cf96ae84ef29434dd20b0f2daca6013373dd6e47c87cde3aa03abce0500a9f03'
            'b3f646041520f7da1f02cb4b688b6b840f7bb2e97763d66ea60993cf5016a856'
            '0db8417b0fd669b95227c266cbc578af1f5e00198fd24f51fee8cfcfccb8b06b'
            '5d0c4f261d36707f926fa9ef9a39349f1cccac8ae6443a8f8571c1625eb90c41'
            '1a1e2859649a95beef8dba22e8c77735652a212bc88a9bb4dfe1458667dcabbc'
            '792d29bbb3fdcfdf21face515e6b9fba1a14ee7bdc82f0cff9620592925425c9'
            '3ddabb58459225a7a6243da79ec1fbcec0a9c3965eddecab0b31181885aaab7b'
            '12081574c11ef21850e9d2cf62580216296a6b7af48f679e6c28e05a376d1f3d'
            '0f27ab5434870f31886d7c958ced4ff335a09a1080637fb50afdf95db19e3442'
            'd0697f71f188829bcb9e98b229340ea77ee1c5185a02168ac509fbd5c02e7b1b'
            '753cb94b49f25fd25aa045569722d4780591bf060f17644d9b78e7e83b3fdfc8'
            '88cdf771889253831a8873b3234e80cd0b6604bd1fc31a93cff36fa9c2281159'
            'af81f653b73270d4b8f9d1e92ecf39821498c08f4ca5c69872e39bac90b40083'
            '6ae17c7b6b1a897550f3b099f4f8f1ca84eb41c3f1d7711d43359040a5450495'
            'a2ec217907a8d9edee9c099e0cca6fb83325c37edd3ab09ecc833268022fa54f'
            '92fe0e99dea519a56b80321646b7b2b674564f4e8d036cbbf4d98e8588531720'
            '1003d83645cd2de46dd087e3fa3c6281464b0322c68fa8a95a1401b8548eb59c'
            '9f58ce3d45baf6796965aa79109af62c330f82b97d320bb5d7bbbdea0e579a92'
            '0debfc572068aeab2fa4e6e7ba45fc14a402fa735423cc9bbfc5ce94a8cd074d'
            '1a7d08a586c05f35cee816b3a6a4ad807f21d0d8cd04eb4024997b0e89737d2f'
            'a908f0104cec2ce43f24c242089ea35727540445e061be2a3dc134b64dcc8053'
            '63e3cc92fb9b5b9181082eb8ba1574a11e4c36272d10930c4bd7610fed17308a'
            'c58923548fdc3c60ab6d259705b33d10142aa5931d97a0abb8473424c18ab3c5'
            'e1367040808b67e87fa28d4409a385808581c7d704d711e5dd92717e4dc77dd7'
            '1bb87c9be25ca051f9f21f79f8e0e9edb4e8495ab262aad2081eecfb67d08ad0'
            '46890b0f4deddc446e5ec9de234b78163d43c593f39edc1c4b04b721d49850d7'
            'c1f6506f1be9196f14d7118924b8dfd8de788b43f073935797d00218308b3143'
            '8245cbb1cba1b87ac81e26521c44f2d555b78ff9f4f12e058fa6811424b9f25e'
            '66b8f66432b1325861b5f411c71ec49fa171d9a0063bf958242ddde6ce09c12f'
            'f849a0242720e6389140b7d7853e9f56186bac9793aea5e7b9b713d76847c398'
            '9c888babaaf59afc855d944e8b26ab573d5e80026dc3bc8dc64720b8f5bb27a2'
            '1c4ea9b07087812a1be8a134bd277e430b4661281a77ec68b4e92faaa78de8b6'
            'f90cb311a300832f764a36141fe4ffbda8d3303787bcc12805acc09066c7ba75'
            'bff6c312f1bc2ca7fd64fc36578d30e385fddd08473e46f1a3a18de5b345245a'
            'fe2f23319ca61ecb2fac8e586ad71fe36ba340fd4f5c4d0372d0e119d5c264e0'
            '92c2559fc53d03ba600f37684526f1a9aa9d4e0e64a278cb5742b37695e9086f'
            '4070e77bf7afd9fb949067f63c3580d1f5badacfe4c2ab187129ba20446efd04'
            '9c8de69ad47af04565a89920c08f44694f97d7a16f8f23610e5beaf9f38cb71c'
            '25906418111df0d29db783092d94148e130592d722393ad4bd76809c6f63f9bd'
            '7e93683e6c8e7ba51d01a11b602661b0952e897c0f7fdedb1a205957aa496067'
            '9341676174943fbc5268e023c3e572171289fc4748401723a6dcaef50f793dcd'
            '03f8d2c020a4ee41a4ecc29f8217f16f931719ff2ef8b04572fe1c3092ce066b'
            '7b32c27a5513c451032132fe5dc724de23d3b0738a0609a96bd44deee1d46681'
            'c06f2a92cd606654ec565c2fa728e755eaaf7e7a41fb7bd217988274a411c320'
            '82003e56072e56ab65267e3366b37a6a75730d846881fe6167965205d1c2549c'
            'e475d42b746955422ff9e905354091d0b17cdb2c8989cc6beb6470e76a4aa1dd'
            'f2aba031573fc4929d2bd9d03e4b18c4385f399fa0b605eca35898567ebdf7b4'
            '9010695b87eef676b62ec429879972c135987dab6eb53b0a4edf1b5a7cb0bb8b'
            '3d55fa9e1d628aed3e127b6fb4d3dd47b7ada7b865f683f52e21a51043827479'
            'd1c16289a7869f143d72e6d574d4f27f439fd2fd027064dcce1dd6a6aee75d00'
            '1f3ed3b9c74a3553539687d0797fd29e202e5c00dd465df443420bea36888e4d'
            '1b1120b847f566af87bf62583a209749624ae08e0cb82079c5fe82a7f9c2e172'
            '0c82b35ab74b47cb90e37dcffa27a341339567403aa59b7866bee77251878e13'
            '3a4d82fb377716329d476dfb2dedec99f91da81a5b567f5ba2fc6299205bdd7a'
            '866f11aba231f917abb8890788f9fdbd6b13a62a41344a2ae4051ffba0d980ff'
            '78f5096d2d425b9663cb289964d994c9a15db7938c5a1a35cc4b286014ca2545'
            'd42b085e33a0961dcc74d9484e67bed481f6a626d9598b0e6d9bae54dd5205ba'
            '99995f0ca85ab0e85bd291e5336657df41409a48ca5439dcaf162d8b11ac0ec6'
            'dc1206af7485794e1644097b08736e39c8fa50296e514561f8805c6d28b58925'
            '599bbbabf9e2dc2006dd9e3e9636c4f648360726173793bf6a5a5414698762c5'
            'b7a7a43eae0f41a9e18f54c2334d5797a547238b76d64d59ede26a4d6621de0d'
            '39d7dd8b6721a427dae2ca577d5f003459563928850757c519be96cb4064e933'
            '39418fe407e79310d9ebf6edba7a77a1663c9e09f3e5a968cfb544d58ea2b70f'
            '3624b28203c972ea54b490342be74fbd99d4b4748123f9e2837a54ca01c8b392'
            'bd724ee01b93651b4ec6ba62ba64d23e153ea7100be760ccaee4a1e6e32787a6'
            'c50e068a3bc153afa8e9579a1d72980fb3cb5e141c75259f3c48cda4c2b525b6'
            '6ac34778af03145ee7a6d4cdb7287dde7073e6a9d1a609268aa75aa35510c75c'
            '108a67f21c2bdf2dbc4838f3ba32c992325a29cb62a14b377f8a04a9ad5b2b82'
            'b061baa2c76d91591b9e6188b4f23bee91eff1ceb3f91a6e563c0b768d5b2c9b'
            '6f8e99ef1bba53b8cf05064b9e222e0ced3af19185f7923e9cc5613f815cd318'
            '51dd0263d5c0fb104ccbf2965a6accebc1b515923d0b47388eaacbf8c3cf70fb'
            '0f18fde832017387600b5ee2ec6a0ae82125c82b97c0f717772f3cd5dfdcd57b'
            '0bd922cd33bb13af478ef8be10e04f4551c6196dab9eeb0058c633d08ef6cf6f'
            '5b18e569016e7f3cc9b48c06ec251a95c518b3f6d9a1e842ea1866226fa98c9e'
            '1f5d457e7795dc123884dd701d9b22c7e1b0646b081a4e7664e91c466f3b05a1'
            '6d64f43d306f98330c5626a9e2dcd04b748076dd9965ae185542593c311b8881'
            'd8494c3d33229d7eb65f5903cec2d4ef0cbb1cc3146e32a6f614051952fa5d24'
            'a8821305a2fafe18e7ed863855d571d45b5b80547a1c9726608f55fadc8ef691'
            'f7797b46b978d6a82413b6b11fb54908c65b861c4e9b62f9ded7eb1591faf58c'
            '913fc3a85ae676025bafe63880c6413ffafe42495a04a52527ee914ee9ba3ae5'
            '585437e69d2d52f4ff585344bff8551693f05f31552179a94f3a5fe7107eac6f'
            '67f2b07e3ca95c3fc589fd322b560803848253e7499260ad046e651159c62d23'
            '1da28304d237ba934e76394107e46fed0e4120fd2b257f1c667c2d11b52d959b'
            'a9a8839d08232091a0cd381f51380a0a6ebe841f5a8e50a6047aae7b8e34c681'
            '02696a90c7831e3fa903df105573c5f10f4934602fb0e90c846fb44213c40b27'
            '61fea61df2b6f8755ba04d6f068a7750e89eb08a638f983626720fe147151a60'
            '32097b55cb58053f083a3826ad97df25d6a88debd3ec7fa2f9ee0d48eaf355d9'
            'def9908c4601820424ff007bdafbdea4a79469235ba587b0ba90891b2d5fd8ce'
            '0c9106a2bef658f02b2312d081faad6ba8a72bbb5b4ee1cae7d0a95e4ef53f8f'
            '04a61e218b3a10ec3cf58e3fe12fb2ea23610f03889d19b31b8ccb3b078efd6e'
            '910bc5d9e7523ccd09506bafe3fac586db5106d8cc72d77e8457fdf8b43c225e'
            '648058c0cd969b5064e13e9be92530130a05f320050b75da77820bb88f193efb'
            '548c8cd89cf822c790e4703eff53756791450eba73d267a84f3bf3eedf60bef5'
            'af3915311c23e78995af5fb491e9e30ad8f0777239136ba26aa6f9b00331480c'
            'f712b6ca6cb83f1de3ff286613de213b901d1bdeba2c8fcc7d97007a45fd0152'
            'e67cdb017c07a7ec72a06f1062dc2f124d97527869604575fe48610ff98b581a'
            '716cc81139f11a2b438802d37f245f885fc9a0c69ef429a11b156145c903a932'
            'ac094f212ff0191d8526c3bd805d7d3430d12a575023901b991d0f206953628b'
            '2a4e7b307dd0c1b88608e60e13a6ae0baf0995765f896f5b622cdc3d067e42d2'
            'a781734700b1e45cf124a566b068de5b0d513c0afb77168202b0a0e8456097d0'
            '06d1a1c05e52c54a66c7ea4034130dc28fd1af8dd0882e5803e35b4bb67c0399'
            '64633f7373b79cb3e3a7c221f1a8a6033ea6d14fc3234fdb52facc4c1ab2fb24'
            'b48490fbcdad8becc160f2dab2ee4a0f67327f1e9d9ddbd96e44150175c68ca9'
            '0b95ed21612b4f02e65643f2029d8ce5710f49dbe8b229350bbe643167a4b83b'
            '9bd1e05f5128b4715c2d354a6895839d01aae4fc9f56b9d0411afc87fb46daf4'
            '3ae63a893b5b585823f04b5a2e604d3df4c7c6e311f5da5b5d5af92a1fd00465'
            'd1bea5be4ca41f2e9f29354bc3bdf12d9bba47778eb6fa6b01db053a831f3b42'
            '8ee31fbba99f3f472fc919f30d11f620b0719571fa08e5046514c2a8813c6035'
            'f7f5d15365443cbd8137445c3aedf8ccd31c3402f72c0fa7c16e7bf1c7977139'
            'b4b2001119694d538dd97c110809503d8ac514caba65f98d11be7ae00c307299'
            'f8627f5f3a7c119807afc9dc66ce7cb350f905fd1db7fb6b0077552974a07515'
            'ac3f025aa27fec77b24b443df3a69750dc9bb070a40af5180d031b81e66e328c'
            '34158c2a53e1aecd50ed31b8473e45f4f785532b538774a294aacd29c10e928b'
            '8bd1361cf5c6e4e3336cad5b37c79dcc986a46b99e4ad7d679da146dd1fdb7fe'
            '868159a9a965cebd40f98f5995d6ac6361869904712c1b62c6b8a67d10dd93b4'
            'bde40f830d8edac53f2682acd50bf7db2632cb31c6ddaa1923a8703a58899e11'
            '37bd9bc812c1bfc471be2eb003f714e475f8425913c42703b21237f2b1c99e57'
            'c23fa31250811a76be900554b9ac127f861ebde09c07ac67cd6b82dd214e5686')

# Possible replacements are listed in build/linux/unbundle/replace_gn_files.py
# Keys are the names in the above script; values are the dependencies in Arch
# plus any so names that are provided + linked
declare -gA _system_libs=(
  [brotli]=brotli
  # [dav1d]="dav1d libdav1d.so"
  # [ffmpeg]="ffmpeg libavcodec.so libavcodec.so libavformat.so libavutil.so" # YouTube playback stopped working in Chromium 120
  [flac]="flac libFLAC.so"
  [fontconfig]="fontconfig libfontconfig.so"
  [freetype]="freetype2 libfreetype.so"
  [harfbuzz-ng]="harfbuzz libharfbuzz.so libharfbuzz-subset.so"
  [icu]="icu libicui18n.so libicuuc.so"
  # [jsoncpp]="jsoncpp libjsoncpp.so"  # needs libstdc++
  # [libaom]=aom
  # [libavif]=libavif # libavif.so libavutil.so # needs -DAVIF_ENABLE_EXPERIMENTAL_GAIN_MAP=ON
  [libdrm]=libdrm # libdrm.so
  [libjpeg]="libjpeg-turbo libjpeg.so"
  [libpng]="libpng libpng16.so"
  # [libvpx]=libvpx
  # [libwebp]="libwebp libwebpdemux.so libwebpmux.so libwebp.so" # //third_party/libavif:libavif_enc needs //third_party/libwebp:libwebp_sharpyuv
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
  #export VPYTHON_BYPASS='manually managed python not supported by chrome operations'

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
  # needs newer clang to read the bundled PGO profile
  # src/tools/update_pgo_profiles.py --target=linux update \
  #   --gs-url-base=chromium-optimization-profiles/pgo_profiles

  # https://gitlab.archlinux.org/archlinux/packaging/packages/electron32/-/issues/1
  src/third_party/node/update_npm_deps

  src/electron/script/apply_all_patches.py \
      src/electron/patches/config.json

  # https://github.com/nodejs/node/issues/48444
  export UV_USE_IO_URING=0

  pushd src
  pushd electron
  yarn install --frozen-lockfile
  popd

  echo "Applying local patches..."

  # https://crbug.com/893950
  sed -i -e 's/\<xmlMalloc\>/malloc/' -e 's/\<xmlFree\>/free/' \
         -e '1i #include <cstdlib>' \
    third_party/blink/renderer/core/xml/*.cc \
    third_party/blink/renderer/core/xml/parser/xml_document_parser.cc \
    third_party/libxml/chromium/*.cc

  patch -Np0 -i ../blink-fix-missing-stdlib-include.patch

  ## Upstream fixes
  patch -Np1 -i ../allow-ANGLEImplementation-kVulkan.patch

  # Allow libclang_rt.builtins from compiler-rt >= 16 to be used
  patch -Np1 -i ../compiler-rt-adjust-paths.patch

  # Increase _FORTIFY_SOURCE level to match Arch's default flags
  patch -Np1 -i ../increase-fortify-level.patch

  # Fixes for building with libstdc++ instead of libc++

  # Link to system tools required by the build
  mkdir -p third_party/node/linux/node-linux-x64/bin
  ln -sfn /usr/bin/node third_party/node/linux/node-linux-x64/bin/
  mkdir -p third_party/jdk/current/bin
  ln -sfn /usr/bin/java third_party/jdk/current/bin/
  ln -sfn /usr/bin/clang-format buildtools/linux64

  # test deps are broken for ui/lens with system ICU
  # "//third_party/icu:icuuc_public" (taken from Gentoo ebuild)
  sed -i '/source_set("unit_tests") {/,/}/d' chrome/browser/ui/lens/BUILD.gn
  sed -i '/lens:unit_tests/d' chrome/test/BUILD.gn components/BUILD.gn

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
    'is_official_build=true' # implies is_cfi=true on x86_64
    'symbol_level=0' # sufficient for backtraces on x86(_64)
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
  )

  if [[ -n ${_system_libs[icu]+set} ]]; then
    _flags+=('icu_use_data_file=false')
  fi

  local _clang_version=$(
    clang --version | grep -m1 version | sed 's/.* \([0-9]\+\).*/\1/')

  _flags+=(
    'clang_base_path="/usr"'
    'clang_use_chrome_plugins=false'
    "clang_version=\"$_clang_version\""
    'chrome_pgo_phase=0' # needs newer clang to read the bundled PGO profile
  )

  # Allow the use of nightly features with stable Rust compiler
  # https://github.com/ungoogled-software/ungoogled-chromium/pull/2696#issuecomment-1918173198
  export RUSTC_BOOTSTRAP=1

  _flags+=(
    'rust_sysroot_absolute="/usr"'
    'rust_bindgen_root="/usr"'
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
