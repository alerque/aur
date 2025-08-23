# Maintainer: Your Name <you@example.com>
pkgname=dms-shell
pkgver=0.0.5
pkgrel=1
pkgdesc='A Quickshell-based desktop shell with Material 3 design principles'
arch=('any')
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
makedepends=('git')
provides=('dms')
conflicts=('dms-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')  # You should generate the actual checksum with makepkg -g

package() {
    cd "${srcdir}/DankMaterialShell-${pkgver}"
    
    # Install shell files to quickshell config directory
    install -dm755 "$pkgdir/etc/xdg/quickshell/dms"
    cp -r ./* "$pkgdir/etc/xdg/quickshell/dms/"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/dms/README.md"
    if [ -d "./docs" ]; then
        cp -r ./docs/* "$pkgdir/usr/share/doc/dms/"
    fi
    
    # Remove any git files that might be in the tarball
    rm -rf "$pkgdir/etc/xdg/quickshell/dms/.git"*
}
