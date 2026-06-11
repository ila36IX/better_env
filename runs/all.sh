#!/usr/bin/env bash

echo "[INFO] Running all the scripts"

# Execute all the executables inside runs directory
for RUN in $(find ./runs -maxdepth 1 -mindepth 1 -executable -type f); do
	echo "[EXECUTE] $RUN"
	$RUN
done 
