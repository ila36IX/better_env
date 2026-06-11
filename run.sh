#!/usr/bin/env bash

# Change directory to where the script is located
SCRIPT_PATH=$(dirname "${BASH_SOURCE[0]}")

# Change directory to the script path
pushd $SCRIPT_PATH >/dev/null

if [ $# -ne 1 ] || [ -z "$1" ]; then
    echo "Usage: $0 <all/script_name>" >&2
    echo "Available ones are:"
    ls -1 runs
    popd >/dev/null
    exit 1
fi

TARGET_SCRIPT="./runs/$1"

# Verify that the target script exists and is an executable file
if [ ! -f "$TARGET_SCRIPT" ] || [ ! -x "$TARGET_SCRIPT" ]; then
    echo "Error: Script '$1' not found or not executable in ./runs/" >&2
    echo "Available ones are:"
    ls -1 runs
    popd >/dev/null
    exit 1
fi

# Execute the script
"$TARGET_SCRIPT"

popd >/dev/null
