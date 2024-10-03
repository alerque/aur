# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: txtsd <aur.archlinux@ihavea.quest>

pkgname=gftools
pkgver=0.9.71
pkgrel=1
pkgdesc='Misc tools for working with the Google Fonts library'
arch=(any)
url="https://github.com/googlefonts/$pkgname"
license=(Apache-2.0)
_pydeps=(axisregistry
         babelfont
         beautifulsoup4
         brotli
         browserstack-local
         bumpfontversion
         fontfeatures
         fontmake
         fonttools
         fs # optdepends of fonttols required for [ufo]
         gflanguages
         gfsubsets
         glyphsets
         glyphslib
         jinja
         networkx
         opentype-sanitizer
         pillow
         protobuf
         pyaml
         pybrowserstack-screenshots
         pygit2
         pygithub
         requests
         rich
         ruamel-yaml
         skia-pathops
         strictyaml
         tabulate
         ttfautohint-py
         typing_extensions
         ufolib2
         unidecode
         vharfbuzz
         vttlib)
depends=(absl-py
         font-v
         hyperglot
         nanoemoji
         ninja
         python
         "${_pydeps[@]/#/python-}"
         statmake)
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
_archive="$pkgname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
sha256sums=('f26fcef992cfd5eeeb75059432340fd937ace79f4d26cf5abe5cf664c8fd746f')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
