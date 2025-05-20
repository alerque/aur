# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-ufo2ft
_pyname=${pkgname#python-}
pkgver=3.4.5
pkgrel=1
pkgdesc='A bridge from UFOs to FontTools objects'
arch=(any)
url="https://github.com/googlefonts/$_pyname"
license=(MIT)
_pydeps=(booleanoperations
         cffsubr
         cu2qu
         lxml # for fonttools[lxml]
         defcon
         fonttools
         fs) # for fonttools[ufo]
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
checkdepends=(python-compreffor
              python-fontmath
              python-pytest
              python-skia-pathops
              python-syrupy
              python-ufolib2)
optdepends=(python-compreffor
            python-skia-pathops)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('985563f284294364aa73e50928287ae323a0bb020237f6b277e9ec58d00acec2')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	export PYTHONPATH="$PWD/build/lib"
        pytest tests
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
