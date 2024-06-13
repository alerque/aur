# Maintainer: devome <evinedeng@hotmail.com>

pkgname="gotenberg"
pkgver=8.6.0
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
        "${pkgname}.service"
        "${pkgname}.sysusers")
sha256sums=('d4b53cfecfefe34b23dc24bf1814cd23fde368c91b08359676ef47c022975913'
            'bbdbba24b200b31dfd0580dc244eceae91cababc4851f7489b399276bcc29897'
            'efaa1118db90ccee5a1321299708d8d12b1d5fd0d4841b940ecd1e6ceaa41b76'
            '2b553eb173245dfa23c48d827d69bbcd63e4e1bf57d5f227b91e62a82885ae3c')

build() {
    cd "${pkgname}-${pkgver}"
    local ldflags="
        -s -w \
        -X 'github.com/${pkgname}/${pkgname}/v8/cmd.Version=${pkgver}' \
        -extldflags '${LDFLAGS}'
    "
    go build -o "${pkgname}" -ldflags "$ldflags" "cmd/${pkgname}/main.go"
}

package() {
    install -Dm644 "${pkgname}.env"      "${pkgdir}/etc/default/${pkgname}"
    install -Dm644 "${pkgname}.service"  "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"

    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}"          "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 README.md             "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE               "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
