# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Michael Hansen <zrax0111 gmail com>

pkgname=keybase
pkgdesc='CLI tool for GPG with keybase.io'
pkgver=1.0.17
_realver=1.0.17
pkgrel=1
arch=('i686' 'x86_64')
url='http://keybase.io/'
license=('BSD')
depends=('gnupg')
makedepends=('gcc-go' 'git' 'mercurial')
source=("git+https://github.com/keybase/client.git#tag=v$_realver")
sha256sums=('SKIP')

prepare() {
  cd client

  mkdir -p .gopath/src
  mv go/vendor/* .gopath/src/
  mkdir -p .gopath/src/github.com/keybase
  ln -sf "$PWD" .gopath/src/github.com/keybase/client
  export GOPATH="$PWD/.gopath"
}

build() {
  cd client/go/keybase
  go build -a -tags production -gccgoflags "$CFLAGS $LDFLAGS" github.com/keybase/client/go/keybase
}

package() {
  cd client
  install -Dm755 go/keybase/keybase "$pkgdir"/usr/bin/keybase
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
