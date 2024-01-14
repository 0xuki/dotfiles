{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master"; # ハードウェア設定のコレクション
    xremap.url = "github:xremap/nix-flake"; # キー設定ツール
    home-manager = {

      url = "github:nix-community/home-manager";

      inputs.nixpkgs.follows = "nixpkgs";

    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprpicker.url = "github:hyprwm/hyprpicker";
    hypr-contrib.url = "github:hyprwm/contrib";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = inputs: {
    nixosConfigurations = {
      myNixOS = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
        ];
	      specialArgs = {

           inherit inputs; # `inputs = inputs;`と等しい

        };
      };
    };
    homeConfigurations = {

       myHome = inputs.home-manager.lib.homeManagerConfiguration {

         pkgs = import inputs.nixpkgs {

           system = "x86_64-linux";

           config.allowUnfree = true; # プロプライエタリなパッケージを許可
           overlays = [(import inputs.rust-overlay)];

         };

         extraSpecialArgs = {

           inherit inputs;

         };

         modules = [

           ./home-manager/home.nix

         ];

       };
       nixConfig = {
          extra-substituters = [
            "https://nix-community.cachix.org"
            "https://hyprland.cachix.org"
          ];
          extra-trusted-public-keys = [
            "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
            "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
          ];
       };
    };
  };
}
