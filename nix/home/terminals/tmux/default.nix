{ config, pkgs, ... }:

let
  tmuxConfig = pkgs.writeTextFile {
    name = ".tmux.conf";
    text = ''
      # Terminal colors
      set -g default-terminal "tmux-256color"
      set -as terminal-features ",xterm-256color:RGB"

      set -sg escape-time 50
      # vim-like pane switching
      bind -r k select-pane -U 
      bind -r j select-pane -D 
      bind -r h select-pane -L 
      bind -r l select-pane -R 

      # Make copy mode keystrokes vi-like.
      set-window-option -g mode-keys vi

      # Allow mouse wheel to scroll instead of history
      set -g mouse on
      set -g terminal-overrides 'xterm*:smcup@:rmcup@'

      # When copying, also transfer to Windows clipboard (yum install -y xsel)
      bind-key -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel "xsel -bi"

      # Change Prefix (Ctrl-b) to Ctrl-j
      unbind-key C-b
      set-option -g prefix C-j
      bind-key C-S-j send-prefix

      # Moving window
      bind-key -n C-S-Left swap-window -t -1 \; previous-window
      bind-key -n C-S-Right swap-window -t +1 \; next-window

      # Resizing pane
      bind -r C-k resize-pane -U 5
      bind -r C-j resize-pane -D 5
      bind -r C-h resize-pane -L 5
      bind -r C-l resize-pane -R 5

      ## catppuccin config
      set -g @catppuccin_directory_color "blue"
      set -g @catppuccin_window_right_separator "█ "
      set -g @catppuccin_window_number_position "right"
      set -g @catppuccin_window_middle_separator " | "
      set -g @catppuccin_window_left_separator "█"

      set -g @catppuccin_window_default_fill "all"

      set -g @catppuccin_window_current_fill "all"

      set -g @catppuccin_status_modules_right "application session user host date_time"
      set -g @catppuccin_status_left_separator "█"
      set -g @catppuccin_status_right_separator "█"

      set -g @catppuccin_date_time_text "%Y-%m-%d %H:%M:%S"      

      # List of plugins
      set -g @plugin 'tmux-plugins/tpm'
      set -g @plugin 'tmux-plugins/tmux-sensible'
      set -g @plugin 'tmux-plugins/tmux-resurrect'
      set -g @plugin 'tmux-plugins/tmux-continuum'
      #set -g @plugin "arcticicestudio/nord-tmux"
      set -g @plugin 'catppuccin/tmux'
      set -g @catppuccin_flavour 'latte' 
      # Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
      run '~/.tmux/plugins/tpm/tpm'
    '';
  };
in {
  home.packages = with pkgs; [
    tmux
  ];

  # Tmuxの設定ファイルをユーザーのホームディレクトリに配置
  home.file.".tmux.conf".source = tmuxConfig;
}

