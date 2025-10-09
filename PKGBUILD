# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=dgop
pkgver=0.1.6
pkgrel=1
pkgdesc='System monitoring CLI + REST API'
arch=(x86_64 aarch64)
url="https://github.com/AvengeMedia/$pkgname"
license=(MIT)
depends=(glibc)
makedepends=(go)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('84b5cd7fd207302aef46fbbf83f8cb2354b9b31d0e361be160048a00204b5000')

prepare() {
	cd "$_archive"
	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export CGO_LDFLAGS="$LDFLAGS"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o "$pkgname" ./cmd/cli
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname"
}
