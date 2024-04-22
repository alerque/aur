# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Bennett Petzold <dansecob.aur gmail com>

BUILDENV+=(!check)

pkgname=qsv
pkgver=0.126.0
pkgrel=1
pkgdesc='CSV data-wrangling toolkit (fork of xsv)'
arch=(x86_64)
url="https://github.com/jqnatividad/$pkgname"
license=(MIT Unlicense)
depends=(python
         python-xlsxwriter)
makedepends=(cargo
             clang
             luau)
_archive="$pkgname-$pkgver"
options=(!lto)
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('ee38f1ca972c6bf50ad3e973a0b0fd11b784d9abf8a6eaf97cc5c1a582c9fac1')

# all_features minus self_update
_features='feature_capable,apply,fetch,foreach,geocode,luau,polars,python,to,to_parquet'

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
	sed -i -e '/^lto/s/true/false/' Cargo.toml
}

_srcenv() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
}

build() {
	_srcenv
	cargo build --frozen --release --features "$_features"
}

check() {
	_srcenv
	cargo test --frozen --features "$_features"
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
