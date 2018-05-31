# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Michael Hansen <zrax0111 gmail com>

pkgname=keybase
pkgdesc='CLI tool for GPG with keybase.io'
pkgver=2.0.0
pkgrel=1
arch=('x86_64')
url='https://keybase.io/'
license=('BSD')
depends=('gnupg')
makedepends=('go-pie')
optdepends=('kbfs: for the fuse-based fileystem and the encryption subcommand')
source=("$pkgname-$pkgver.tar.gz::https://github.com/keybase/client/archive/v$pkgver.tar.gz")
sha512sums=('46da587cd7ceffc67a9d78a8563f1e33364f6d162dd7588ec1a25357819e159613937d2ba16115477b4fc89e8e9aac2cd47b7ab83966f683c42c5965420f8076')

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
  install -Dm644 packaging/linux/systemd/keybase.service "$pkgdir"/usr/lib/systemd/user/keybase.service
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
