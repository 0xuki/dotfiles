{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master"; # ハードウェア設定のコレクション
    xremap.url = "github:xremap/nix-flake"; # キー設定ツール
    home-manager = {

     url = "github:nix-community/home-manager";

     inputs.nixpkgs.follows = "nixpkgs";

   };
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

         ./home.nix

       ];

     };

   };
  };
}
