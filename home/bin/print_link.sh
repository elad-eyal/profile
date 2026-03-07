#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <url> [display message...]"
    exit 1
fi


if [ $# -eq 1 ]; then
    $0 "$1" "$1"
    exit $?
fi


URL="$1"
MESSAGE="${@:2}"

# Using \e for the escape character:
# \e]8;; -> Start OSC 8
# \e]8;; \e\\ -> End OSC 8
printf "\e]8;;%s\e\\%s\e]8;;\e\\%b" $URL $MESSAGE '\n'