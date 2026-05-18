#!/bin/bash

set -e

APP_NAME="WebAD"
INSTALL_DIR="$HOME/.local/bin/webad"
APPIMAGE_PATH="$INSTALL_DIR/WebAD.AppImage"
DESKTOP_FILE="$HOME/.local/share/applications/webad.desktop"
ICON_PATH="$HOME/.local/share/icons/webad.png"

REPO="https://github.com/Ad6211/WebAD"
APPIMAGE_URL="https://github.com/Ad6211/WebAD/releases/latest/download/WebAD.AppImage"
ICON_URL="https://raw.githubusercontent.com/Ad6211/WebAD/main/icon.png"

echo "🚀 Installing $APP_NAME..."

# 1. Create folders
mkdir -p "$INSTALL_DIR"
mkdir -p "$HOME/.local/share/applications"
mkdir -p "$HOME/.local/share/icons"

# 2. Download AppImage
echo "⬇️ Downloading AppImage..."
wget -q --show-progress -O "$APPIMAGE_PATH" "$APPIMAGE_URL"

# 3. Make executable
chmod +x "$APPIMAGE_PATH"

# 4. Download icon
echo "🎨 Downloading icon..."
wget -q -O "$ICON_PATH" "$ICON_URL"

# 5. Create .desktop file (menu integration)
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

# 6. Update desktop database (safe ignore if missing)
update-desktop-database "$HOME/.local/share/applications" >/dev/null 2>&1 || true

echo "✅ Installation complete!"
echo "👉 Launch WebAD from your application menu (Internet category)"
