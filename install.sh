#!/bin/bash

set -e

APP_NAME="WebAD"

INSTALL_DIR="$HOME/.local/bin/webad"
APPIMAGE_PATH="$INSTALL_DIR/WebAD.AppImage"
APPIMAGE_URL="https://github.com/Ad6211/WebAD/releases/download/v1.0/WebAD-x86_64.AppImage"

echo "🚀 Installing $APP_NAME..."

mkdir -p "$INSTALL_DIR"

echo "⬇️ Downloading AppImage..."

curl -L --fail --progress-bar \
  -o "$APPIMAGE_PATH" \
  "$APPIMAGE_URL"

chmod +x "$APPIMAGE_PATH"

echo "✅ Download finished"
echo "📦 Installed at: $APPIMAGE_PATH"
