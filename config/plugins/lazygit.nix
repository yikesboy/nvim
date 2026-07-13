{ pkgs, ...}:
let
  keys = import ../lib/keys.nix;
  modes = import ../lib/modes.nix;

in {
  plugins.lazygit = {
    enable = true;

    lazyLoad.settings.cmd = [
      "LazyGit"
      "LazyGitConfig"
      "LazyGitCurrentFile"
      "LazyGitFilter"
      "LazyGitFilterCurrentFile"
    ];
  };

  keymaps = [
    {
      mode = modes.normal;
      key = keys.leader "g";
      action = keys.cmd "LazyGit";
      options = {
        silent = true;
        desc = "Open LazyGit";
      };
    }
  ];

  extraPackages = with pkgs; [
    git
    lazygit
  ];
}
