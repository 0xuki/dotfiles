{pkgs, ...}: {
  programs.git = {
    enable = true;
    userName = "root309";
    userEmail = "choco00101x@gmail.com";
  };

  # GitHub CLI
  programs.gh = {
    enable = true;
    extensions = with pkgs; [gh-markdown-preview];
    settings = {
      editor = "nvim";
    };
  };
}
