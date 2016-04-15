# shell
set-option -g default-shell /usr/local/bin/fish

#crucial, super annoying delay behavior otherwise
set -sg escape-time 0 

# color
set -g default-terminal "screen-256color"

# command key
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

# panel
bind -n M-j select-pane -D
bind -n M-k select-pane -U
bind -n M-h select-pane -L
bind -n M-l select-pane -R
bind x kill-pane

# windows
bind v split-window -h
bind s split-window
bind k kill-window

# copy paste
setw -g mode-keys vi
bind -t vi-copy 'v' begin-selection
bind -t vi-copy 'y' copy-selection
