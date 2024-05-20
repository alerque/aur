# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-whatever
pkgver=0.7
_commit=7f2cab8e8dfe50e0696b149c68b1c3fff7b70094
pkgrel=5
pkgdesc='Easy way to make anonymous functions by partial application of operators'
arch=(any)
license=(BSD)
url='https://github.com/Suor/whatever'
depends=(python)
makedepends=(git
             python-{build,installer,wheel}
             python-setuptools)
checkdepends=(python-pytest)
source=("git+https://github.com/Suor/whatever.git#commit=$_commit")
sha512sums=('SKIP')

build() {
	cd whatever
	python -m build -wn
}

check() {
	cd whatever
	pytest
}

package() {
	cd whatever
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
