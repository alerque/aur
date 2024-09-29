# Maintainer: devome <evinedeng@hotmail.com>

pkgname="gotenberg"
pkgver=8.11.0
pkgrel=1
pkgdesc="A developer-friendly API for converting numerous document formats into PDF files, and more!"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/${pkgname}/${pkgname}"
license=("MIT")
provides=("${pkgname}")
conflicts=("${pkgname}")
backup=("etc/default/${pkgname}")
depends=("chromium" "libreoffice-fresh" "pdftk" "perl-image-exiftool" "qpdf" "unoconv")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.env"
        "${pkgname}.service")
sha256sums=('3fe5a8b579d3bc7bd9e432f4ad39f758d60938adb32dded1085b97889a70d59a'
            'bbdbba24b200b31dfd0580dc244eceae91cababc4851f7489b399276bcc29897'
            '1b3567e2fe374ce104150d198de3fe372724d3b8510aba64716e3dcb3b37c50a')

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    
    cd "${pkgname}-${pkgver}"
    local ldflags="
        -s -w \
        -X 'github.com/${pkgname}/${pkgname}/v8/cmd.Version=${pkgver}' \
        -extldflags '${LDFLAGS}'
    "
    go build -trimpath -o "${pkgname}" -ldflags "$ldflags" "cmd/${pkgname}/main.go"
}

package() {
    install -Dm644 "${pkgname}.env"      "${pkgdir}/etc/default/${pkgname}"
    install -Dm644 "${pkgname}.service"  "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}"          "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 README.md             "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE               "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
