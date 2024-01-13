{pkgs, ...}: {
  home.packages = with pkgs; [
    gcc
    deno
    nodejs-slim # npmのないNode.js単体
    nodePackages.pnpm
    nodePackages.vercel
    nodePackages.wrangler
    python312
    supabase-cli
    rustup
  ];
}
