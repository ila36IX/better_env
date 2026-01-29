#!/usr/bin/env bash
# Copy custom executabes into ~/scripts

mkdir -p "$HOME/scripts"
cp -rf ./scripts/* "$HOME/scripts/"

# Add ~/scripts into PATH by changing bashrc or zshrc...
SHELLRC_FILE="$HOME/.$(basename $SHELL)rc"
LINE='PATH=$PATH:$HOME/scripts'
if ! grep -q "^$LINE" $SHELLRC_FILE; then
	echo $LINE >> $SHELLRC_FILE
fi
