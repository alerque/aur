# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: justbispo <aur.fyxy0@slmail.me>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=codeberg-cli
pkgver=0.5.4
pkgrel=2
pkgdesc='CLI Tool for Codeberg similar to gh and glab'
arch=(x86_64)
url="https://codeberg.org/Aviac/$pkgname"
license=(AGPL-3.0-only)
depends=(gcc-libs # libgcc_s.so
         glibc # libc.so libm.so ld-linux-x86-64
         openssl libcrypto.so libssl.so
         zlib libz.so)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
# source=("$_archive.tar.gz::https://static.crates.io/crates/$pkgname/$_archive.crate")
source=("$_archive.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f32857642fb8c9c810f3b7f6ec59934b3ce11bca39912f349dba96a7fb1e9ccc')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target host-tuple
}

build() {
	cd "$_archive"
	export OPENSSL_NO_VENDOR=true
	CFLAGS+=' -ffat-lto-objects'
	cargo build --frozen --release --all-features
}

check() {
	cd "$_archive"
	cargo test --frozen --release --all-features
}

package() {
	cd "$_archive"
	local _bin=berg
	local bin="target/release/$_bin"
	install -Dm0755 -t "$pkgdir/usr/bin/" "$bin"
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	$bin completion bash | install -Dm0644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$_bin"
	$bin completion fish | install -Dm0644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$_bin.fish"
	$bin completion zsh  | install -Dm0644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$_bin"
}
