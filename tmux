bind r source-file ~/.tmux.conf \; display "Config Reloaded!"

set -g status-utf8 on
set -sg escape-time 0
set -g prefix C-a

set-window-option -g mode-keys vi
# unbind p
# bind p paste-buffer
bind -t vi-copy 'v' begin-selection
bind -t vi-copy 'y' copy-selection

setw -g aggressive-resize on
set-window-option -g allow-rename off
set-option -g renumber-windows on

set-window-option -g window-status-fg colour100 #base0
set-window-option -g window-status-bg colour236
set-window-option -g window-status-attr dim

set-window-option -g window-status-current-fg colour100
set-window-option -g window-status-current-bg colour225
set-window-option -g window-status-current-attr dim #bright

bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

set -g base-index 1
setw -g pane-base-index 1
