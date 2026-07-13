{
  imports = [
    ./keymaps.nix
    ./diagnostics.nix
    ./highlights.nix
    ./inlay-hints.nix
    ./servers
  ];

  plugins = {
    lsp.enable = true;
    telescope.enable = true;
    fidget = {
      enable = true;

      settings.notification = {
        line_margin = 0;

        window = {
          normal_hl = "Normal";
          winblend = 0;
        };
      };
    };
  };
}
