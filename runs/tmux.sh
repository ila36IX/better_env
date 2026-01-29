#!/usr/bin/env bash
# Setup tmux
echo "[INFO] clone tmux plugin and copy my config file to home"

pushd dotfiles > /dev/null

TPM_DIR="$HOME/.tmux/plugins/tpm"
# Install plugin manger
mkdir -p "$TPM_DIR"

if [ ! -d "$TPM_DIR/.git" ]; then
	git clone "https://github.com/tmux-plugins/tpm" "$TPM_DIR"
fi
cp -f ".tmux.conf" "$HOME"
tmux source "$HOME/.tmux.conf"

popd > /dev/null
