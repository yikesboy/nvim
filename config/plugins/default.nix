{
  imports = [
    ./autopairs.nix
    ./completions.nix
  ];

  # provides runtime lazy loading for plugins
  plugins.lz-n.enable = true;
}