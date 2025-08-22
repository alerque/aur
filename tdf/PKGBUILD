# Maintainer: Orhun Parmaksız <orhun@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=tdf
pkgver=0.3.0
pkgrel=2
pkgdesc="A TUI-based PDF viewer"
arch=('x86_64')
url="https://github.com/itsjunetime/tdf"
license=('MPL-2.0')
depends=('gcc-libs' 'glib2' 'mupdf' 'fontconfig')
makedepends=('cargo-nightly' 'clang' 'python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('97dda80e0725a5b93c54704cf2e00798a0c8c85eb67bf9779a83e162c48545cb')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  CFLAGS+=' -ffat-lto-objects'
  export RUSTUP_TOOLCHAIN=nightly
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=nightly
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  depends+=(libfontconfig.so)
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim: ts=2 sw=2 et:
