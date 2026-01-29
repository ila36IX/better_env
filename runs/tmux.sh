#!/usr/bin/env bash
# Setup tmux

pushd dotfiles > /dev/null

# Install plugin manger
mkdir -p "$HOME/.tmux/plugins/tpm"
git clone "https://github.com/tmux-plugins/tpm" "$HOME/.tmux/plugins/tpm"
cp -f ".tmux.conf" "$HOME"
tmux source "$HOME/.tmux.conf"

popd > /dev/null
