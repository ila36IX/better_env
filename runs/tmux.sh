#!/usr/bin/env bash

print_error() {
	printf "Error: %s\n" "${*}" 1>&2
}

log () {
	curr_file=$(basename $0)
	if [[ "${DRY}" == "1" ]]; then
		echo "[DRY_RUN/$curr_file]: ${@}"
	else
		echo "[EXECUTE/$curr_file]: ${@}"
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
# Install plugin manger
execute git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
execute cp ".tmux.conf" "$HOME"
execute tmux source ~/.tmux.conf
popd > /dev/null
