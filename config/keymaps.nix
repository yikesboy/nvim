let
  modes = import ./lib/modes.nix;
  keys = import ./lib/keys.nix;
in {
  keymaps = [
    {
      mode = modes.normal;
      key = keys.esc;
      action = keys.cmd "nohlsearch";
    }

    {
      mode = modes.normal;
      key = keys.leader "q";
      action = keys.cmd "lua vim.diagnostic.setloclist()";
      options = {
        silent = true;
        desc = "Open diagnostic [Q]uickfix list";
      };
    }

    {
      mode = modes.terminal;
      key = keys.esc + keys.esc;
      action = keys.ctrl "\\" + keys.ctrl "n";
      options.desc = "Exit terminal mode";
    }

    {
      mode = modes.normal;
      key = keys.ctrl "h";
      action = keys.ctrl "w" + keys.ctrl "h";
      options.desc = "Move focus to the left window";
    }

    {
      mode = modes.normal;
      key = keys.ctrl "l";
      action = keys.ctrl "w" + keys.ctrl "l";
      options.desc = "Move focus to the right window";
    }

    {
      mode = modes.normal;
      key = keys.ctrl "j";
      action = keys.ctrl "w" + keys.ctrl "j";
      options.desc = "Move focus to the lower window";
    }

    {
      mode = modes.normal;
      key = keys.ctrl "k";
      action = keys.ctrl "w" + keys.ctrl "k";
      options.desc = "Move focus to the upper window";
    }

    {
      mode = modes.normal;
      key = keys.ctrl "d";
      action = keys.ctrl "d" + "zz";
      options.desc = "Center after going half a page down";
    }

    {
      mode = modes.normal;
      key = keys.ctrl "u";
      action = keys.ctrl "u" + "zz";
      options.desc = "Center after going half a page up";
    }

    {
      mode = modes.normal;
      key = keys.leader "nb";
      action = keys.cmd "enew";
      options = {
        silent = true;
        desc = "Create [N]ew [B]uffer";
      };
    }

    {
      mode = modes.normal;
      key = keys.leader "e";
      action = keys.cmd "Oil .";
      options = {
        silent = true;
        desc = "Open oil.nvim in the current directory";
      };
    }
  ];
}