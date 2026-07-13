{ pkgs, ... }:
{
  plugins.lint = {
    enable = true;

    lintersByFt = {
      go = [ "golangcilint" ];
      python = [ "ruff" ];
      lua = [ "selene" ];
      yaml = [ "yamllint" ];
    };
  };

  autoCmd = [
    {
      event = [ "BufWritePost" ];
      desc = "Lint buffer after saving";

      callback.__raw = ''
        function()
          if vim.bo.modifiable then
            require("lint").try_lint()
          end
        end
      '';
    }
  ];

  extraPackages = with pkgs; [
    golangci-lint
    ruff
    selene
    yamllint
  ];
}