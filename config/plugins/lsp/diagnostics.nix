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
      source = "if_many";
      spacing = 2;
    };
  };
}