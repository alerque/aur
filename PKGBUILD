# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-funcy
pkgname=('python-funcy' 'python2-funcy')
pkgver=1.9
pkgrel=1
pkgdesc='A fancy and practical functional tools'
arch=('any')
license=('BSD')
url='https://github.com/Suor/funcy'
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest-runner' 'python2-pytest-runner' 'python-whatever' 'python2-whatever')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/Suor/funcy/archive/$pkgver.tar.gz")
sha512sums=('27b336149178ecda45ca528d607a9da2f025694291a3513223f7ad154c0926246d658658241a75b0631d7dc4bdd98791919f77da96deb513a726c64c8ef3ed13')

prepare() {
  cp -a funcy-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/funcy-$pkgver
  python setup.py build

  cd "$srcdir"/funcy-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/funcy-$pkgver
  python setup.py pytest

  cd "$srcdir"/funcy-$pkgver-py2
  python2 setup.py pytest
}

package_python-funcy() {
  depends=('python')

  cd funcy-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-funcy() {
  depends=('python2')

  cd funcy-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
