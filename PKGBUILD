# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Michael Hansen <zrax0111 gmail com>

pkgname=keybase
pkgdesc='CLI tool for GPG with keybase.io'
pkgver=1.0.48
pkgrel=1
arch=('x86_64')
url='https://keybase.io/'
license=('BSD')
depends=('gnupg')
makedepends=('go-pie')
optdepends=('kbfs: for the fuse-based fileystem and the encryption subcommand')
source=("$pkgname-$pkgver.tar.gz::https://github.com/keybase/client/archive/v$pkgver.tar.gz")
sha512sums=('fac72b7827dff350589e28e0d602b024130bc6bee8dd282dc141db773e493fcd4043aef6ce5382f92e1841619245c5819adf23d6dcf32b409939c275f40a03f1')


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
