# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Bennett Petzold <dansecob.aur gmail com>

pkgname=qsv
pkgver=0.138.0
pkgrel=1
pkgdesc='CSV data-wrangling toolkit (fork of xsv)'
arch=(x86_64)
url="https://github.com/jqnatividad/$pkgname"
license=(MIT Unlicense)
depends=(bzip2 libbz2.so
         gcc-libs # libgcc_s.so libstdc++.so
         glibc # libc.so libm.so
         python # libpython3.12.so
         python-xlsxwriter
         wayland libwayland-client.so)
makedepends=(cargo
             clang
             luau)
_archive="$pkgname-$pkgver"
options=(!lto)
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('c53299dc56dbf7776a86d3802e928a8dc44a922b1bdaa1f1903d0ab8bb457201')

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
	env \
		CARGO_PROFILE_RELEASE_LTO=true \
		CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1 \
		CARGO_PROFILE_RELEASE_DEBUG=2 \
	cargo build --frozen --release --features distrib_features
}

check() {
	_srcenv
	# cargo test --frozen --features distrib_features
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm644 -t "$pkgdir/usr/share/elvish/lib/" contrib/completions/examples/qsv.elv
	install -Dm644 -t "$pkgdir/usr/share/fish/vendor_completions.d/" contrib/completions/examples/qsv.fish
	install -Dm644 contrib/completions/examples/qsv.bash "$pkgdir/usr/share/bash-completion/completions/qsv"
	install -Dm644 contrib/completions/examples/qsv.zsh "$pkgdir/usr/share/zsh/site-functions/_qsv"
}
