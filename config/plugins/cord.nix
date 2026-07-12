{
  plugins.cord = {
    enable = true;
    settings = {
      enabled = true;

      editor = {
        client = "neovim";
        tooltip = "The best editor in the world.";
      };

      text = {
        workspace = "";

        editing = "Editing a file";
        viewing = "Viewing a file";
        file_browser = "Browsing files";
        plugin_manager = "Managing plugins";
        lsp = "Configuring LSP";
        docs = "Reading documentation";
        vcs = "Working with version control";
        notes = "Taking notes";
        debug = "Debugging";
        test = "Testing";
        diagnostics = "Fixing problems";
        games = "Playing";
        terminal = "Running commands";
        dashboard = "Home";
      };

      # do not expose repo links
      buttons = false;
    };
  };
}