# Maintainer: goodroot <hyprwhspr@goodroot.ca>

pkgname=hyprwhspr
pkgver=1.8.1
pkgrel=1
pkgdesc="Native Whisper speech-to-text for Arch/Omarchy with Waybar integration"
arch=('x86_64')
url="https://github.com/goodroot/hyprwhspr"
license=('MIT')
depends=(
  'python'
  'python-sounddevice'
  'python-numpy'
  'python-scipy'
  'python-evdev'
  'python-pyperclip'
  'python-requests'
  'python-psutil'
  'python-rich'
  'ydotool'
  'pipewire' 'pipewire-alsa' 'pipewire-pulse' 'pipewire-jack'
)
optdepends=(
  'python-pywhispercpp-cpu: local whisper.cpp backend (CPU)'
  'python-pywhispercpp-cuda: local whisper.cpp backend (NVIDIA GPU)'
  'python-pywhispercpp-rocm: local whisper.cpp backend (AMD GPU)'
)
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/goodroot/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('60666ae8a3245ffd25b5e091a460ab07756951277e8032dbf6f33b3be530fab7')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  # nothing to build; user runs 'hyprwhspr setup' post-install
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Payload into /usr/lib keeps repo layout intact
  install -d "$pkgdir/usr/lib/$pkgname"
  cp -r lib bin config share README.md LICENSE requirements.txt "$pkgdir/usr/lib/$pkgname"
  # Note: scripts directory removed - functionality moved to CLI commands

  # Make sure main launcher is executable
  if [ -f "$pkgdir/usr/lib/$pkgname/bin/hyprwhspr" ]; then
    chmod 755 "$pkgdir/usr/lib/$pkgname/bin/hyprwhspr"
  fi

  # Install systemd user service
  install -Dm644 "config/systemd/hyprwhspr.service" \
    "$pkgdir/usr/lib/systemd/user/hyprwhspr.service"

  # Runtime launcher: supports both CLI commands and app execution
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/$pkgname" << 'EOF'
#!/usr/bin/env bash
# hyprwhspr launcher - routes CLI commands or runs application

# If first arg is -h/--help or a subcommand, route to CLI
if [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]] || [[ "$1" =~ ^(setup|config|waybar|systemd|status|model|validate)$ ]]; then
    export HYPRWHSPR_ROOT="/usr/lib/hyprwhspr"
    export PYTHONPATH="/usr/lib/hyprwhspr/lib:$PYTHONPATH"
    exec python3 /usr/lib/hyprwhspr/lib/cli.py "$@"
else
    # Run the main application
    export HYPRWHSPR_ROOT="/usr/lib/hyprwhspr"
    export PYTHONPATH="/usr/lib/hyprwhspr/lib:$PYTHONPATH"
    exec python3 /usr/lib/hyprwhspr/lib/main.py "$@"
fi
EOF
  chmod 755 "$pkgdir/usr/bin/$pkgname"

  # Docs & license
  install -d "$pkgdir/usr/share/doc/$pkgname" "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
