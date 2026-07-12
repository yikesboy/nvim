let
  commonKeys = {
    esc = "<Esc>";
    leader = sequence: "<leader>${sequence}";
    ctrl = key: "<C-${key}>";
    cmd = command: "<cmd>${command}<CR>";
  };

  modes = {
    normal = "n";
    visual = "v";
    insert = "i";
    terminal = "t";
  };
in {
  keymaps = [
    {
      mode = modes.normal;
      key = commonKeys.esc;
      action = commonKeys.cmd "nohlsearch";
    }

    {
      mode = modes.normal;
      key = commonKeys.leader "q";
      action = commonKeys.cmd "lua vim.diagnostic.setloclist()";
      options = {
        silent = true;
        desc = "Open diagnostic [Q]uickfix list";
      };
    }

    {
      mode = modes.terminal;
      key = commonKeys.esc + commonKeys.esc;
      action = commonKeys.ctrl "\\" + commonKeys.ctrl "n";
      options.desc = "Exit terminal mode";
    }

    {
      mode = modes.normal;
      key = commonKeys.ctrl "h";
      action = commonKeys.ctrl "w" + commonKeys.ctrl "h";
      options.desc = "Move focus to the left window";
    }

    {
      mode = modes.normal;
      key = commonKeys.ctrl "l";
      action = commonKeys.ctrl "w" + commonKeys.ctrl "l";
      options.desc = "Move focus to the right window";
    }

    {
      mode = modes.normal;
      key = commonKeys.ctrl "j";
      action = commonKeys.ctrl "w" + commonKeys.ctrl "j";
      options.desc = "Move focus to the lower window";
    }

    {
      mode = modes.normal;
      key = commonKeys.ctrl "k";
      action = commonKeys.ctrl "w" + commonKeys.ctrl "k";
      options.desc = "Move focus to the upper window";
    }

    {
      mode = modes.normal;
      key = commonKeys.ctrl "d";
      action = commonKeys.ctrl "d" + "zz";
      options.desc = "Center after going half a page down";
    }

    {
      mode = modes.normal;
      key = commonKeys.ctrl "u";
      action = commonKeys.ctrl "u" + "zz";
      options.desc = "Center after going half a page up";
    }

    {
      mode = modes.normal;
      key = commonKeys.leader "nb";
      action = commonKeys.cmd "enew";
      options = {
        silent = true;
        desc = "Create [N]ew [B]uffer";
      };
    }

    {
      mode = modes.normal;
      key = commonKeys.leader "e";
      action = commonKeys.cmd "Oil .";
      options = {
        silent = true;
        desc = "Open oil.nvim in the current directory";
      };
    }

    {
      mode = modes.normal;
      key = commonKeys.leader "g";
      action = commonKeys.cmd "LazyGit";
      options = {
        silent = true;
        desc = "Open Lazy[G]it";
      };
    }
  ];
}