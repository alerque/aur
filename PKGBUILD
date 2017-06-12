# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-whatever
pkgname=('python-whatever' 'python2-whatever')
pkgver=0.4.3
pkgrel=1
pkgdesc='Easy way to make anonymous functions by partial application of operators'
arch=('any')
license=('BSD')
url='https://github.com/Suor/whatever'
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest-runner' 'python2-pytest-runner')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/Suor/whatever/archive/$pkgver.tar.gz")
sha512sums=('162d66753ef4fb15279150b7fa953b4ecf086e2b36cc77531dac099ff4a25b3458af627bdf52e168b7b4b2163a1445f35c2c656b1c10c0c73502d2357ba42dd8')

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
  python setup.py ptr

  cd "$srcdir"/whatever-$pkgver-py2
  python2 setup.py ptr
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
