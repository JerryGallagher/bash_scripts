#!/bin/bash

################################################################################
# Shell Script for file size and wordcount in files 
# The script takse a directory as an argument or uses the current directory
# it traverses the sbudirectoris and prints the file size and word count of
# a file. I am not proud of this it is the minimum to meet the requiremnts                                                                      #
# for the assignment                                                                         #
################################################################################

################################################################################
# Main program                                                                 #
################################################################################

# If the path is empty use the current path, else convert the relative path to absolute; 
[[ -z "${1}" ]] && WORKING_PATH="${PWD}" || cd "${1}" && WORKING_PATH="${PWD}"

printf "\n" "${WORKING_PATH}" 

for f in "${WORKING_PATH}"/*; do
  if [ -f "$f" ]; then
    SIZE="$(du -sh "${f}" | cut -f1)"
    echo "Processing $f file..."
    echo "File size: $SIZE"
    COUNT="$(wc -w "${f}" | cut -d' ' -f1)"
    echo "Word count: $COUNT"
  fi
done

