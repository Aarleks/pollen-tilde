#!/bin/sh

# stuff and things
set -e

if tmux has-session -t pollen-tilde 2> /dev/null; then
    tmux attach -t pollen-tilde
    exit
fi

# set up a new session

tmux new-session -d -s pollen-tilde -n main

# 1. Main window: vim, lf, git status
tmux send-keys -t pollen-tilde:main "nvim -c Files" Enter
tmux split-window -t pollen-tilde:main -h -c "$PWD"
tmux send-keys -t pollen-tilde:main.right "git pull" Enter
tmux send-keys -t pollen-tilde:main.right "git status" Enter

# Start it up!
tmux attach -t pollen-tilde:main.left
