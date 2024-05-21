# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: txtsd <aur.archlinux@ihavea.quest>

pkgname=gftools
pkgver=0.9.58
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
         networkx
         ninja
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
sha256sums=('a4943624a42ed34192d537781fd4e8102972acfd52544c7331f30889eeba099d')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
