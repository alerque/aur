# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: txtsd <aur.archlinux@ihavea.quest>

pkgname=gftools
pkgver=0.9.63
pkgrel=1
pkgdesc='Misc tools for working with the Google Fonts library'
arch=(any)
url="https://github.com/googlefonts/$pkgname"
license=(Apache-2.0)
_pydeps=(axisregistry
         babelfont
         brotli
         browserstack-local
         fontfeatures
         fontmake
         fonttools
         fs # optdepends of fonttols required for [ufo]
         gflanguages
         glyphslib
         glyphsets
         jinja
         networkx
         opentype-sanitizer
         protobuf
         pyaml
         pybrowserstack-screenshots
         pygit2
         pygithub
         requests
         skia-pathops
         strictyaml
         tabulate
         ufolib2
         ttfautohint-py
         unidecode
         vttlib)
depends=(absl-py
         hyperglot
         ninja
         python
         "${_pydeps[@]/#/python-}"
         statmake)
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
_archive="$pkgname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
sha256sums=('48124f40eb2c99a5b383837b41dca853df740f717a329c007a263b24eb926ad0')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
