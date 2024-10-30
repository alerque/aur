# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=gitbutler
pkgver=0.13.8
pkgrel=1
url="https://github.com/${pkgname}app/$pkgname"
pkgdesc='Version control client, backed by Git, powered by Tauri/Rust/Svelte'
arch=(x86_64)
license=(LicenseRef-FSL-1.1-MIT)
depends=(gtk3
         webkit2gtk)
makedepends=(cargo-nightly
             cargo-tauri
             cmake
             nodejs
             pnpm)
options=(!lto)
_archive="$pkgname-release-$pkgver"
source=("$url/archive/release%2F$pkgver/$_archive.tar.gz")
sha256sums=('2703d4250f720689cbe25d694c907a12ad931338b0d05a9f78dd67b8fe9737b8')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
	pnpm install --frozen-lockfile
}

build() {
	cd "$_archive"
	env \
		RUSTUP_TOOLCHAIN=nightly \
		CARGO_TARGET_DIR=target \
	cargo build --release
	# cargo tauri build --bundles deb
}

package() {
	cd "$_archive"
	local target="target/release/$pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "$target"-{tauri,git-askpass,git-setsid}
}
