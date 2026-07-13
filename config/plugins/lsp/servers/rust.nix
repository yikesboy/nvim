{
  plugins.lsp.servers.rust_analyzer = {
    enable = true;

    # these should be provided via the project devShell
    installCargo = false;
    installRustc = false;

    settings = {
      check = {
        command = "clippy";
      };
    };
  };
}