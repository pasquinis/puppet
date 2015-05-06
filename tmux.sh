#!/bin/sh

SESSION_NAME='dev'
tmux start-server
tmux new-session -d -s $SESSION_NAME -n code
tmux new-window -t$SESSION_NAME:0 -n code
tmux send-keys -t$SESSION_NAME:0 'clear' C-m
tmux split-window -t$SESSION_NAME:0 -p 50 -h
tmux new-window -t$SESSION_NAME:1 -n ssh


tmux select-window -t$SESSION_NAME:0
tmux attach-session -d -t$SESSION_NAME
