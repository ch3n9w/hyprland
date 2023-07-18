#!/bin/bash

if tmux has-session; then
  tmux attach -t 0
else
  tmux -u
fi
