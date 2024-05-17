# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Marcell Pardavi <marcell.pardavi@gmail.com>

# Tests assume access to vulkan video drivers, Wayland window creation,
# detecting system keymaps, etc. Until their is something sensical for
# a package to test in the suite, just skip it by default.
BUILDENV+=(!check)

pkgname=zed-editor-git
pkgver=0.136.2.r48.g70888cf
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
             git
             vulkan-headers
             vulkan-validation-layers)
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$_url.git")
sha256sums=('SKIP')

prepare() {
	cd "$pkgname"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
	gendesk -q -f -n \
		--name 'Zed' \
		--exec 'Zed' \
		--pkgname "${pkgname%-git}" \
		--pkgdesc "$pkgdesc" \
		--categories 'Office'
}

pkgver() {
	cd "$pkgname"
	local lasttag="$(git tag --sort=-v:refname | grep -E '^v[0-9]+\.[0-9]+\.[0-9]+-pre$' | head -1)"
	echo -n "$(sed 's/^v//;s/-pre$//' <<< "$lasttag")"
	echo -n ".r$(git rev-list "$(git merge-base HEAD "$lasttag")..HEAD" --count)"
	echo -n ".g$(git log --pretty=format:'%h' --abbrev=7 -n1 HEAD)"
}

_srcenv() {
	cd "$pkgname"
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
	cd "$pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/Zed"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "${pkgname%-git}.desktop"
	install -Dm0644 crates/zed/resources/app-icon.png "$pkgdir/usr/share/icons/${pkgname%-git}.png"
}
