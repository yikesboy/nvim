return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      flavour = 'mocha',
    }

    vim.cmd.colorscheme 'catppuccin-mocha'

    for _, group in ipairs { 'Normal', 'NormalNC', 'NormalFloat', 'FloatBorder', 'SignColumn' } do
      vim.api.nvim_set_hl(0, group, { bg = 'NONE' })
    end
  end,
}
