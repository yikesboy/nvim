{
  imports = [
    ./autopairs.nix
    ./completions.nix
    ./colorscheme.nix
    ./comment.nix
    ./formatting.nix
    ./cord.nix
    ./gitsigns.nix
    ./img-clip.nix
    ./indent-blankline.nix
    ./lazygit.nix
    ./linting.nix
    ./mini.nix
    ./oil.nix
    ./snacks.nix
    ./telescope.nix
    ./todo-comments.nix
    ./treesitter.nix
    ./typst-preview.nix
    ./sleuth.nix
    ./which-key.nix
    ./lsp
  ];

  # provides runtime lazy loading for plugins
  plugins.lz-n.enable = true;
}
