# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=gftools
pkgver=0.9.38
pkgrel=1
pkgdesc='Misc tools for working with the Google Fonts library'
arch=(any)
url="https://github.com/googlefonts/$pkgname"
license=(Apache)
_py_deps=(axisregistry
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
         "${_py_deps[@]/#/python-}"
         statmake)
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
_archive="$pkgname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
sha256sums=('6c4198a462e2b8f9e45f1d6216e0c69cb58252ef867427f25dea92a143dec852')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
