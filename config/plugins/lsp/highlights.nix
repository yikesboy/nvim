{
  autoGroups = {
    lsp-highlight.clear = false;
    lsp-highlight-attach.clear = true;
  };

  autoCmd = [
    {
      event = [ "LspAttach" ];
      group = "lsp-highlight-attach";
      desc = "Enable LSP reference highlighting";

      callback.__raw = ''
        function(event)
          local client = vim.lsp.get_client_by_id(event.data.client_id)

          if not client or not client:supports_method(
            vim.lsp.protocol.Methods.textDocument_documentHighlight,
            event.buf
          ) then
            return
          end

          vim.api.nvim_create_autocmd(
            { "CursorHold", "CursorHoldI" },
            {
              buffer = event.buf,
              group = "lsp-highlight",
              callback = vim.lsp.buf.document_highlight,
            }
          )

          vim.api.nvim_create_autocmd(
            { "CursorMoved", "CursorMovedI" },
            {
              buffer = event.buf,
              group = "lsp-highlight",
              callback = vim.lsp.buf.clear_references,
            }
          )
        end
      '';
    }

    {
      event = [ "LspDetach" ];
      group = "lsp-highlight-attach";
      desc = "Clear LSP reference highlighting";

      callback.__raw = ''
        function(event)
          vim.lsp.buf.clear_references()

          vim.api.nvim_clear_autocmds({
            group = "lsp-highlight",
            buffer = event.buf,
          })
        end
      '';
    }
  ];
}