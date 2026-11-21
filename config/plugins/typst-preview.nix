{
  plugins.typst-preview = {
    enable = true;
    # hide wrong browser errors
    settings.open_cmd = "xdg-open '%s' 2>/dev/null";
  };
}
