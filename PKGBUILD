# Maintainer: Oktana Coop <team@oktana.dev>
pkgname=v2-bin
_pkgname=v2
pkgver=0.11.21
pkgrel=1
pkgdesc="A local-first rich text editor with Git-style version control, true privacy, and complete control over your data"
arch=('x86_64' 'aarch64')
url="https://oktana.dev"
license=('AGPL3')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'libsecret' 'libasound.so')
optdepends=('libappindicator-gtk3: tray icon support')
provides=('v2')
conflicts=('v2')
options=('!strip' '!debug')
source_x86_64=("v2-${pkgver}.AppImage::https://github.com/oktana-coop/v2/releases/download/v${pkgver}/v2-${pkgver}-x86_64.AppImage")
source_aarch64=("v2-${pkgver}.AppImage::https://github.com/oktana-coop/v2/releases/download/v${pkgver}/v2-${pkgver}-arm64.AppImage")
sha256sums_x86_64=('d498cc3ef25e84a438387ba1fd31be69a0d119b9a3c38e84bc3ae1ee52575d07')
sha256sums_aarch64=('7b5f24980b8ee1ef5262348d5603576de0efe2bb314abcde093e5a46e6dde52f')

prepare() {
    _appimage="v2-${pkgver}.AppImage"
    chmod +x "${srcdir}/${_appimage}"
    "${srcdir}/${_appimage}" --appimage-extract
}

package() {
    # Install app to /opt
    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/squashfs-root/." "${pkgdir}/opt/${pkgname}/"

    # Fix permissions
    chmod 755 "${pkgdir}/opt/${pkgname}"
    find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} \;
    find "${pkgdir}/opt/${pkgname}" -type f -exec chmod 644 {} \;
    chmod 755 "${pkgdir}/opt/${pkgname}/${_pkgname}"
    chmod 755 "${pkgdir}/opt/${pkgname}/chrome-sandbox" 2>/dev/null || true

    # Create launcher script
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${_pkgname}" << EOF
#!/bin/bash
exec /opt/${pkgname}/${_pkgname} "\$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${_pkgname}"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icons
    for size in 16 32 48 64 128 256 512; do
        if [[ -f "${srcdir}/squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/${_pkgname}.png" ]]; then
            install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/${_pkgname}.png" \
                "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_pkgname}.png"
        fi
    done

    # Fix desktop file paths
    sed -i "s|Exec=.*|Exec=/usr/bin/${_pkgname} %U|g" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
