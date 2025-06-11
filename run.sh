#!/usr/bin/env bash

# Change directory to where the script is located
SCRIPT_PATH=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
# Run the executable file in your runs directory
RUNS=$(find ./runs -maxdepth 1 -mindepth 1 -executable -type f)


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
		# Run the install script with dry command
		"${@}" --dry
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

for RUN in ${RUNS}; do
	if echo "${RUN}" | grep -qv "${FILTER}"; then
		continue
	fi
	execute "$RUN"
done 

# Add alies of this script
SHELLRC_FILE="$HOME/.$(basename $SHELL)rc"
LINE="alias update_dev=$SCRIPT_PATH/run.sh"

append_to_file () {
	content=$1
	file_path=$2
	echo "$1" >> "$2"
}

if ! grep -q "^$LINE" $SHELLRC_FILE; then
	execute append_to_file "$LINE" "$SHELLRC_FILE"
fi
