let
  keys = import ../lib/keys.nix;
  modes = import ../lib/modes.nix;
in {
  plugins.which-key = {
    enable = true;
    autoLoad = true;

    settings = {
      delay = 0;
      icons.mappings = true;
      spec = [
        {
          __unkeyed-1 = keys.leader "s";
          group = "[S]earch";
        }

        {
          __unkeyed-1 = keys.leader "t";
          group = "[T]oggle";
        }

        {
          __unkeyed-1 = keys.leader "h";
          group = "Git [H]unk";
          mode = [
            modes.normal
            modes.visual
          ];
        }
      ];
    };
  };
}