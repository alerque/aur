# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-funcy
pkgver=2.0
_commit=13fac0037c109a9e4649fc8ee343be17647f7407
pkgrel=4
pkgdesc='A fancy and practical functional tools'
arch=(any)
license=(BSD)
url='https://github.com/Suor/funcy'
depends=(python)
makedepends=(git
             python-{build,installer,wheel}
             python-setuptools)
checkdepends=(python-pytest
              python-whatever)
source=("git+https://github.com/Suor/funcy.git#commit=$_commit")
sha512sums=('SKIP')

build() {
	cd funcy
	python -m build -wn
}

check() {
	cd funcy
	pytest
}

package() {
	cd funcy
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
