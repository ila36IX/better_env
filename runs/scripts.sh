#!/usr/bin/env bash
# Copy custom executabes into ~/scripts
echo "[INFO] Copy scripts files into ~/scripts and add it to PATH"

mkdir -p "$HOME/scripts"
cp -rf ./scripts/* "$HOME/scripts/"

# Add ~/scripts into PATH by changing bashrc or zshrc...
LINE='PATH=$PATH:$HOME/scripts'
echo "[TODO] Add this to you shellrc $LINE"
