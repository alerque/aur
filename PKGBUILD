# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-funcy
pkgname=('python-funcy' 'python2-funcy')
pkgver=1.7.4
pkgrel=1
pkgdesc='A fancy and practical functional tools'
arch=('any')
license=('BSD')
url='https://github.com/Suor/funcy'
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest-runner' 'python2-pytest-runner' 'python-whatever' 'python2-whatever')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/Suor/funcy/archive/$pkgver.tar.gz")
sha512sums=('a6cfcbc69d88a0584e7062a48cbe97037d4961ef390e47d657d3239d031e5fd23c7cbeee56f83ffe62ed14e30fa955a63f817e94d0d2b641a7e2039684b72e01')

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
