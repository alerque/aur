# Maintainer: Wilken Gottwalt <wilken dot gottwalt at posteo dot net>

pkgname=ollama-git
pkgver=0.5.7.git+42cf4db6
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
        fix-missing-includes.patch
        ollama.service
        sysusers.conf
        tmpfiles.d)
b2sums=('SKIP'
        'c24d9064c84cd21ac57f9edab53575768c339eb805a8287b5489d7855b0229f9bab3a7791140fa4aa0399035b9fc0d38e9c7d6391ced194ce4df73c70f9ec44d'
        '45ae4a8607a3e3d3f6b72c13485eed2a5d6e8f72664cd209e4e0c0befe825c7c56f27d45a1f799e3c6c18a7acbe7120ac55bf10cf48827b107721b4fbc0b99e2'
        '3aabf135c4f18e1ad745ae8800db782b25b15305dfeaaa031b4501408ab7e7d01f66e8ebb5be59fc813cfbff6788d08d2e48dcf24ecc480a40ec9db8dbce9fec'
        'e8f2b19e2474f30a4f984b45787950012668bf0acb5ad1ebb25cd9776925ab4a6aa927f8131ed53e35b1c71b32c504c700fe5b5145ecd25c7a8284373bb951ed')

pkgver() {
  cd ollama
  local _tag="$(git describe --tags --abbrev=0)"
  local _hash="$(git rev-parse --short HEAD)"
  _tag="${_tag%-*}"
  echo "${_tag##v}.git+${_hash}"
}

prepare() {
  cd ollama

  patch -Np1 -i ${srcdir}/fix-missing-includes.patch
}

build() {
  export CFLAGS="$CFLAGS -fcf-protection=none" CXXFLAGS="$CXXFLAGS -fcf-protection=none"
  export CGO_CFLAGS="$CFLAGS" CGO_CPPFLAGS="$CPPFLAGS" CGO_CXXFLAGS="$CXXFLAGS" CGO_LDFLAGS="$LDFLAGS"
  if [ "$CARCH" = "aarch64" ]; then
    export GOARM64=v8.2
  fi
  export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw '-gcflags=-l' '-ldflags=-w -s'"
  export OLLAMA_SKIP_CUDA_GENERATE=on
  export OLLAMA_SKIP_ROCM_GENERATE=on

  cd ollama

  make dist
  go build .
}

package() {
  install -dm755 ${pkgdir}/var/lib/ollama
  install -dm755 ${pkgdir}/usr/bin
  if [ "$CARCH" = "x86_64" ]; then
    install -dm755 ${pkgdir}/usr/lib/ollama/runners
  fi

  install -Dm644 ollama/LICENSE ${pkgdir}/usr/share/licenses/ollama/LICENSE
  if [ "$CARCH" = "x86_64" ]; then
    install -Dm755 ollama/ollama ${pkgdir}/usr/bin/ollama
  else
    install -Dm755 ollama/dist/linux-arm64/bin/ollama ${pkgdir}/usr/bin/ollama
  fi
  if [ "$CARCH" = "x86_64" ]; then
    cp -r ollama/dist/linux-amd64/lib/ollama/runners/cpu* ${pkgdir}/usr/lib/ollama/runners
  fi
  install -Dm644 ollama.service ${pkgdir}/usr/lib/systemd/system/ollama.service
  install -Dm644 sysusers.conf ${pkgdir}/usr/lib/sysusers.d/ollama.conf
  install -Dm644 tmpfiles.d ${pkgdir}/usr/lib/tmpfiles.d/ollama.conf

  ln -s /var/lib/ollama ${pkgdir}/usr/share/ollama
}
