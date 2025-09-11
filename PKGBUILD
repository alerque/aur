# Maintainer: Your Name <you@example.com>
pkgname=dms-shell-git
pkgver=0.0.7.3.g2395274
pkgrel=1
pkgdesc='A Quickshell-based desktop shell with Material 3 design principles'
arch=('x86_64' 'aarch64')
url='https://github.com/AvengeMedia/DankMaterialShell'
license=('GPL-3.0-only')
depends=(
    'quickshell'
    'dgop'
    'ttf-material-symbols-variable-git'
    'inter-font'
    'ttf-fira-code'
)
optdepends=(
    'networkmanager: Required for network management'
    'matugen-bin: Dynamic wallpaper-based theming'
    'brightnessctl: Laptop display brightness control'
    'wl-clipboard: Copy functionality for PIDs and other elements'
    'cliphist: Clipboard history functionality'
    'cava: Audio visualizer'
    'qt5ct: Qt5 application theming'
    'qt6ct: Qt6 application theming'
)
makedepends=('git' 'go')
provides=('dms-shell' 'dms')
conflicts=('dms-shell' 'dms')
source=(
    "$pkgname::git+$url.git"
    "danklinux::git+https://github.com/AvengeMedia/danklinux.git"
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  if git describe --tags --long >/dev/null 2>&1; then
    git describe --tags --long | sed 's/^v//; s/-/./g'
  else
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

build() {
    # Build the dms binary from danklinux
    cd "${srcdir}/danklinux"
    
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    
    # Build the dms binary
    go build -o dms ./cmd/dms
}

package() {
    # Install the dms binary from danklinux
    install -Dm755 "${srcdir}/danklinux/dms" "$pkgdir/usr/bin/dms"
    
    # Install shell files from DankMaterialShell
    cd "${srcdir}/${pkgname}"
    
    # Install shell files to quickshell config directory
    install -dm755 "$pkgdir/etc/xdg/quickshell/dms"
    cp -r ./* "$pkgdir/etc/xdg/quickshell/dms/"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/dms/README.md"
    if [ -d "./docs" ]; then
        install -dm755 "$pkgdir/usr/share/doc/dms"
        cp -r ./docs/* "$pkgdir/usr/share/doc/dms/"
    fi
    
    # Remove git files from installation
    rm -rf "$pkgdir/etc/xdg/quickshell/dms/.git"*
}
