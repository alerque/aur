# Maintainer: Caleb Maclennan <caleb@alerque.com>

_fname=departure-mono
_pname=DepartureMono
pkgbase=$_fname-font
pkgname=(otf-$_fname)
pkgver=1.422
pkgrel=1
pkgdesc='a monospaced pixel font with a lo-fi technical vibe'
arch=(any)
url='https://departuremono.com'
license=(OFL)
provides=("$pkgbase")
_archive="$_pname-$pkgver"
source=("$url/assets/$_archive.zip")
sha256sums=('fae4949a63893d265c79b7dd9903e63c5a3db52d07d4f29aa604390663067bdb')

package_otf-departure-mono() {
	# cd "$_archive"
	install -Dm0644 -t "$pkgdir/usr/share/fonts/OTF" $_pname-*.otf
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
