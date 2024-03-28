# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=gflanguages
pkgname=python-$_pyname
epoch=1
pkgver=0.5.17
pkgrel=1
pkgdesc='API for evaluating language support in the Google Fonts collection'
arch=(any)
url="https://github.com/googlefonts/$_pyname"
license=(Apache)
depends=(python
         python-protobuf)
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
checkdepends=(python-pytest
              python-filelock
              python-uharfbuzz
              python-youseedee)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('752720450eaeb234aa57416a0f23fe286bc72f4eb095315570ef8c999d8d300b')

prepare() {
	cd "$_archive"
	sed -i -e '/setuptools_scm/s/>=4,<6.1//' setup.py
}

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	PYTHONPATH=Lib pytest
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
