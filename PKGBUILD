# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-funcy
pkgname=('python-funcy' 'python2-funcy')
pkgver=1.8
pkgrel=1
pkgdesc='A fancy and practical functional tools'
arch=('any')
license=('BSD')
url='https://github.com/Suor/funcy'
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest-runner' 'python2-pytest-runner' 'python-whatever' 'python2-whatever')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/Suor/funcy/archive/$pkgver.tar.gz")
sha512sums=('b598fd004dc9801c7114de7381abe7b317ced907a171b283745fa59f56c3efd600e489a3ffbd8adc810fae1aedb0ddfa764106c527cb1876e52d148aadfeadb7')

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
