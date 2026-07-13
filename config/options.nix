{
  globals = {
    mapleader = " ";
    maplocalleader = " ";
    have_nerd_font = true;
  };

  opts = {
    number = true;
    relativenumber = true;

    # already present in statusline
    showmode = false;

    # preserve indentation when wrapping lines
    breakindent = true;

    # persist undo across sessions
    undofile = true;

    # make searches case-insensitive
    ignorecase = true;

    # make searches case sensitive when starting candidate with capital letter
    smartcase = true;

    # keep signcolumn on by default
    signcolumn = "yes";

    # decrease updatetime
    updatetime = 250;

    # decrease mapped sequence wait time
    timeoutlen = 300;

    # open vertical splits right
    splitright = true;

    # open horizontal splits below
    splitbelow = true;

    # display specific whitespace characters with symbols
    list = true;
    listchars = {
      tab = "» "; # tab
      trail = "·"; # trailing whitespace
      nbsp = "␣"; # non-breaking space
    };

    # preview subsitutions live, while typing
    inccommand = "split";

    # show which line the cursor is on
    cursorline = true;

    # minimum space between cursor and top/bottom of window
    scrolloff = 10; # in lines

    # require confirmation if performing an operation that would fail
    # e.g. :q in a buffer with unsaved changes
    confirm = true;

    # number of spaces a tab represents
    tabstop = 2;

    #a number of spaces per level of indentation
    shiftwidth = 2;

    # convert tabs to spaces when typing or indenting
    expandtab = true;
  };
}
