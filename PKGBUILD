# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-whatever
pkgname=('python-whatever' 'python2-whatever')
pkgver=0.5
pkgrel=2
pkgdesc='Easy way to make anonymous functions by partial application of operators'
arch=('any')
license=('BSD')
url='https://github.com/Suor/whatever'
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest-runner' 'python2-pytest-runner')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/Suor/whatever/archive/$pkgver.tar.gz")
sha512sums=('eb3f0b9bc63197c1bfdd135a46a597e2f5d6131900910f266c984c1afd901d6cbc8c8ee62397e9af8393bf34beff068dc0007e8b016e70f275e019420f18f6e1')

prepare() {
  cp -a whatever-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/whatever-$pkgver
  python setup.py build

  cd "$srcdir"/whatever-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/whatever-$pkgver
  python setup.py pytest

  cd "$srcdir"/whatever-$pkgver-py2
  python2 setup.py pytest
}

package_python-whatever() {
  depends=('python')

  cd whatever-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-whatever() {
  depends=('python2')

  cd whatever-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
