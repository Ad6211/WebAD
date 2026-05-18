APPIMAGE_PATH="$HOME/.local/bin/webad/WebAD.AppImage"

mkdir -p "$HOME/.local/bin/webad"

echo "⬇️ Downloading AppImage..."

curl -L --fail --progress-bar \
  -o "$APPIMAGE_PATH" \
  "https://github.com/Ad6211/WebAD/releases/download/v1.0/WebAD-x86_64.AppImage"
