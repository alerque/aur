# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Michael Hansen <zrax0111 gmail com>

pkgname=keybase
pkgdesc='CLI tool for GPG with keybase.io'
pkgver=1.0.33
pkgrel=2
arch=('x86_64')
url='http://keybase.io/'
license=('BSD')
depends=('gnupg')
makedepends=('go-pie' 'git' 'mercurial')
source=("$pkgname-$pkgver.tar.gz::https://github.com/keybase/client/archive/v$pkgver.tar.gz")
sha512sums=('d02933e88613102e27a4aa5f2494ae2b55456cab8c5cadad9c412069b24c574a20609fc83b88bc8f9aa00bfd300822bc4c882392f65fec3e7a8056cebc6fb9d4')

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
