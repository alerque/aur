# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=gitlab-container-registry
_pkgname=container-registry
pkgver=3.92.0
pkgrel=1
pkgdesc='GitLab Container Registry daemon'
url="https://gitlab.com/gitlab-org/$_pkgname"
license=(Apache-2.0)
arch=(x86_64 i686)
makedepends=(go)
backup=("etc/$pkgname/config.yml")
_archive="$_pkgname-v$pkgver-gitlab"
source=("$url/-/archive/v$pkgver-gitlab/$_archive.tar.bz2"
        "$pkgname.service")
sha256sums=('570a25b26590a591357fa798d46211630ef490512561257b5f3a76e9f116fd54'
            '1ecaf5b575d574f203e2a7c67b139ab72734d3e81a5f45fc0702cbb7b806a7b9')

build() {
	cd "$_archive"
	export GOPATH="$srcdir"
	export CGO_ENABLED=0
	local _pkg="github.com/docker/distribution"
	local _rev="$(zcat ${sourec[0]##*/} | git get-tar-commit-id)"
	go build \
		-trimpath \
		-buildmode=exe \
		-mod=readonly \
		-modcacherw \
		-ldflags " \
			-X $_pkg/version.Version=$pkgver \
			-X $_pkg/version.Revision=$_rev \
			-X $_pkg/version.Package=$pkgname \
			-extldflags \"$LDFLAGS\" \
		" \
		-o "bin/$pkgname" ./cmd/registry
}

check() {
	cd "$_archive"
	./bin/$pkgname --version | grep $pkgver
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "bin/$pkgname"
	install -Dm0644 config/filesystem.yml "$pkgdir/etc/$pkgname/config.yml"
	install -Dm0644 -t "$pkgdir/usr/lib/systemd/system/" "../$pkgname.service"
}
