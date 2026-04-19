# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: kiasoc5 <kiasoc5 at tutanota dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=midivisualizer
_pkgname=MIDIVisualizer
pkgver=7.3
pkgrel=1
pkgdesc='A small MIDI visualizer tool, using OpenGL'
arch=(x86_64)
url="https://github.com/kosua20/$_pkgname"
license=(MIT)
depends=(ffmpeg
         gtk3
	 libnotify)
# TODO unbundle glfw, libnfd
makedepends=(cmake
             gendesk
             git)
source=("git+$url#tag=v$pkgver")
sha256sums=('de62b44ba62bbdf642de0fa7e294622febab2c045101087113dcae1f0f739675')

prepare() {
	gendesk -n --pkgname "$_pkgname" --pkgdesc "$pkgdesc" --name "$_pkgname" -f
}

build() {
	cmake -B build -S "$_pkgname" -Wno-dev
	make -C build
}

package() {
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "$_pkgname.desktop"
	install -Dm0755 -t "$pkgdir/usr/bin/" "build/$_pkgname"
	cd "$_pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	install -Dm0644 -t "$pkgdir/usr/share/pixmaps/" "resources/icon/$_pkgname.png"
	install -Dm0644 -t "$pkgdir/usr/share/doc/$_pkgname/" README.md
}
