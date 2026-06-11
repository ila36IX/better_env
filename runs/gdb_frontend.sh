#!/usr/bin/env bash

echo "[INFO]: Install gf2 (debugger frontend)"

git clone https://github.com/nakst/gf.git /tmp/tmp_gf

pushd /tmp/tmp_gf > /dev/null

./build.sh

cp ./gf2 "$HOME/scripts"

popd > /dev/null

pushd dotfiles > /dev/null

cp -rf gf2_config.ini "$HOME/.config"

popd > /dev/null
