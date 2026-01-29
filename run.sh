#!/usr/bin/env bash

# Change directory to where the script is located
SCRIPT_PATH=$(dirname "${BASH_SOURCE[0]}")

# Change directory to the script path
pushd $SCRIPT_PATH >/dev/null

# Execute all the executables inside runs directory
for RUN in $(find ./runs -maxdepth 1 -mindepth 1 -executable -type f); do
	echo "[EXECUTE] $RUN"
	$RUN
done 

# Add udate_dev alies to shellrc(bashrc or zshrc)
LINE="alias update_dev=$(pwd)/run.sh"
SHELLRC_FILE="$HOME/.$(basename $SHELL)rc"
if ! grep -q "^$LINE" $SHELLRC_FILE; then
	echo "$LINE" >> "$SHELLRC_FILE"
fi

popd >/dev/null
