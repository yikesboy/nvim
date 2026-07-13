let
  keys = import ../../lib/keys.nix;
  modes = import ../../lib/modes.nix;
in
{
  keymapsOnEvents.LspAttach = [
    {
      mode = modes.normal;
      key = keys.leader "th";
      action = keys.cmd "lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }), { bufnr = 0 })";
      options.desc = "LSP: [T]oggle inlay [H]ints";
    }
  ];
}
