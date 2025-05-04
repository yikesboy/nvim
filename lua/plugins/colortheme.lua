return {
  'catppuccin/nvim',
  name = 'catppuccin-latte',
  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'catppuccin-mocha'
  end,
}
