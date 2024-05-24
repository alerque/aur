# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=speedata-publisher
pkgname=$_pkgname-bin
pkgver=4.19.5
pkgrel=1
pkgdesc='a database publishing software that creates high-quality layouted PDFs fully automatically'
arch=(x86_64)
url='https://www.speedata.de/en/product'
license=(AGPL-3.0-only)
depends=(glibc)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=(!debug)
source=("https://download.speedata.de/dl/$_pkgname-linux-amd64-$pkgver.zip")
sha256sums=('95f570adb706ab9016cfafae45d624d381f8501ed44add88f0df1948b3262d6e')

prepare() {
	cd "$_pkgname"
	rm installation.txt
}

package() {
	ls -al
	local target="$pkgdir/opt"
	mkdir -p "$target" "$pkgdir/usr/bin"
	cp -a "$_pkgname" "$target/"
	ln -sf "/opt/$_pkgname/bin/sp" "$pkgdir/usr/bin/"
}
