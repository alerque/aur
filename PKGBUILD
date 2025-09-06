# Maintainer: goodroot <hyprwhspr@goodroot.ca>

pkgname=hyprwhspr
pkgver=1.2.0
pkgrel=10
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
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    # Create installation directory
    install -dm755 "${pkgdir}/opt/${pkgname}"
    
    # Copy all source files to /opt/hyprwhspr
    cp -r . "${pkgdir}/opt/${pkgname}/"
    
    # Make scripts executable
    chmod +x "${pkgdir}/opt/${pkgname}/scripts/"*.sh
    chmod +x "${pkgdir}/opt/${pkgname}/bin/hyprwhspr"
    
    # Fix the launcher script to use venv python directly
    cat > "${pkgdir}/opt/${pkgname}/bin/hyprwhspr" << 'EOF'
#!/bin/bash

# HyprWhspr - Hyprland-optimized voice dictation application
# Main launcher script

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGE_ROOT="$(dirname "$SCRIPT_DIR")"

# Set environment variables
export HYPRWHSPR_ROOT="$PACKAGE_ROOT"
export PYTHONPATH="$PACKAGE_ROOT/lib:$PYTHONPATH"

# Use virtual environment's python directly if it exists
if [ -f "$PACKAGE_ROOT/venv/bin/python" ]; then
    exec "$PACKAGE_ROOT/venv/bin/python" "$PACKAGE_ROOT/lib/main.py" "$@"
else
    # Fallback to system python
    exec python3 "$PACKAGE_ROOT/lib/main.py" "$@"
fi
EOF
    chmod +x "${pkgdir}/opt/${pkgname}/bin/hyprwhspr"
    
    # Create Python virtual environment and install ALL dependencies
    cd "${pkgdir}/opt/${pkgname}"
    python -m venv venv
    # Use the venv's python directly to avoid path issues
    ./venv/bin/python -m pip install --upgrade pip
    # Install all Python dependencies in venv for self-contained environment
    ./venv/bin/python -m pip install numpy scipy pyperclip psutil rich json5 sounddevice evdev
    
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
