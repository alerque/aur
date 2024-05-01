# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=gitlab-container-registry
_pkgname=container-registry
pkgver=4.0.0
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
sha256sums=('16885d177ce70a3a00b16a57e746f8172effaedb219983a1722940d9ecd04f1a'
            '61cd00e2981843bdeffe36767da20f09df1ca47cf814caf95d881c5c703f2004')

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
