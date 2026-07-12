{ pkgs, ... }:
let
  keys = import ../../lib/keys.nix;
  modes = import ../../lib/modes.nix;
in {
  plugins = {
    dap.enable = true;

    rustaceanvim = {
      enable = true;
      settings.dap.autoloadConfiguration = true;
    };
  };

  keymaps = [
    {
      mode = modes.normal;
      key = keys.f5;
      action = keys.cmd "DapContinue";
      options.desc = "Debug: Start of continue";
    }

    {
      mode = modes.normal;
      key = keys.f11;
      action = keys.cmd "DapStepInto";
      options.desc = "Debug: Step into";
    }

    {
      mode = modes.normal;
      key = keys.f12;
      action = keys.cmd "DapStepOut";
      options.desc = "Debug: Step out";
    }

    { 
      mode = modes.normal;
      key = keys.leader "db";
      action = keys.cmd "DapToggleBreakpoint";
      options.desc = "Debug: Toggle breakpoint";
    }

    {
      mode = modes.normal;
      key = keys.leader "dr";
      action = keys.cmd "RustLsp debuggables";
      options.desc = "Debug: Select Rust target";
    }
  ];

  extraPackages = [
    pkgs.vscode-extensions.vadimcn.vscode-lldb.adapter
  ];
}