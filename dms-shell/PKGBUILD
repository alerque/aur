# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=dms-shell
_pkg1=DankMaterialShell
_pkg2=danklinux
pkgname=($pkgbase $pkgbase-hyprland $pkgbase-niri)
pkgver=0.1.7
pkgrel=3
pkgdesc='A Quickshell-based desktop shell with Material 3 design principles'
arch=(x86_64 aarch64)
url="https://github.com/AvengeMedia/$_pkg1"
license=(GPL-3.0-only)
depends=(dgop
         inter-font
         quickshell
         ttf-fira-code
         ttf-material-symbols-variable-git)
optdepends=('networkmanager: Required for network management'
            'matugen: Dynamic wallpaper-based theming'
            'brightnessctl: Laptop display brightness control'
            'wl-clipboard: Copy functionality for PIDs and other elements'
            'cliphist: Clipboard history functionality'
            'cava: Audio visualizer'
            'qt5ct: Qt5 application theming'
            'qt6ct: Qt6 application theming')
makedepends=(go)
_archive1="$_pkg1-$pkgver"
_archive2="$_pkg2-$pkgver"
source=("$url/archive/v$pkgver/$_archive1.tar.gz"
        "${url/$_pkg1/$_pkg2}/archive/v$pkgver/$_archive2.tar.gz")
sha256sums=('1dfe0296350bb91093ea82002537001af7f748fba8f70a9ceb359ebd7c7bdb30'
            'e3b5490c34c1d9324c2c23fdb6a8f0ad1d610baff4e7bb4c40954c06ee532229')

build() {
	cd "$_archive2"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o dms ./cmd/dms
}

package_dms-shell() {
	depends+=(dms-shell-compositor)
	optdepneds+=('dms-shell-hyprland: Hyprland specific dependencies')
	optdepneds+=('dms-shell-niri: Niri specific dependencies')
	install -Dm0755 -t "$pkgdir/usr/bin/" "$_archive2/dms"
	install -dm0755 "$pkgdir/etc/xdg/quickshell/dms"
	cp -r "$_archive1/"* "$pkgdir/etc/xdg/quickshell/dms/"
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" "$_archive1/README.md"
	cp -r "$_archive1/docs/"* "$pkgdir/usr/share/doc/$pkgname/"
}

package_dms-shell-hyprland() {
	pkgdesc+=" (for Hyprland)"
	provides=(dms-shell-compositor)
	depends=(dms-shell
	         hyprland)
	optdepends=()
}

package_dms-shell-niri() {
	pkgdesc+=" (for Niri)"
	provides=(dms-shell-compositor)
	depends=(niri)
	depends=(dms-shell
	         niri)
	optdepends=()
}
