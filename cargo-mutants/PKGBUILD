# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=cargo-mutants
pkgver=24.7.1
pkgrel=1
pkgdesc='Mutation testing for Rust'
url="https://github.com/sourcefrog/$pkgname"
arch=("x86_64")
license=("MIT")
depends=("cargo")
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('ea28c2af416435a4bcc1feb230179163aff0d6c6ef73ce8b628f03f38c5adab0')

prepare()
{
    cd "$srcdir/$pkgname-$pkgver"

    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build()
{
    cd "$srcdir/$pkgname-$pkgver"

    cargo build --frozen --release
}

package()
{
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
