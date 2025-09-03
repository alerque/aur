# Maintainer: goodroot <hyprwhspr@goodroot.ca>

pkgname=hyprwhspr
pkgver=1.1.0
pkgrel=1
pkgdesc="Native Whisper speech-to-text for Arch/Omarchy with Waybar integration"
arch=('x86_64')
url="https://github.com/goodroot/hyprwhspr"
license=('MIT')
depends=(
    'python'
    'ydotool'
    'pipewire'
    'pipewire-alsa'
    'pipewire-pulse'
    'pipewire-jack'
    'cmake'
    'make'
    'git'
    'base-devel'
)
makedepends=()
optdepends=(
    'nvidia-utils: For GPU acceleration'
    'cuda: For GPU acceleration'
)
install="${pkgname}.install"
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/goodroot/${pkgname}/archive/v${pkgver}.tar.gz"
)
sha256sums=(
    '60e704c87894f488f32a434e037c0ded22f3dfdbbf056c8a7e5ca32a74790156'
)

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    # Create installation directory
    install -dm755 "${pkgdir}/opt/${pkgname}"
    
    # Copy all source files to /opt/hyprwhspr
    cp -r . "${pkgdir}/opt/${pkgname}/"
    
    # Make scripts executable
    chmod +x "${pkgdir}/opt/${pkgname}/scripts/"*.sh
    chmod +x "${pkgdir}/opt/${pkgname}/bin/hyprwhspr"
    
    # Create symlink for easy access
    install -dm755 "${pkgdir}/usr/bin"
    ln -sf "/opt/${pkgname}/bin/hyprwhspr" "${pkgdir}/usr/bin/hyprwhspr"
    
    # Copy documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    # Create user config template
    install -dm755 "${pkgdir}/etc/skel/.config/${pkgname}"
    cat > "${pkgdir}/etc/skel/.config/${pkgname}/config.json" << 'EOF'
{
    "primary_shortcut": "SUPER+ALT+D",
    "model": "base.en",
    "audio_feedback": true,
    "start_sound_volume": 0.3,
    "stop_sound_volume": 0.3
}
EOF
}
