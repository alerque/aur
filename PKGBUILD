# Maintainer: Orhun Parmaksız <orhun@archlinux.org>

pkgname=tdf
pkgver=0.1.0
pkgrel=1
pkgdesc="A TUI-based PDF viewer"
arch=('x86_64')
url="https://github.com/itsjunetime/tdf"
license=('MPL-2.0')
depends=('gcc-libs' 'glib2' 'cairo' 'poppler' 'poppler-glib')
makedepends=('cargo-nightly')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('650827334786782ae1929055fb12a0da82ea72929f132bd427299a5ecc431d86')

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
