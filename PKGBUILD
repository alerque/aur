# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Michael Hansen <zrax0111 gmail com>

pkgname=keybase
pkgdesc='CLI tool for GPG with keybase.io'
pkgver=1.0.47
pkgrel=1
arch=('x86_64')
url='https://keybase.io/'
license=('BSD')
depends=('gnupg')
makedepends=('go-pie')
optdepends=('kbfs: for the fuse-based fileystem and the encryption subcommand')
source=("$pkgname-$pkgver.tar.gz::https://github.com/keybase/client/archive/v$pkgver.tar.gz")
sha512sums=('d13531ae810c8964d6dd85f0ff1772dee422e7d8037d8c419d1819609c088b350e350a5e9c1a6c0872c234ee5e06209c3b20e4ee27d67a2fbca1b6c98e82d98b')


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
