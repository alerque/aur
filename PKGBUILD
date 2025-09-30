# Maintainer: goodroot <hyprwhspr@goodroot.ca>

pkgname=hyprwhspr
pkgver=1.2.9
pkgrel=6
pkgdesc="Native Whisper speech-to-text for Arch/Omarchy with Waybar integration"
arch=('x86_64')
url="https://github.com/goodroot/hyprwhspr"
license=('MIT')
depends=(
  'python'
  'python-numpy'
  'python-scipy'
  'python-pyperclip'
  'python-psutil'
  'python-rich'
  'python-json5'
  'python-sounddevice'
  'python-evdev'
  'python-requests'
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
)
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/goodroot/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fe6dca68145588b41c527dacb42075b98e58374c5d98b61ccb32d7f7f8d4ce87')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  # nothing to build; user runs hyprwhspr-setup post-install
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Payload into /usr/lib keeps repo layout intact for your installer
  install -d "$pkgdir/usr/lib/$pkgname"
  cp -r lib bin scripts config share README.md LICENSE requirements.txt "$pkgdir/usr/lib/$pkgname"

  # Runtime launcher: prefers user venv + user whisper.cpp bin
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/$pkgname" << 'EOF'
#!/usr/bin/env bash
# hyprwhspr launcher
PKG_ROOT="/usr/lib/hyprwhspr"
export HYPRWHSPR_ROOT="$PKG_ROOT"
export PYTHONPATH="$PKG_ROOT/lib${PYTHONPATH:+:$PYTHONPATH}"

# Prefer a user venv; fall back to package venv; else system python
if [[ -n "$HYPRWHSPR_VENV" ]]; then
  VENV="$HYPRWHSPR_VENV"
elif [[ -n "$XDG_DATA_HOME" && -d "$XDG_DATA_HOME/hyprwhspr/venv" ]]; then
  VENV="$XDG_DATA_HOME/hyprwhspr/venv"
elif [[ -d "$HOME/.local/share/hyprwhspr/venv" ]]; then
  VENV="$HOME/.local/share/hyprwhspr/venv"
elif [[ -d "$PKG_ROOT/venv" ]]; then
  VENV="$PKG_ROOT/venv"
fi

# Ensure user whisper.cpp bin is on PATH if present
USER_WC_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/hyprwhspr/whisper.cpp"
if [[ -x "$USER_WC_DIR/build/bin/whisper-cli" ]]; then
  export PATH="$USER_WC_DIR/build/bin:$PATH"
fi

if [[ -x "$VENV/bin/python" ]]; then
  exec "$VENV/bin/python" "$PKG_ROOT/lib/main.py" "$@"
else
  exec python3 "$PKG_ROOT/lib/main.py" "$@"
fi
EOF
  chmod 755 "$pkgdir/usr/bin/$pkgname"

  # Setup wrapper → AUR mode
  cat > "$pkgdir/usr/bin/hyprwhspr-setup" << 'EOF'
#!/usr/bin/env bash
export HYPRWHSPR_AUR_INSTALL=1
exec /usr/lib/hyprwhspr/scripts/install-omarchy.sh "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/hyprwhspr-setup"

  # AUR-friendly user units so users can enable them directly
  install -d "$pkgdir/usr/lib/systemd/user"
  if [[ -f "$srcdir/$pkgname-$pkgver/packaging/systemd/hyprwhspr.service" ]]; then
    install -m644 "$srcdir/$pkgname-$pkgver/packaging/systemd/hyprwhspr.service" \
      "$pkgdir/usr/lib/systemd/user/hyprwhspr.service"
  else
    install -m644 "$srcdir/$pkgname-$pkgver/config/systemd/hyprwhspr.service" \
      "$pkgdir/usr/lib/systemd/user/hyprwhspr.service"
  fi
  if [[ -f "$srcdir/$pkgname-$pkgver/packaging/systemd/ydotoold.service" ]]; then
    install -m644 "$srcdir/$pkgname-$pkgver/packaging/systemd/ydotoold.service" \
      "$pkgdir/usr/lib/systemd/user/ydotoold.service"
  elif [[ -f "$srcdir/$pkgname-$pkgver/config/systemd/ydotoold.service" ]]; then
    install -m644 "$srcdir/$pkgname-$pkgver/config/systemd/ydotoold.service" \
      "$pkgdir/usr/lib/systemd/user/ydotoold.service"
  fi

  # Docs & license
  install -d "$pkgdir/usr/share/doc/$pkgname" "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
