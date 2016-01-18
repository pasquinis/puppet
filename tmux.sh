#!/bin/sh

tmux start-server
tmux new-session -d -s dojo -n code
tmux new-window -tdojo:0 -n code
tmux split-window -tdojo:0 -p 50 -h
tmux new-window -tdojo:1 -n ssh

tmux send-keys -tdojo:0 'clear' C-m
tmux send-keys -tdojo:1 'clear' C-m

tmux select-window -tdojo:0
tmux attach-session -d -tdojo
