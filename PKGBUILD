# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Michael Hansen <zrax0111 gmail com>

pkgname=keybase
pkgdesc='CLI tool for GPG with keybase.io'
pkgver=1.0.39
pkgrel=1
arch=('x86_64')
url='http://keybase.io/'
license=('BSD')
depends=('gnupg')
makedepends=('go-pie' 'git' 'mercurial')
source=("$pkgname-$pkgver.tar.gz::https://github.com/keybase/client/archive/v$pkgver.tar.gz")
sha512sums=('def416bad6fc3513a3341aecaf03bce356a890667e4c64f9edc1c469b3a1f167c3022f6c1aabaa48257983aaa9826b45117ada6cc26bf862c97092c904cd32f1')

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
