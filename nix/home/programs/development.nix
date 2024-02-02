{pkgs, ...}: {
  home.packages = with pkgs; [
    gcc
    deno
    nodejs
    nodePackages.pnpm
    nodePackages.vercel
    nodePackages.wrangler
    python312
    supabase-cli
    rustup
    go
  ];
}
