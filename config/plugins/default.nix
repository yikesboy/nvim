{
  imports = [
    ./autopairs.nix
    ./completions.nix
    ./colorscheme.nix
  ];

  # provides runtime lazy loading for plugins
  plugins.lz-n.enable = true;
}