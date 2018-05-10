# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-funcy
pkgname=('python-funcy' 'python2-funcy')
pkgver=1.10.2
pkgrel=1
pkgdesc='A fancy and practical functional tools'
arch=('any')
license=('BSD')
url='https://github.com/Suor/funcy'
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest-runner' 'python2-pytest-runner' 'python-whatever' 'python2-whatever')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/Suor/funcy/archive/$pkgver.tar.gz")
sha512sums=('3d636972294e5d3469dc51fbeac3db42e99f913fcb47f572ba2ac140521888ef383a75b426e18bd108034b0327e793fa50be9df79147b792bf510df496ad61ae')

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
