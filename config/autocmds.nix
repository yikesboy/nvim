{
  autoGroups.highlight-yank.clear = true;
  autoCmd = [
    {
      event = "TextYankPost";
      desc = "Highlight yanked text";
      group = "highlight-yank";
      command = "silent! lua vim.highlight.on_yank()";
    }
  ];
}
