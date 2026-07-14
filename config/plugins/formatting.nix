{ pkgs, ... }:
{
  plugins.conform-nvim = {
    enable = true;

    # Only load conform when formatting may be needed
    lazyLoad.settings = {
      event = [ "BufWritePre" ]; # before writing a buffer
      cmd = [ "ConformInfo" ]; # when running :ConformInfo
    };

    settings = {
      notify_on_error = false;

      format_on_save = {
        timeout_ms = 500;
        lsp_format = "fallback";
      };

      # which formatter for which filetype
      formatters_by_ft = {
        rust = [ "rustfmt" ];
        lua = [ "stylua" ];
        markdown = [ "prettier" ];
        nix = [ "nixfmt" ];

        # running in order
        python = [
          "ruff_organize_imports"
          "ruff_format"
        ];
      };
    };
  };

  extraPackages = with pkgs; [
    prettier
    rustfmt
    stylua
    nixfmt
    ruff
  ];
}
