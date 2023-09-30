#!/usr/bin/env bash

cd
sudo apt-get update
sudo apt autoremove -y
sudo apt-get upgrade -y

[ -d "pimpmykali"] && rm -rf "pimpmykali"
git clone git clone https://github.com/Dewalt-arch/pimpmykali
cd pimpmykali && sudo ./pimpmykali.sh

cat <<_EOD__ > ~/.tmux.conf
set -g prefix C-a
bind C-a send-prefix
unbind C-b
set -g history-limit 100000
set -g allow-rename off
set -g @plugin 'tmux-plugin/tmux-plugins/tmux-logging'
set -g status-bg colour27
set -g status-fg white
bind-key j command-prompt -p "Join pane from:" "join pane -s '%%'"
bind-key s command-prompt -p "Send pane to:" "join pane -t '%%'"
set-window-option -g mode-keys vim
run-shell /opt/tmux-logging/logging.tmux
__EOD__


[ ! -d '/opt/tmux-logging/' ] && sudo git clone https://github.com/tmux-plugins/tmux-logging /opt/tmux-logging/
echo 'tmux new -s SessionID'
echo 'C-a i'
echo 'C-a %'

echo 'tmux source-file ~/.tmux.conf'
echo 'C-a B' # Starts logging

