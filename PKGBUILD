# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=straight.plugin
pkgname=python-$_pipname
pkgver=1.5.0
pkgrel=2
pkgdesc='A simple namespaced plugin facility'
arch=(any)
url="https://github.com/ironfroggy/$_pipname"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
_archive="$_pipname-$pkgver"
source=("https://pypi.python.org/packages/source/s/$_pipname/$_archive.tar.gz")
sha256sums=('818a7641068932ed6436d0af0a3bb77bbbde29df0a7142c8bd1a249e7c2f0d38')

build() {
	cd "$_archive"
	python setup.py build
}

check() {
	cd "$_archive"
	python setup.py test
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
