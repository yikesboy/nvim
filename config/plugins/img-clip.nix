{ pkgs, ... }:
let
  keys = import ../lib/keys.nix;
  modes = import ../lib/modes.nix;
in
{
  plugins.img-clip = {
    enable = true;
    settings.default.relative_to_current_file = true;
  };

  keymaps = [
    {
      mode = modes.normal;
      key = keys.leader "p";
      action = keys.cmd "PasteImage";
      options = {
        silent = true;
        desc = "Paste image from system clipboard";
      };
    }
    {
      mode = [
        modes.normal
        modes.insert
      ];
      key = "<C-S-v>";
      action.__raw = ''
        function()
          if require("img-clip.clipboard").content_is_image() then
            require("img-clip").paste_image()
          end
        end
      '';
      options = {
        silent = true;
        desc = "Paste image from system clipboard";
      };
    }
  ];

  extraPackages = with pkgs; [
    wl-clipboard
  ];
}
