# Maintainer: goodroot <hyprwhspr@goodroot.ca>

pkgname=hyprwhspr
pkgver=1.2.0
pkgrel=1
pkgdesc="Native Whisper speech-to-text for Arch/Omarchy with Waybar integration"
arch=('x86_64')
url="https://github.com/goodroot/hyprwhspr"
license=('MIT')
depends=(
    'python'
    'python-evdev'
    'python-numpy'
    'python-scipy'
    'python-pyperclip'
    'python-psutil'
    'python-rich'
    'python-json5'
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
    'ac063f5c43da89e89b65230b5a7e70533019ae9274c118c37b62c636ef63cf92'
)

package() {
    # Create installation directory
    install -dm755 "${pkgdir}/opt/${pkgname}"
    
    # Copy all source files to /opt/hyprwhspr from the correct source directory
    # Use explicit file list to avoid copying hidden files and ensure we only copy what we need
    cp -r "${srcdir}/${pkgname}-${pkgver}/bin" \
          "${srcdir}/${pkgname}-${pkgver}/config" \
          "${srcdir}/${pkgname}-${pkgver}/lib" \
          "${srcdir}/${pkgname}-${pkgver}/scripts" \
          "${srcdir}/${pkgname}-${pkgver}/share" \
          "${srcdir}/${pkgname}-${pkgver}/requirements.txt" \
          "${srcdir}/${pkgname}-${pkgver}/README.md" \
          "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
          "${pkgdir}/opt/${pkgname}/"
    
    # Make scripts executable
    chmod +x "${pkgdir}/opt/${pkgname}/scripts/"*.sh
    chmod +x "${pkgdir}/opt/${pkgname}/bin/hyprwhspr"
    
    # Create Python virtual environment and install pip-only dependencies
    cd "${pkgdir}/opt/${pkgname}"
    python -m venv venv
    source venv/bin/activate
    pip install --upgrade pip
    pip install sounddevice  # Only dependency not available in Arch repos
    
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
