# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Michael Hansen <zrax0111 gmail com>

pkgname=keybase
pkgdesc='CLI tool for GPG with keybase.io'
pkgver=1.0.16
_realver=1.0.16
pkgrel=2
arch=('i686' 'x86_64')
url='http://keybase.io/'
license=('BSD')
depends=('gnupg')
makedepends=('gcc-go' 'git' 'mercurial')
source=("git+https://github.com/keybase/client.git#tag=v$_realver"
        gccgo.patch)
sha256sums=('SKIP'
            '75ec94f85e665defd3e2560d31b498e982e9aaf787d6f6edf4b907217d20b8d1')

prepare() {
  cd client
  patch -p1 -i ../gccgo.patch

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
