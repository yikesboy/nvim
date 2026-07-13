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
      };
    };
  }