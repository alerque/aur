# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=dgop
pkgver=0.1.4
pkgrel=2
pkgdesc='System monitoring CLI + REST API'
arch=(x86_64 aarch64)
url="https://github.com/AvengeMedia/$pkgname"
license=(MIT)
depends=(glibc)
makedepends=(go)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('37be37b01ba45a9cb7bbd8fbaae985a0f441102d46767054c5b5ff4bf67ffe30')

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
