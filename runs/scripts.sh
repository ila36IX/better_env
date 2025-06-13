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

execute mkdir -p "$HOME/scripts"
execute cp -rf ./scripts/* "$HOME/scripts/"

append_to_file () {
	content=$1
	file_path=$2
	echo $1 >> $2
}

SHELLRC_FILE="$HOME/.$(basename $SHELL)rc"
LINE='PATH=$PATH:$HOME/scripts'

if ! grep -q "^$LINE" $SHELLRC_FILE; then
	execute append_to_file $LINE $SHELLRC_FILE
fi

