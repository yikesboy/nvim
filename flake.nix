{
  description = "My personal NixVim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixvim }: 
  let 
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    nvim = nixvim.legacyPackages.${system}.makeNixvimWithModule {
      inherit pkgs;
      module = import ./config;
    };
  in {
    packages.${system} = {
      default = nvim;
      neovim = nvim;
    };
  };
}
