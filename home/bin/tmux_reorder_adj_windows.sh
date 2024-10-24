#!/bin/bash

H=$(tmux display -p '#{pane_height}')
if [[ "$H" == "" ]]; then
    exit 1
fi

if [[ "$H" -le 9 ]]; then
    tmux move-pane -t {up-of} -h
else
    tmux move-pane -t {left-of} -v
fi
