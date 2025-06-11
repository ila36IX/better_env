#!/usr/bin/env bash

print_error() {
	printf "Error: %s\n" "${*}" 1>&2
}

log () {
	if [[ "${DRY}" == "1" ]]; then
		echo "[DRY_RUN]: ${@}"
	else
		echo "[EXECUTE]: ${@}"
	fi
}

execute () {
	log $@
	if [[ "${DRY}" == "1" ]]; then
		return
	fi
	"${@}" # Run the command
}


while [[ ${#} > 0 ]]; do
	if [[ "${1}" == "--dry" ]]; then
		DRY="1"
	else
		FILTER="${1}"
	fi
	shift
done

pushd dotfiles > /dev/null
execute cp ".tmux.conf" "$HOME"
execute pwd
popd > /dev/null
