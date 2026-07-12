{ pkgs, ... }:
{
    imports = [
        ./autocmds.nix
    ];

    extraPackages = with pkgs; [];
}
