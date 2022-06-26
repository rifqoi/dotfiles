#!/usr/bin/env bash

VENV=`$CONDA_DEFAULT_ENV`
tmux set-option -g message-command-style 'bg=#282c34,fg=#bbc2cf' \; \
  set-option -g message-style 'bg=#282c34,fg=#bbc2cf' \; \
  set-option -g mode-style 'bg=#424856' \; \
  set-option -g status-justify left \; \
  set-option -g status-left ' #[fg=green]▶▶▶ #[fg=#bbc2cf]#{=28:session_name} • ' \; \
  set-option -g status-left-length 42 \; \
  set-option -g status-left-style 'bold' \; \
  set-option -g status-right '#{$VENV}' \; \
  set-option -g status-style 'bg=#1b2229,fg=#bbc2cf' \; \
  set-option -g window-status-current-format ' #I. #W ' \; \
  set-option -g window-status-current-style 'bg=#C8C093,fg=#282c34' \; \
  set-option -g window-status-format ' #I. #W ' \; \
  set-option -g window-status-separator ' ' \; \
  set-option -g window-status-style ''
