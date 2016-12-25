# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-whatever
pkgname=('python-whatever' 'python2-whatever')
pkgver=0.4.2
pkgrel=2
pkgdesc='Easy way to make anonymous functions by partial application of operators'
arch=('any')
license=('BSD')
url='https://github.com/Suor/whatever'
makedepends=('python-setuptools' 'python2-setuptools' 'git')
checkdepends=('python-pytest-runner' 'python2-pytest-runner')
source=("git+https://github.com/Suor/whatever.git#tag=$pkgver")
md5sums=('SKIP')

prepare() {
  cp -a whatever{,-py2}
}

build() {
  cd "$srcdir"/whatever
  python setup.py build

  cd "$srcdir"/whatever-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/whatever
  python setup.py ptr

  cd "$srcdir"/whatever-py2
  python2 setup.py ptr
}

package_python-whatever() {
  depends=('python')

  cd whatever
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-whatever() {
  depends=('python2')

  cd whatever-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
