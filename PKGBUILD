# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Marcell Pardavi <marcell.pardavi@gmail.com>

# git submodules with vendored dependencies
declare -gA _tags=(
    [protocol]="8645a138fb2ea72c4dab13e739b1f3c9ea29ac84"
)

# Tests assume access to vulkan video drivers, Wayland window creation,
# detecting system keymaps, etc. Until their is something sensical for
# a package to test in the suite, just skip it by default.
BUILDENV+=(!check)

pkgname=zed-editor-preview
pkgver=0.135.0
pkgrel=1
pkgdesc='A high-performance, multiplayer code editor from the creators of Atom and Tree-sitter'
arch=(x86_64)
url=https://zed.dev
_url="https://github.com/zed-industries/zed"
license=(GPL-3.0-or-later AGPL-3.0-or-later Apache-2.0)
depends=(alsa-lib libasound.so
         fontconfig
         gcc-libs # libgcc_s.so libstdc++.so
         glibc # libc.so libm.so
         # libgit2 libgit2.so
         # libxau libXau.so
         libxcb # libxcb-xkb.so
         # libxdmcp libXdmcp.so
         libxkbcommon # libxkbcommon.so
         libxkbcommon-x11 # libxkbcommon-x11.so
         openssl libcrypto.so libssl.so
         sqlite
         vulkan-driver
         vulkan-icd-loader
         vulkan-tools
         wayland
         zlib libz.so)
makedepends=(cargo
             gendesk
             vulkan-headers
             vulkan-validation-layers)
optdepends=('clang: improved C/C++ language support'
            'eslint: improved Javascript language support'
            'rust-analyzer: improved Rust language support')
provides=("${pkgname%-preview}=$pkgver")
conflicts=("${pkgname%-preview}")
_archive="zed-$pkgver-pre"
source=("$_url/archive/v$pkgver-pre/$_archive.tar.gz"
        "https://github.com/livekit/protocol/archive/${_tags[protocol]}/protocol-${_tags[protocol]}.tar.gz")
sha256sums=('cb81b3cc8cb03bc6e3c87a574861fbb08563e01778b3290ccb28cd20674c7383'
            'cd26bc1015fa0b79154c23a385441ae81e9a4385211cf2989eb939ae83d0e414')

prepare() {
	cd "$_archive"
	rm -r crates/live_kit_server/protocol
	ln -sT "$srcdir/protocol-${_tags[protocol]}" crates/live_kit_server/protocol
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
	gendesk -q -f -n \
		--name 'Zed' \
		--exec 'Zed' \
		--pkgname "${pkgname%-preview}" \
		--pkgdesc "$pkgdesc" \
		--categories 'Development'
}

_srcenv() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export CFLAGS+=' -ffat-lto-objects'
	export CXXFLAGS+=' -ffat-lto-objects'
}

build() {
	_srcenv
	cargo build --release --frozen --all-features
}

check() {
	_srcenv
	cargo test --frozen --all-features
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/Zed"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "${pkgname%-preview}.desktop"
	install -Dm0644 crates/zed/resources/app-icon.png "$pkgdir/usr/share/icons/${pkgname%-preview}.png"
}
