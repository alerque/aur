# Generated by gem2arch (https://github.com/anatol/gem2arch)
# Maintainer: Caleb Maclennan <caleb@alerque.com>

_gemname=ruby-ole
pkgname=ruby-$_gemname
pkgver=1.2.13.1
pkgrel=1
pkgdesc='Ruby OLE library.'
arch=(any)
url='https://github.com/aquasync/ruby-ole'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('7093d44924fd15c3e6e110f7ea991daf36783ab3')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
