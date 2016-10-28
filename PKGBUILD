# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-funcy
pkgname=('python-funcy' 'python2-funcy')
pkgver=1.7.1
pkgrel=1
pkgdesc='A fancy and practical functional tools'
arch=('any')
license=('BSD')
url='https://github.com/Suor/funcy'
makedepends=('python-setuptools' 'python2-setuptools' 'git')
checkdepends=('python-pytest-runner' 'python2-pytest-runner' 'python-whatever' 'python2-whatever')
source=("git+https://github.com/Suor/funcy.git#tag=$pkgver")
md5sums=('SKIP')

prepare() {
  cp -a funcy{,-py2}
}

build() {
  cd "$srcdir"/funcy
  python setup.py build

  cd "$srcdir"/funcy-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/funcy
  python setup.py ptr

  cd "$srcdir"/funcy-py2
  python2 setup.py ptr
}

package_python-funcy() {
  depends=('python')

  cd funcy
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-funcy() {
  depends=('python2')

  cd funcy-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
