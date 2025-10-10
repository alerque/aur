# Maintainer: Your Name <you@example.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=dms-shell-git
pkgver=0.0.7.3.g2395274
pkgrel=1
pkgdesc='A Quickshell-based desktop shell with Material 3 design principles'
arch=(x86_64 aarch64)
url='https://github.com/AvengeMedia/DankMaterialShell'
license=(GPL-3.0-only)
depends=(dgop
         inter-font
         quickshell
         ttf-fira-code
         ttf-material-symbols-variable-git)
optdepends=('brightnessctl: Laptop display brightness control'
            'cava: Audio visualizer'
            'cliphist: Clipboard history functionality'
            'matugen-bin: Dynamic wallpaper-based theming'
            'networkmanager: Required for network management'
            'qt5ct: Qt5 application theming'
            'qt6ct: Qt6 application theming'
            'wl-clipboard: Copy functionality for PIDs and other elements')
makedepends=(git go)
provides=(dms-shell dms)
conflicts=(dms-shell dms)
source=("$pkgname::git+$url.git"
        "danklinux::git+https://github.com/AvengeMedia/danklinux.git")
sha256sums=(SKIP SKIP)

pkgver() {
	cd "$pkgname"
	if git describe --tags --long >/dev/null 2>&1; then
		git describe --tags --long | sed 's/^v//; s/-/./g'
	else
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	fi
}

build() {
	cd "danklinux"
	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export CGO_LDFLAGS="$LDFLAGS"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o dms ./cmd/dms
}

package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "danklinux/dms"
	
	cd "$${pkgname}"
	install -dm0755 "$pkgdir/etc/xdg/quickshell/dms"
	cp -r ./* "$pkgdir/etc/xdg/quickshell/dms/"
	install -Dm0644 -t "$pkgdir/usr/share/doc/dms/" README.md
	install -dm755 "$pkgdir/usr/share/doc/dms"
	cp -r ./docs/* "$pkgdir/usr/share/doc/dms/"
	rm -rf "$pkgdir/etc/xdg/quickshell/dms/.git"*
}
