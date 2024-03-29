# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ocrs
pkgver=0.4.0
pkgrel=1
pkgdesc='a modern OCR engine written in Rust'
arch=(x86_64)
url="https://github.com/robertknight/$pkgname"
license=(MIT Apache)
depends=(gcc-libs
         glibc)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz"
        "$url/commit/9f7fdba.patch")
sha256sums=('7e7bed2fbd7c1812642db74922913de7d5f0aa3e57a8712da4ed37c730a17a6c'
            'db484038c1cbc6a5173f7006eb0722796d87e846ef03fd30280c3514f0c916ba')

prepare() {
	cd "$_archive"
	patch -p1 -i ../9f7fdba.patch
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

_srcenv() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
}

build() {
	_srcenv
	CFLAGS+=" -ffat-lto-objects"
	cargo build --frozen --release --all-features
}

check() {
	_srcenv
	cargo test --frozen --all-features
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
