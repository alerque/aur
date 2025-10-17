# Maintainer: goodroot <hyprwhspr@goodroot.ca>

pkgname=hyprwhspr
pkgver=1.6.1
pkgrel=1
pkgdesc="Native Whisper speech-to-text for Arch/Omarchy with Waybar integration"
arch=('x86_64')
url="https://github.com/goodroot/hyprwhspr"
license=('MIT')
depends=(
  'python'
  'ydotool'
  'pipewire' 'pipewire-alsa' 'pipewire-pulse' 'pipewire-jack'
  'cmake'
  'make'
  'git'
  'base-devel'
  'curl'
  'waybar'
)
optdepends=(
  'nvidia-utils: For GPU acceleration'
  'cuda: For GPU acceleration'
  'whisper.cpp: Use system build instead of building locally in setup step'
  'python-pip: Required for Python dependencies (installed automatically)'
)
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/goodroot/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2ae0a6b3576ae8119d8806398a28e9189daa111050dc2921c15b07359bb276c4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  # nothing to build; user runs hyprwhspr-setup post-install
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Payload into /usr/lib keeps repo layout intact for your installer
  install -d "$pkgdir/usr/lib/$pkgname"
  cp -r lib bin scripts config share README.md LICENSE requirements.txt "$pkgdir/usr/lib/$pkgname"

  # Install whisper binary if it exists in user space
  USER_WHISPER_BIN="${XDG_DATA_HOME:-$HOME/.local/share}/hyprwhspr/whisper.cpp/build/bin/whisper-cli"
  if [ -f "$USER_WHISPER_BIN" ]; then
    install -d "$pkgdir/usr/lib/$pkgname/bin"
    install -m755 "$USER_WHISPER_BIN" "$pkgdir/usr/lib/$pkgname/bin/whisper"
    echo "Installed whisper binary from user space"
  else
    echo "Warning: whisper binary not found in user space. User should run hyprwhspr-setup first."
  fi

  # Runtime launcher: unified approach - always uses user-space venv
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/$pkgname" << 'EOF'
#!/usr/bin/env bash
# hyprwhspr launcher

# Set environment variables
export HYPRWHSPR_ROOT="/usr/lib/hyprwhspr"
export PYTHONPATH="/usr/lib/hyprwhspr/lib:$PYTHONPATH"

# Activate virtual environment in user space
USER_VENV="${XDG_DATA_HOME:-$HOME/.local/share}/hyprwhspr/venv"
if [ -f "$USER_VENV/bin/activate" ]; then
    source "$USER_VENV/bin/activate"
else
    echo "Error: Virtual environment not found at $USER_VENV"
    echo "Please run hyprwhspr-setup to set up hyprwhspr"
    exit 1
fi

# Run the main application
exec python3 "/usr/lib/hyprwhspr/lib/main.py" "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/$pkgname"

  # Setup wrapper - unified approach
  cat > "$pkgdir/usr/bin/hyprwhspr-setup" << 'EOF'
#!/usr/bin/env bash
exec /usr/lib/hyprwhspr/scripts/install-omarchy.sh "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/hyprwhspr-setup"

  # Docs & license
  install -d "$pkgdir/usr/share/doc/$pkgname" "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
