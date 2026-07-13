{
  plugins = {
    mini-ai = {
      enable = true;
      settings = {
        n_lines = 500;
      };
    };

    mini-surround.enable = true;
    mini-statusline = {
      enable = true;
      settings = {
        use_icons = true;
      };
    };

    mini-icons.enable = true;
  };

  # overwrite statusline line display to "linenumber:virtualcolumn"
  extraConfigLua = ''
    MiniStatusline.section_location = function()
      return "%2l:%-2v"
    end
  '';
}
