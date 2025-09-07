# Maintainer: goodroot <hyprwhspr@goodroot.ca>

pkgname=hyprwhspr
pkgver=1.2.1
pkgrel=1
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
  'ydotool'
  'pipewire' 'pipewire-alsa' 'pipewire-pulse' 'pipewire-jack'
)
optdepends=(
  'nvidia-utils: For GPU acceleration'
  'cuda: For GPU acceleration'
  'waybar: For tray/status'
  'whisper.cpp: Use system build instead of building locally in setup step'
)
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('357d905dd667b31da5c2f23e4908e0103ea12cb781cb6fff39ee2f08840108dd')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  # nothing to build; user runs hyprwhspr-setup post-install
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Payload into /usr/lib keeps repo layout intact for your installer
  install -d "$pkgdir/usr/lib/$pkgname"
  cp -r lib bin scripts config README.md LICENSE requirements.txt "$pkgdir/usr/lib/$pkgname"

  # Runtime launcher (uses venv if setup has been run; else system python)
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/$pkgname" << 'EOF'
#!/usr/bin/env bash
PKG_ROOT="/usr/lib/hyprwhspr"
export HYPRWHSPR_ROOT="$PKG_ROOT"
export PYTHONPATH="$PKG_ROOT/lib${PYTHONPATH:+:$PYTHONPATH}"
if [[ -x "$PKG_ROOT/venv/bin/python" ]]; then
  exec "$PKG_ROOT/venv/bin/python" "$PKG_ROOT/lib/main.py" "$@"
else
  exec python3 "$PKG_ROOT/lib/main.py" "$@"
fi
EOF
  chmod 755 "$pkgdir/usr/bin/$pkgname"

  # Expose your installer verbatim; users run this after install
  install -m755 "$srcdir/$pkgname-$pkgver/scripts/install-omarchy.sh" \
    "$pkgdir/usr/lib/$pkgname/scripts/install-omarchy.sh"

  # Convenience wrapper → AUR mode
  cat > "$pkgdir/usr/bin/hyprwhspr-setup" << 'EOF'
#!/usr/bin/env bash
export HYPRWHSPR_AUR_INSTALL=1
exec /usr/lib/hyprwhspr/scripts/install-omarchy.sh "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/hyprwhspr-setup"

  # Ship **AUR-friendly** user units so users can enable them directly
  install -d "$pkgdir/usr/lib/systemd/user"
  install -m644 "$srcdir/$pkgname-$pkgver/packaging/systemd/hyprwhspr.service" \
    "$pkgdir/usr/lib/systemd/user/hyprwhspr.service"
  install -m644 "$srcdir/$pkgname-$pkgver/packaging/systemd/ydotoold.service" \
    "$pkgdir/usr/lib/systemd/user/ydotoold.service"

  # Docs & license
  install -d "$pkgdir/usr/share/doc/$pkgname" "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
