let
  keys = import ../../lib/keys.nix;
  modes = import ../../lib/modes.nix;

  telescope = command: keys.cmd "Telescope ${command}";
  lua = command: keys.cmd "lua ${command}";
in
{
  keymapsOnEvents.LspAttach = [
    {
      mode = modes.normal;
      key = keys.leader "ra";
      action = lua "vim.lsp.buf.rename()";
      options.desc = "LSP: [R]en[a]me symbol";
    }

    {
      mode = [
        modes.normal
        modes.visual
      ];
      key = keys.leader "ca";
      action = lua "vim.lsp.buf.code_action()";
      options.desc = "LSP: [C]ode [A]ction";
    }

    {
      mode = modes.normal;
      key = "gD";
      action = lua "vim.lsp.buf.declaration()";
      options.desc = "LSP: [G]oto [D]eclaration";
    }

    {
      mode = modes.normal;
      key = "gr";
      action = telescope "lsp_references";
      options.desc = "LSP: [G]oto [R]eferences";
    }

    {
      mode = modes.normal;
      key = "gi";
      action = telescope "lsp_implementations";
      options.desc = "LSP: [G]oto [I]mplementation";
    }

    {
      mode = modes.normal;
      key = "gd";
      action = telescope "lsp_definitions";
      options.desc = "LSP: [G]oto [D]efinition";
    }

    {
      mode = modes.normal;
      key = "gO";
      action = telescope "lsp_document_symbols";
      options.desc = "LSP: [O]pen document symbols";
    }

    {
      mode = modes.normal;
      key = "gW";
      action = telescope "lsp_dynamic_workspace_symbols";
      options.desc = "LSP: Open workspace symbols";
    }

    {
      mode = modes.normal;
      key = keys.leader "D";
      action = telescope "lsp_type_definitions";
      options.desc = "LSP: [G]oto [T]ype definition";
    }
  ];
}
