# shell
set-option -g default-shell /usr/local/bin/fish

# bind useless q key
unbind C-b
set -g prefix C-t

# reload
bind r source-file ~/.tmux.conf

# set title me and my ip
set -g set-titles on
set -g set-titles-string '#S #I'
setw -g automatic-rename

# Status bar customization
set -g status-utf8 on
set -g status-bg black
set -g status-fg white

# change movement
bind -n M-j select-pane -D
bind -n M-k select-pane -U
bind -n M-h select-pane -L
bind -n M-l select-pane -R

# split window
bind v split-window -h
bind s split-window

# copy paste
setw -g mode-keys vi
bind -t vi-copy 'v' begin-selection
bind -t vi-copy 'y' copy-selection
