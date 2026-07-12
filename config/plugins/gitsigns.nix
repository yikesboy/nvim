let
  keys = import ../lib/keys.nix;
  modes = import ../lib/modes.nix;
  gitsigns = command: keys.cmd "Gitsigns ${command}";
in {
  plugins.gitsigns.enable = true;

  keymaps = [
    {
      mode = modes.normal;
      key = keys.leader "hs";
      action = gitsigns "stage_hunk";
      options.desc = "Git: [s]tage hunk";
    }

    {
      mode = modes.normal;
      key = keys.leader "hr";
      action = gitsigns "reset_hunk";
      options.desc = "Git: [r]eset hunk";
    }

    {
      mode = modes.normal;
      key = keys.leader "hS";
      action = gitsigns "stage_buffer";
      options.desc = "Git: [S]tage buffer";
    }

    {
      mode = modes.normal;
      key = keys.leader "hu";
      action = gitsigns "undo_stage_hunk";
      options.desc = "Git: [u]ndo staged hunk";
    }

    {
      mode = modes.normal;
      key = keys.leader "hR";
      action = gitsigns "reset_buffer";
      options.desc = "Git: [R]eset buffer";
    }

    {
      mode = modes.normal;
      key = keys.leader "hp";
      action = gitsigns "preview_hunk";
      options.desc = "Git: [p]review hunk";
    }

    {
      mode = modes.normal;
      key = keys.leader "hb";
      action = gitsigns "blame_line";
      options.desc = "Git: [b]lame line";
    }

    {
      mode = modes.normal;
      key = keys.leader "hd";
      action = gitsigns "diffthis";
      options.desc = "Git: [d]iff against index";
    }

    {
      mode = modes.normal;
      key = keys.leader "hD";
      action = gitsigns "diffthis @";
      options.desc = "Git: [D]iff against last commit";
    }

    {
      mode = modes.normal;
      key = keys.leader "tb";
      action = gitsigns "toggle_current_line_blame";
      options.desc = "[T]oggle Git [b]lame line";
    }

    {
      mode = modes.normal;
      key = keys.leader "tD";
      action = gitsigns "preview_hunk_inline";
      options.desc = "Preview deleted lines inline";
    }
  ];
}