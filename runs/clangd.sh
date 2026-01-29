#!/usr/bin/env bash
# clangd and clang tidy confugerations

pushd dotfiles > /dev/null

cp -rf clangd/* "$HOME/.config/clangd/."

popd > /dev/null

