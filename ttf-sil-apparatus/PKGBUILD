# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Fredrick Brennan <fred@mfek.org>

_pkgname=apparatus
_orgname=SIL
pkgname=ttf-${_orgname,,}-$_pkgname
_fname=${_pkgname^}${_orgname}
_pname=${_pkgname:0:3}${_orgname,,}
pkgver=1.0
pkgrel=4
pkgdesc='Symbols used for Biblical text apparatus'
arch=('any')
url="https://scripts.sil.org/$_fname"
license=('OFL')
conflicts=('ttf-sil-fonts<=6')
source=("$_fname-$pkgver.zip::https://scripts.sil.org/cms/sites/nrsi/download/$_pname$pkgver.zip/$_fname.zip")
sha256sums=('0d8e3143b9c46c97916ab2cf85ae2187fe33b9b40859567a5524266dd58581bc')

package() {
    cd "Apparatus SIL"
    find -type f -name "$_pname*.ttf" -execdir \
        install -Dvm644 -t "$pkgdir/usr/share/fonts/TTF" {} \;
    install -Dvm644 -t "$pkgdir/usr/share/doc/$pkgname" FONTLOG.txt
    install -Dvm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}
