{ pkgs, ...  }:
let
  keys = import ../lib/keys.nix;
  modes = import ../lib/modes.nix;
  telescope = command: keys.cmd "Telescope ${command}";
in {
  plugins.telescope = {
    enable = true;
    autoLoad = true;
    extensions = {
      fzf-native.enable = true;
      ui-select = {
        enable = true;
        settings.__raw = ''
          require("telescope.themes").get_dropdown()
        '';
      };
    };

    keymaps = {
      ${keys.leader "ff"} = {
        action = "find_files";
        options.desc = "[F]ind [F]iles";
      };

      ${keys.leader "fa"} = {
        action = "live_grep";
        options.desc = "[F]ind [A]nything";
      };

      ${keys.leader "fd"} = {
        action = "diagnostics";
        options.desc = "[F]ind [D]iagnostics";
      };

      ${keys.leader "fr"} = {
        action = "resume";
        options.desc = "[F]ind [R]esume";
      };

      ${keys.leader ""} = {
        action = "buffers";
        options.desc = "Find existing buffers";
      };
    };
  };

  keymaps =  [
    {
      mode = modes.normal;
      key = keys.leader "/";
      action = telescope "current_buffer_fuzzy_find theme=dropdown previewer=false winblend=10";
      options.desc = "Fuzzily search current buffer";
    }

    {
      mode = modes.normal;
      key = keys.leader "ft";
      action = keys.cmd "TodoTelescope";
      options.desc = "[F]ind [T]ODOs";
    }
  ];

  extraPackages = with pkgs; [
    fd
    ripgrep
  ];
}