{
  diagnostic.settings = {
    severity_sort = true;

    float = {
      border = "rounded";
      source = "if_many";
    };

    underline.serverity.__raw = "vim.diagnostic.severity.ERROR";

    signs.text = {
      ERROR = "󰅚 ";
      WARN = "󰀪 ";
      INFO = "󰋽 ";
      HINT = "󰌶 ";
    };

    virtual_text = {
      current_line = false;
      source = "if_many";
      spacing = 2;
      format.__raw = ''
        function(diagnostic)
          local message = diagnostic.message:gsub("\n", " ")
          local max_width = math.max(20, vim.api.nvim_win_get_width(0) - 40)

          if #message > max_width then
            return message:sub(1, max_width - 3) .. "..."
          end

          return message
        end
      '';
    };

    virtual_lines = {
      current_line = true;
    };
  };
}
