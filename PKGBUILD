# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=cargo-mutants
pkgver=24.11.2
pkgrel=1
pkgdesc='Mutation testing for Rust'
url="https://github.com/sourcefrog/$pkgname"
arch=(x86_64)
license=(MIT)
depends=(cargo
         gcc-libs # libgcc_s.so
         glibc) # libc.so libm.so
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('e558eaf0cd8a84f1433fe74c94c2d2f8f3e3140bd0c3005f19b4945c797a5d89')

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
