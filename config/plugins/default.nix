{
  imports = [
    ./autopairs.nix
    ./completions.nix
    ./colorscheme.nix
    ./comment.nix
    ./formatting.nix
  ];

  # provides runtime lazy loading for plugins
  plugins.lz-n.enable = true;
}