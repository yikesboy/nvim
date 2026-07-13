{
  plugins.lsp.servers.lua_ls = {
    enable = true;

    settings.Lua = {
      completion.callSnippet = "Replace";
      telemetry.enable = false;
    };
  };
}