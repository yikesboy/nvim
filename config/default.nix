{ pkgs, ... }:
{
    imports = [
        ./autocmds.nix
        ./keymaps.nix
        ./options.nix
    ];

    extraPackages = with pkgs; [];
}
