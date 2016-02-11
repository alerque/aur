# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Michael Hansen <zrax0111 gmail com>

pkgname=keybase
pkgdesc='CLI tool for GPG with keybase.io'
pkgver=1.0.11.0
_realver=1.0.11-0
pkgrel=1
arch=('i686' 'x86_64')
url='http://keybase.io/'
license=('BSD')
depends=('gnupg')
makedepends=('go' 'git' 'mercurial')
source=("git+https://github.com/keybase/client.git#tag=v$_realver")
sha256sums=('SKIP')

prepare() {
  cd client
  mkdir -p .gopath/src

  # Hack vendored packages
  # TODO: find a way to use Go's builtin vendoring handler
  for pkg in go/vendor/*; do
    ln -s "$PWD/$pkg" ".gopath/src/$(basename $pkg)"
  done

  mkdir -p .gopath/src/github.com/keybase
  ln -sf "$PWD" .gopath/src/github.com/keybase/client
  export GOPATH="$PWD/.gopath"
}

build() {
  cd client/go/keybase
  go build -a -tags production  # -gccgoflags "$CFLAGS $LDFLAGS"
}

package() {
  cd client
  install -Dm755 go/keybase/keybase "$pkgdir"/usr/bin/keybase
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
