# Maintainer: Wilken Gottwalt <wilken dot gottwalt at posteo dot net>

pkgname=ollama-git
pkgver=0.5.3.git+2cde4b88
pkgrel=1
pkgdesc='Create, run and share large language models (LLMs) with ROCm'
arch=(aarch64 x86_64)
url='https://github.com/ollama/ollama'
license=(MIT)
provides=(ollama)
conflicts=(ollama)
depends=(gcc-libs)
makedepends=(git gcc-libs "go>=1.23")
source=(git+$url#branch=main
        ollama.service
        sysusers.conf
        tmpfiles.d)
b2sums=('SKIP'
        '564c355048079c72b0f052bf669dd8c5eb43921efa25fba5b425e29306815886eded52b7032bec67c6b0c2308d31a8ba13cd084b4a4bac5b329f471294a348d7'
        '3aabf135c4f18e1ad745ae8800db782b25b15305dfeaaa031b4501408ab7e7d01f66e8ebb5be59fc813cfbff6788d08d2e48dcf24ecc480a40ec9db8dbce9fec'
        'e8f2b19e2474f30a4f984b45787950012668bf0acb5ad1ebb25cd9776925ab4a6aa927f8131ed53e35b1c71b32c504c700fe5b5145ecd25c7a8284373bb951ed')

pkgver() {
  cd ollama
  local _tag="$(git describe --tags --abbrev=0)"
  local _hash="$(git rev-parse --short HEAD)"
  _tag="${_tag%-*}"
  echo "${_tag##v}.git+${_hash}"
}

build() {
  export CFLAGS+=" -fcf-protection=none" CXXFLAGS+=" -fcf-protection=none"
  export CGO_CFLAGS="$CFLAGS" CGO_CPPFLAGS="$CPPFLAGS" CGO_CXXFLAGS="$CXXFLAGS" CGO_LDFLAGS="$LDFLAGS"
  export OLLAMA_SKIP_CUDA_GENERATE=on
  export OLLAMA_SKIP_ROCM_GENERATE=on

  cd ollama

  make dist
  go build .
}

package() {
  install -dm755 ${pkgdir}/var/lib/ollama
  install -dm755 ${pkgdir}/usr/lib/ollama/runners

  install -Dm755 ollama/ollama ${pkgdir}/usr/bin/ollama
  install -Dm644 ollama/LICENSE ${pkgdir}/usr/share/licenses/ollama/LICENSE
  cp -r ollama/dist/linux-amd64/lib/ollama/runners/cpu* ${pkgdir}/usr/lib/ollama/runners

  install -Dm644 ollama.service ${pkgdir}/usr/lib/systemd/system/ollama.service
  install -Dm644 sysusers.conf ${pkgdir}/usr/lib/sysusers.d/ollama.conf
  install -Dm644 tmpfiles.d ${pkgdir}/usr/lib/tmpfiles.d/ollama.conf

  ln -s /var/lib/ollama ${pkgdir}/usr/share/ollama
}
