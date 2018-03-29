# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Michael Hansen <zrax0111 gmail com>

pkgname=keybase
pkgdesc='CLI tool for GPG with keybase.io'
pkgver=1.0.46
pkgrel=1
arch=('x86_64')
url='https://keybase.io/'
license=('BSD')
depends=('gnupg')
makedepends=('go-pie')
source=("$pkgname-$pkgver.tar.gz::https://github.com/keybase/client/archive/v$pkgver.tar.gz")
sha512sums=('35dbc18ae5d7efc6137e225e9257f3b897d381d621b6d7601b69250197f27704212e9ddfdb2a9d4181a668993d79431209ecd612d509caf3929857afb51885bd')


prepare() {
  cd client-$pkgver

  export GOPATH="$srcdir/.gopath"
  mkdir -p "$GOPATH"/src/github.com/keybase
  ln -sf "$PWD" "$GOPATH"/src/github.com/keybase/client
}

build() {
  cd client-$pkgver/go/keybase

  export GOPATH="$srcdir/.gopath"
  # go build -a -tags production -gccgoflags "$CFLAGS $LDFLAGS" github.com/keybase/client/go/keybase
  go build -a -tags production -o ../bin/keybase github.com/keybase/client/go/keybase
  go build -a -tags production -o ../bin/kbnm github.com/keybase/client/go/kbnm
}

package() {
  cd client-$pkgver

  install -Dm755 -t "$pkgdir"/usr/bin/ go/bin/*

  # native messaging whitelists
  KBNM_INSTALL_ROOT=1 KBNM_INSTALL_OVERLAY="$pkgdir" "$pkgdir/usr/bin/kbnm" install
  # systemd activation
  install -Dm755 packaging/linux/systemd/keybase.service "$pkgdir"/usr/lib/systemd/user/keybase.service

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
