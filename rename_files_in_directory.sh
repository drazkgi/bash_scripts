#!/bin/bash

#
# Rename all files in a directory
# Convert upper case to lower case and replace all spaces with underscores
#

IFS=$'\n'
_DIRECTORY=${1:?A path to a dictionary is not defined}
_FILES_LIST=$(ls -A1 ${_DIRECTORY})

format_file_name () {
    local formated_file_name=$(echo ${1} | tr [:upper:] [:lower:] | tr ' ' '_' | tr -s '_')
    echo "${formated_file_name}"
}

rename_file () {
        mv "${_DIRECTORY}${1}" "${_DIRECTORY}${2}"
}

main () {
    for file_name in ${_FILES_LIST}; do
            formated_file_name="$(format_file_name ${file_name})"
            rename_file ${file_name} ${formated_file_name}
    done
}

main
