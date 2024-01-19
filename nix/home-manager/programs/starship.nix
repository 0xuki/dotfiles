{ pkgs, ... }: {
  programs.starship = 
    let
      flavour = "macchiato"; # One of `latte`, `frappe`, `macchiato`, or `mocha`
    in
    {
      enable = true;
      enableZshIntegration = true;
      settings = {
        # 一般的な設定
        scan_timeout = 10;
        add_newline = false;
        line_break.disabled = false;
        right_format = "$time";
        character = {
          success_symbol = "[](#cbced3)";
          error_symbol = "[](#dd6777)";
          vicmd_symbol = "[](#ecd3a0)";
          format = "$symbol[λ](bold #b4befe) ";
        };
        palette = "catppuccin_${flavour}";
        git_commit = { commit_hash_length = 5; };

        # プログラミング言語とツールのシンボル
        lua.symbol = "[](blue) ";
        python.symbol = "[](blue) ";
        nix_shell.symbol = "[](blue) ";
        rust.symbol = "[](red) ";
        dart.symbol = "[](blue) ";
        nodejs.version_format = "v$raw(blue)";
        package.symbol = "📦  ";

        # ユーザー名とホスト名の設定
        username = {
          show_always = false;
          style_user = "bold bg:none fg:#7aa2f7";
          format = "[$user]($style)";
        };
        hostname = {
          disabled = true;
          ssh_only = false;
          style = "bold bg:none fg:#CDD6F4";
          format = "@[$hostname]($style) ";
        };

        # ディレクトリの設定
        directory = {
          read_only = " ";
          truncation_length = 3;
          truncation_symbol = "./";
          style = "bold bg:none fg:#b4befe";
        };

        # 時間の設定
        time = {
          disabled = true;
          use_12hr = true;
          time_range = "-";
          time_format = "%R";
          utc_time_offset = "local";
          format = "[ $time 󰥔]($style) ";
          style = "bold #393939";
        };
      }
      // builtins.fromTOML (builtins.readFile (pkgs.fetchFromGitHub
        {
          owner = "catppuccin";
          repo = "starship";
          rev = "HEAD";
          sha256 = "sha256-nsRuxQFKbQkyEI4TXgvAjcroVdG+heKX5Pauq/4Ota0=";
        }
      + /palettes/${flavour}.toml));
    };
}

