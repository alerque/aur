# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Michael Hansen <zrax0111 gmail com>

pkgname=keybase
pkgdesc='CLI tool for GPG with keybase.io'
pkgver=1.0.36
pkgrel=1
arch=('x86_64')
url='http://keybase.io/'
license=('BSD')
depends=('gnupg')
makedepends=('go-pie' 'git' 'mercurial')
source=("$pkgname-$pkgver.tar.gz::https://github.com/keybase/client/archive/v$pkgver.tar.gz")
sha512sums=('c6bd4805240bdafd27eac382a30fac6e5ac3e6eb313dda027533c3a8f366077c894b38c1b972ff5688104e1ca4231cbf4242eeb168de9782bbac732da5639ed0')

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
