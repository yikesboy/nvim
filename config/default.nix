{ pkgs, ... }:
{
    imports = [
        ./autocmds.nix
        ./keymaps.nix
    ];

    extraPackages = with pkgs; [];
}
