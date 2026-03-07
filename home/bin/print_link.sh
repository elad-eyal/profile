#!/bin/bash

# 1. Check if started with 0 parameters
if [ $# -eq 0 ]; then
    echo "Usage: $0 <url> [display message...]"
    exit 1
fi

# 2. If started with exactly 1 parameter, call itself with $1 as both URL and text
if [ $# -eq 1 ]; then
    $0 "$1" "$1"
    exit $?
fi

# 3. If started with more than 1 parameter
# $1 is the address (URL)
# ${@:2} captures all parameters from the second one onwards as the display message
URL="$1"
MESSAGE="${@:2}"

# Using \e for the escape character:
# \e]8;; -> Start OSC 8
# \e]8;; \e\\ -> End OSC 8
echo -e "\e]8;;${URL}\e\\${MESSAGE}\e]8;;\e\\"
