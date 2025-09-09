return {
  'vyfor/cord.nvim',
  build = ':Cord update',
  opts = {
    enabled = true,
    log_level = vim.log.levels.OFF,
    editor = {
      client = 'neovim',
      tooltip = 'neovim btw...',
      icon = nil,
    },
    display = {
      theme = 'atom',
      flavor = 'dark',
      swap_fields = false,
      swap_icons = false,
    },
    timestamp = {
      enabled = true,
      reset_on_idle = false,
      reset_on_change = false,
    },
    idle = {
      enabled = true,
      timeout = 300000,
      show_status = true,
      ignore_focus = true,
      unidle_on_focus = true,
      smart_idle = true,
      details = 'Idling',
      state = nil,
      tooltip = '💤',
      icon = nil,
    },
    text = {
      default = nil,
      workspace = function()
        return ''
      end,
      viewing = function()
        return 'Viewing'
      end,
      editing = function()
        return 'Editing'
      end,
      file_browser = function()
        return 'Browsing files'
      end,
      plugin_manager = function()
        return 'Managing plugins'
      end,
      lsp = function()
        return 'Configuring LSP'
      end,
      docs = function()
        return 'Reading'
      end,
      vcs = function()
        return 'Committing changes'
      end,
      notes = function()
        return 'Taking notes'
      end,
      debug = function()
        return 'Debugging'
      end,
      test = function()
        return 'Testing'
      end,
      diagnostics = function()
        return 'Fixing problems'
      end,
      games = function()
        return 'Playing'
      end,
      terminal = function()
        return 'Running commands'
      end,
      dashboard = 'Home',
    },
    buttons = nil,
    assets = nil,
    variables = nil,
    hooks = {
      ready = nil,
      shutdown = nil,
      pre_activity = nil,
      post_activity = nil,
      idle_enter = nil,
      idle_leave = nil,
      workspace_change = nil,
    },
    plugins = nil,
    advanced = {
      plugin = {
        autocmds = true,
        cursor_update = 'on_hold',
        match_in_mappings = true,
      },
      server = {
        update = 'fetch',
        pipe_path = nil,
        executable_path = nil,
        timeout = 300000,
      },
      discord = {
        reconnect = {
          enabled = false,
          interval = 5000,
          initial = true,
        },
      },
      workspace = {
        root_markers = {
          '.git',
        },
        limit_to_cwd = false,
      },
    },
  },
}
