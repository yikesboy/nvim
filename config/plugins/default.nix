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
    ./lazygit.nix
    ./linting.nix
    ./mini.nix
    ./lsp
  ];

  # provides runtime lazy loading for plugins
  plugins.lz-n.enable = true;
}