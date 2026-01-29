#!/usr/bin/env bash

echo "[INFO] Copy clangd and clang tidy confugerations to ~/config/clangd"

pushd dotfiles > /dev/null

cp -rf clangd/* "$HOME/.config/clangd/."

popd > /dev/null

