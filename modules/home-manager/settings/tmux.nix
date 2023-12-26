{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    extraConfig = ''
      unbind C-b
      set -g prefix C-u
      bind-key u last-window
      bind-key e send-prefix

      set -g default-terminal "tmux-256color"
      set -as terminal-overrides ',xterm*:Tc:sitm=\E[3m'
      set -sg terminal-overrides ",*:RGB"

      set -g history-limit 20000

      set -g renumber-windows on

      set -g base-index 1
      setw -g pane-base-index 1

      setw -g aggressive-resize on

      set -sg escape-time 0

      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R
      bind r source-file ~/.tmux.conf

      bind C-j resize-pane -D 3
      bind C-k resize-pane -U 3
      bind C-l resize-pane -R 3
      bind C-h resize-pane -L 3

      bind '"' split-window -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"

      setw -g mouse off

      setw -g mode-keys vi
      bind-key -T copy-mode-vi 'v' send -X begin-selection
      bind-key -T copy-mode-vi 'y' send -X copy-pipe-and-cancel "pbcopy"

      set -g @plugin 'tmux-plugins/tpm'
      set -g @plugin 'tmux-plugins/tmux-sensible'
      set -g @plugin 'catppuccin/tmux'

      run '/Users/guto/.tmux/plugins/tpm/tpm'
    '';
  };
}
