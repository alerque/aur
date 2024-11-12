# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=cargo-mutants
pkgver=24.11.0
pkgrel=1
pkgdesc='Mutation testing for Rust'
url="https://github.com/sourcefrog/$pkgname"
arch=(x86_64)
license=(MIT)
depends=(gcc-libs # libgcc_s.so
         glibc) # libc.so libm.so
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('1a551bda434aad6a59271bf2b1fe00cbe973bc78e185a048fd56e206124bbab5')

prepare() {
    cd "$_archive"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_archive"
    cargo build --frozen --release
}

package() {
    cd "$_archive"
    install -Dm 755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
