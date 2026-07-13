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
        window = {
          normal_hl = "Normal";
          winblend = 0;
        };
      };
    };
  };
}
