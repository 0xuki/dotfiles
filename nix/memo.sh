nix run github:nix-community/home-manager -- switch --flake .#myHome -b backup --show-trace
sudo nixos-rebuild switch --flake .#myNixOS
