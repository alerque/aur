# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=gftools
pkgver=0.9.54
pkgrel=2
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
         python
         "${_pydeps[@]/#/python-}"
         statmake)
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
_archive="$pkgname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
sha256sums=('15547dface02cf4a01024495ec5cbd59c1ae3cd4273725405a6e13b75293befb')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
