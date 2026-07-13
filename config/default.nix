{ pkgs, ... }:
{
  imports = [
    ./autocmds.nix
    ./keymaps.nix
    ./options.nix
    ./plugins
  ];

  extraPackages = with pkgs; [ ];
}
