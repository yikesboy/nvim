  let 
    header = ''
                                                                     
       ████ ██████           █████      ██                     
      ███████████             █████                             
      █████████ ███████████████████ ███   ███████████   
     █████████  ███    █████████████ █████ ██████████████   
    █████████ ██████████ █████████ █████ █████ ████ █████   
  ███████████ ███    ███ █████████ █████ █████ ████ █████  
 ██████  █████████████████████ ████ █████ █████ ████ ██████ 
        '';
  in {
    plugins.snacks = {
      enable = true;
      autoLoad = true;

      settings.dashboard = {
        enabled = true;

        preset = {
          header = header;

          keys = [
            {
              icon = " ";
              key = "f";
              desc = "Find File";
              action = ":lua Snacks.dashboard.pick('files')";
            }

            {
              icon = " ";
              key = "n";
              desc = "New File";
              action = ":ene | startinsert";
            }

            {
              icon = " ";
              key = "q";
              desc = "Quit";
              action = ":qa";
            }
          ];
        };
      sections = [
        {
          section = "header";
        }

        {
          section = "keys";
          gap = 1;
          padding = 1;
        }

        {
  __raw = ''
    function()
      local startup =
        vim.fn.reltimefloat(vim.fn.reltime(vim.g.start_time)) * 1000

      return {
        text = string.format("⚡ Neovim loaded in %.2f ms", startup),
        align = "center",
        hl = "SnacksDashboardFooter",
        padding = 1,
      }
    end
  '';
}      ];
    };
  };

  extraConfigLuaPre = ''
    vim.g.start_time = vim.fn.reltime()
  '';
}
