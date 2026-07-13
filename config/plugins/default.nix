{
  imports = [
    ./autopairs.nix
    ./completions.nix
    ./colorscheme.nix
    ./comment.nix
    ./formatting.nix
    ./cord.nix
    ./gitsigns.nix
    ./indent-blankline.nix
    ./debugging
  ];

  # provides runtime lazy loading for plugins
  plugins.lz-n.enable = true;
}