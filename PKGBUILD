# Maintainer: Caleb Maclennan <caleb@alerque.com>

_fname=departure-mono
_pname=DepartureMono
pkgbase=$_fname-font
pkgname=(otf-$_fname)
pkgver=1.346
pkgrel=1
pkgdesc='a monospaced pixel font with a lo-fi technical vibe'
arch=(any)
url='https://departuremono.com'
license=(OFL)
provides=("$pkgbase")
_archive="$_pname-$pkgver"
source=("$url/assets/$_archive.zip")
sha256sums=('1e48dac12bf9b0e3edf4031f839667f4020a0d78da3c07bc402814ae81f9bb5c')

package_otf-departure-mono() {
	# cd "$_archive"
	install -Dm0644 -t "$pkgdir/usr/share/fonts/OTF" $_pname-*.otf
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
