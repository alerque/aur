# Maintainer: Gregory Anders <greg at gpanders dot com>
# Contributor: kaij <contact at kaij dot tech>
_pkgbasename=ghostty
pkgname=${_pkgbasename}-git
pkgrel=1
pkgver=r6453.9085f86c
pkgdesc="Fast, native, feature-rich terminal emulator pushing modern features"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/ghostty-org/${_pkgbasename}"
provides=('ghostty')
conflicts=('ghostty')
license=()
depends=(
	'bzip2'
	'fontconfig'
	'freetype2'
	'gtk4'
	'harfbuzz'
	'libadwaita'
	'libpng'
	'oniguruma'
	'pixman'
	'zlib'
)
makedepends=('git' 'zig>=0.13.0' 'zig<0.14.0')
source=("git+ssh://git@github.com/ghostty-org/${_pkgbasename}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgbasename}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
        cd "${srcdir}/${_pkgbasename}"

        zig build -Doptimize=ReleaseFast -Dstatic=false
}

package() {
	cd "${srcdir}/${_pkgbasename}"

	zig build -Doptimize=ReleaseFast -Dstatic=false -p "$pkgdir/usr"
	# install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/$_pkgbasename/LICENSE"
}
