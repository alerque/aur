# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Bennett Petzold <dansecob.aur gmail com>

BUILDENV+=(!check)

pkgname=qsv
pkgver=0.125.0
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
sha256sums=('fa6af5c222ba8e0586f0b5a1109341fb41557ce669b3da8c3c30cdc3bf7ea17a')

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
