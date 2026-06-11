#!/usr/bin/env bash
# Setup tmux
echo "[INFO] clone tmux plugin and copy my config file to home"

pushd dotfiles > /dev/null

mkdir -p "$HOME/.tmux/plugins"

# Install plugin manger
if [ ! -d "$HOME/.tmux/plugins/tpm/.git" ]; then
	git clone "https://github.com/tmux-plugins/tpm" "$HOME/.tmux/plugins/tpm"
fi
cp -f ".tmux.conf" "$HOME"
tmux source "$HOME/.tmux.conf"

popd > /dev/null
