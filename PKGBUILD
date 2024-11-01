# Maintainer: Caleb Maclennan <caleb@alerque.com>

_fname=Shantell-Sans
pkgbase=${_fname,,}-font
pkgname=(otf-${_fname,,} ttf-${_fname,,}-variable)
pkgver=1.011
pkgrel=1
pkgdesc='a marker-style font built for creative expression, typographic play, and animation'
arch=(any)
url=https://shantellsans.com
_url=https://github.com/arrowtype/${_fname,,}
license=(OFL-1.1-no-RFN)
_archive="${_fname//-/_}_$pkgver"
source=("$_url/releases/download/$pkgver/$_archive.zip")
sha256sums=('7562b90399eae6339f89079c917235823fca1cabda3bab624bbacaefa7abe558')

package_ttf-shantell-sans-variable() {
    cd "${_archive//_/ }"
    provides=("$pkgbase")
    install -Dm0644 -t "$pkgdir/usr/share/fonts/OTF/" Desktop/${_fname//-/}*.ttf
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" *License.txt
    install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" *About.txt
}

package_otf-shantell-sans() {
    cd "${_archive//_/ }"
    provides=("$pkgbase")
    install -Dm0644 -t "$pkgdir/usr/share/fonts/OTF/" Desktop/Static/${_fname//-/_}-*.otf
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" *License.txt
    install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" *About.txt
}
