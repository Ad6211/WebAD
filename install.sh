#!/bin/bash

set -e

APP_NAME="WebAD"
INSTALL_DIR="$HOME/.local/bin/webad"
APPIMAGE_PATH="$INSTALL_DIR/WebAD.AppImage"
DESKTOP_FILE="$HOME/.local/share/applications/webad.desktop"
ICON_PATH="$HOME/.local/share/icons/webad.png"

APPIMAGE_URL="https://github.com/Ad6211/WebAD/releases/download/v1.0/WebAD-x86_64.AppImage"
ICON_URL="https://raw.githubusercontent.com/Ad6211/WebAD/main/icon.png"

echo "🚀 Installing $APP_NAME..."

# folders
mkdir -p "$INSTALL_DIR"
mkdir -p "$HOME/.local/share/applications"
mkdir -p "$HOME/.local/share/icons"

# download appimage (FIX IMPORTANT)
echo "⬇️ Downloading AppImage..."
curl -L --fail --progress-bar -o "$APPIMAGE_PATH" "$APPIMAGE_URL"

# permissions
chmod +x "$APPIMAGE_PATH"

# icon
echo "🎨 Downloading icon..."
curl -L --fail --progress-bar -o "$ICON_PATH" "$ICON_URL"

# desktop entry
echo "🖥️ Creating desktop entry..."
cat > "$DESKTOP_FILE" <<EOF
[Desktop Entry]
Name=WebAD Browser
Comment=Fast PyQt6 Web Browser
Exec=$APPIMAGE_PATH
Icon=$ICON_PATH
Terminal=false
Type=Application
Categories=Network;WebBrowser;
StartupNotify=true
EOF

# refresh menu (safe)
update-desktop-database "$HOME/.local/share/applications" >/dev/null 2>&1 || true

echo "✅ Installation complete!"
echo "👉 Open your menu (Internet category)"
