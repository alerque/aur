# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Michael Hansen <zrax0111 gmail com>

pkgname=keybase
pkgdesc='CLI tool for GPG with keybase.io'
pkgver=1.0.29
pkgrel=1
arch=('i686' 'x86_64')
url='http://keybase.io/'
license=('BSD')
depends=('gnupg')
makedepends=('go' 'git' 'mercurial')
source=("$pkgname-$pkgver.tar.gz::https://github.com/keybase/client/archive/v$pkgver.tar.gz")
sha512sums=('822c199da1654d2ddbfaf0a5beb7727380cc6b2aa4635ab4c5a18dcb2033a8df7dd4a224933a4bebb90201f1a2e529113fa760d036ee741278416639d3a945eb')

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
