# Maintainer: goodroot <hyprwhspr@goodroot.ca>

pkgname=hyprwhspr
pkgver=1.11.2
pkgrel=1
pkgdesc="Native Whisper speech-to-text for Arch/Omarchy with Waybar integration"
arch=('x86_64')
url="https://github.com/goodroot/hyprwhspr"
license=('MIT')
makedepends=('python-setuptools')
depends=(
  'python'
  'python-pip'
  'python-sounddevice'
  'python-numpy'
  'python-scipy'
  'python-evdev'
  'python-pyperclip'
  'python-requests'
  'python-psutil'
  'python-rich'
  'ydotool'
  'pipewire' 'pipewire-alsa' 'pipewire-pulse'
)

install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/goodroot/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('25fb3fe9595745ddc5b2af96447ca85d94bff1df62b2b43d1733a6942067be43')

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
    exec python /usr/lib/hyprwhspr/lib/cli.py "$@"
else
    # Run the main application
    export HYPRWHSPR_ROOT="/usr/lib/hyprwhspr"
    export PYTHONPATH="/usr/lib/hyprwhspr/lib:$PYTHONPATH"
    exec python /usr/lib/hyprwhspr/lib/main.py "$@"
fi
EOF
  chmod 755 "$pkgdir/usr/bin/$pkgname"

  # Docs & license
  install -d "$pkgdir/usr/share/doc/$pkgname" "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
