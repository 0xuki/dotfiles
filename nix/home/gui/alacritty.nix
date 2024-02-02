{ config, pkgs, ... }:

let
  alacrittyConfig = pkgs.writeTextFile {
    name = "alacritty.yml";
    text = ''
      env:
        TERM: screen-256color

      window:
        opacity: 1.0
        dimensions:
          columns: 0
          lines: 0
        padding:
          x: 2
          y: 2
        decorations: full

      draw_bold_text_with_bright_colors: true

      font:
        normal:
          family: "Fira Code"
          style: Retina
        bold:
          family: "Fira Code"
          style: Bold
        italic:
          family: "Fira Code"
        size: 8.0

      debug.render_timer: false

      colors:
        primary:
          background: '0x181818'
          foreground: '0xd8d8d8'
        cursor:
          text: '0x181818'
          cursor: '0xd8d8d8'
          style: Block
          unfocused_hollow: true
        normal:
          black:   '0x181818'
          red:     '0xab4642'
          green:   '0xa1b56c'
          yellow:  '0xf7ca88'
          blue:    '0x7cafc2'
          magenta: '0xba8baf'
          cyan:    '0x86c1b9'
          white:   '0xd8d8d8'
        bright:
          black:   '0x585858'
          red:     '0xab4642'
          green:   '0xa1b56c'
          yellow:  '0xf7ca88'
          blue:    '0x7cafc2'
          magenta: '0xba8baf'
          cyan:    '0x86c1b9'
          white:   '0xd8d8d8'

      bell:
        animation: EaseOutExpo
        duration: 0

      mouse_bindings:
        - { mouse: Middle, action: PasteSelection }

      mouse:
        double_click: { threshold: 300 }
        triple_click: { threshold: 300 }
        faux_scrolling_lines: 1
        hide_when_typing: true

      selection:
        semantic_escape_chars: ",?`|:\"' ()[]{}<>"
        save_to_clipboard: true

      window.dynamic_title: true

      live_config_reload: true

      shell:
        program: ${pkgs.zsh}/bin/zsh
        args:
          - --login
    '';
  };
in {
  home.packages = with pkgs; [
    alacritty
  ];

  # Alacrittyの設定ファイルをユーザーのホームディレクトリに配置
  xdg.configFile."alacritty/alacritty.yml".source = alacrittyConfig;
}

