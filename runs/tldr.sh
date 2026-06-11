#!/usr/bin/env bash

echo "[INFO] Downloading tldr binary"

mkdir -p "$HOME/scripts"

TARGET_PATH="$HOME/scripts/tldr"

# Download the file using curl
# -S: Show error message if it fails
# -L: Follow HTTP redirects
# -o: Specify the output file path
if curl -SL -o "$TARGET_PATH" "https://github.com/tealdeer-rs/tealdeer/releases/download/v1.8.1/tealdeer-linux-x86_64-musl"; then
    chmod +x "$TARGET_PATH"
    "$HOME/scripts/tldr" --update
fi


