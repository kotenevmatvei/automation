#!/bin/bash

SESSION_NAME="ast"
SLEEP=0.5

tmux new-session -d -s "$SESSION_NAME" -n "nvim" -c "$HOME/projects/attachment-style/"
sleep $SLEEP 

tmux send-keys -t "$SESSION_NAME:nvim" "pyenv activate ast-venv" C-m
sleep $SLEEP
tmux send-keys -t "$SESSION_NAME:nvim" "nvim" C-m
sleep $SLEEP 

tmux new-window -t "$SESSION_NAME" -n "database"
sleep $SLEEP 
tmux send-keys -t "$SESSION_NAME:database" "sudo systemctl start docker" C-m
sleep $SLEEP 
tmux send-keys -t "$SESSION_NAME:database" "docker start ast-db" C-m


tmux new-window -t "$SESSION_NAME" -n "run_app" -c "$HOME/projects/attachment-style/attachment_style/"
sleep $SLEEP 
tmux send-keys -t "$SESSION_NAME:run_app" "pyenv activate ast-venv" C-m
sleep $SLEEP 
tmux send-keys -t "$SESSION_NAME:run_app" "python app.py" C-m
sleep $SLEEP 

tmux new-window -t "$SESSION_NAME" -n "bash" -c "$HOME/projects/attachment-style/attachment_style/"
sleep $SLEEP 

tmux attach-session -t "$SESSION_NAME"
