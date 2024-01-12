{ config, pkgs, ... }:

let
  tmuxConfig = pkgs.writeTextFile {
    name = "tmux.conf";
    text = ''
      set -g prefix C-a
      setw -g mouse on
      set -g history-limit 30000
      set -g status-keys vi
      set -g mode-keys vi
      bind P paste-buffer
      bind-key    -T copy-mode    C-w               send-keys -X copy-pipe-and-cancel "xclip -selection primary -in -f | xclip -selection clipboard -in"
      bind-key    -T copy-mode    MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "tmux-save-buffer - | xclip -selection primary -in -f | xclip -selection clipboard -in"
      bind-key    -T copy-mode    M-w               send-keys -X copy-pipe-and-cancel "xclip -selection primary -in -f | xclip -selection clipboard -in"
      bind-key    -T copy-mode-vi Enter             send-keys -X copy-pipe-and-cancel "xclip -selection primary -in -f | xclip -selection clipboard -in"
      bind-key    -T copy-mode-vi v                 send-keys -X begin-selection
      bind-key    -T copy-mode-vi y                 send-keys -X copy-pipe-and-cancel "xclip -selection primary -in -f | xclip -selection clipboard -in"
    '';
  };
in {
  home.packages = with pkgs; [
    tmux
  ];

  # Tmuxの設定ファイルをユーザーのホームディレクトリに配置
  xdg.configFile."tmux/tmux.conf".source = tmuxConfig;
}

