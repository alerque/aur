# Maintainer: Orhun Parmaksız <orhun@archlinux.org>

pkgname=tdf
pkgver=0.3.0
pkgrel=1
pkgdesc="A TUI-based PDF viewer"
arch=('x86_64')
url="https://github.com/itsjunetime/tdf"
license=('MPL-2.0')
depends=('gcc-libs' 'glib2' 'cairo' 'poppler' 'poppler-glib')
makedepends=('cargo-nightly' 'clang')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('97dda80e0725a5b93c54704cf2e00798a0c8c85eb67bf9779a83e162c48545cb')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=nightly
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=nightly
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=nightly
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim: ts=2 sw=2 et:
