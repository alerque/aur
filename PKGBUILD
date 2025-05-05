# Maintainer: Wilken Gottwalt <wilken dot gottwalt at posteo dot net>

pkgname=ollama-git
pkgver=0.6.8.git+7e5c8eee5
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
        'f725cbab107b32c09af59b85e29f1059a1496645165dd603f82dae70fb8d8a121bbf0c75ab0a22fdd1638a834de7e5278e18124d8973720857a39f0bd4e5e921'
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

  sed -i 's/check_language(CUDA)//g' CMakeLists.txt
  sed -i 's/check_language(HIP)//g' CMakeLists.txt
}

build() {
  export CMAKE_CUDA_COMPILER=/tmp
  export CMAKE_HIP_COMPILER=/tmp

  cd ollama

  cmake -B build
  cmake --build build --config Release
  go build .
}

package() {
  install -dm755 ${pkgdir}/var/lib/ollama
  install -dm755 ${pkgdir}/usr/{bin,lib/ollama}
  install -Dm644 ollama/LICENSE ${pkgdir}/usr/share/licenses/ollama/LICENSE
  install -Dm755 ollama/ollama ${pkgdir}/usr/bin/ollama
  install -Dm755 ollama/build/lib/ollama/* ${pkgdir}/usr/lib/ollama
  install -Dm644 ollama.service ${pkgdir}/usr/lib/systemd/system/ollama.service
  install -Dm644 sysusers.conf ${pkgdir}/usr/lib/sysusers.d/ollama.conf
  install -Dm644 tmpfiles.d ${pkgdir}/usr/lib/tmpfiles.d/ollama.conf

  ln -s /var/lib/ollama ${pkgdir}/usr/share/ollama
}
