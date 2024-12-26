# Maintainer: Gregory Anders <greg at gpanders dot com>
# Contributor: kaij <contact at kaij dot tech>
_pkgbasename=ghostty
pkgname=${_pkgbasename}-git
pkgrel=1
pkgver=r8469.4b4d4062
pkgdesc="Fast, native, feature-rich terminal emulator pushing modern features"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/ghostty-org/${_pkgbasename}"
provides=('ghostty')
conflicts=('ghostty')
license=('MIT')
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
makedepends=('git' 'zig>=0.13.0' 'zig<0.14.0' 'pandoc-cli')
source=("git+https://github.com/ghostty-org/${_pkgbasename}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgbasename}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
        cd "${srcdir}/${_pkgbasename}"

	ZIG_GLOBAL_CACHE_DIR="${srcdir}/tmp" ./nix/build-support/fetch-zig-cache.sh
	zig build --system "${srcdir}/tmp/p" -Doptimize=ReleaseFast -Demit-docs
}

package() {
	cd "${srcdir}/${_pkgbasename}"

	zig build -p "${pkgdir}"/usr --system "${srcdir}/tmp/p" -Doptimize=ReleaseFast -Demit-docs
	# install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/$_pkgbasename/LICENSE"
}
