# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Michael Hansen <zrax0111 gmail com>

pkgname=keybase
pkgdesc='CLI tool for GPG with keybase.io'
pkgver=1.0.30
pkgrel=1
arch=('i686' 'x86_64')
url='http://keybase.io/'
license=('BSD')
depends=('gnupg')
makedepends=('go' 'git' 'mercurial')
source=("$pkgname-$pkgver.tar.gz::https://github.com/keybase/client/archive/v$pkgver.tar.gz")
sha512sums=('e8923fbc374ea04bcf6897b880918f8b63dfa452e20e8ce29d7d34e025ba9cf7bf23739db780037356207d7709eda0f5f799fa17f5cf67b2f898d40ddfbd4d69')

prepare() {
  cd client-$pkgver

  mkdir -p .gopath/src
  mv go/vendor/* .gopath/src/
  mkdir -p .gopath/src/github.com/keybase
  ln -sf "$PWD" .gopath/src/github.com/keybase/client
  export GOPATH="$PWD/.gopath"
}

build() {
  cd client-$pkgver/go/keybase
  # go build -a -tags production -gccgoflags "$CFLAGS $LDFLAGS" github.com/keybase/client/go/keybase
  go build -a -tags production github.com/keybase/client/go/keybase
}

package() {
  cd client-$pkgver
  install -Dm755 go/keybase/keybase "$pkgdir"/usr/bin/keybase
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
