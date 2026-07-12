return {
  -- Main LSP Configuration
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Keep Mason for the UI, but don't use it for installation
    { 'williamboman/mason.nvim', opts = {} },
    
    -- Useful status updates for LSP.
    {
      'j-hui/fidget.nvim',
      opts = {
        notification = {
          view = {
            line_margin = 0,
          },
          window = {
            normal_hl = 'Normal',
            winblend = 0,
          },
        },
      },
    },

    -- Allows extra capabilities provided by blink.cmp
    'saghen/blink.cmp',
  },
  config = function()
    --  This function gets run when an LSP attaches to a particular buffer.
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        -- Rename the variable under your cursor.
        map('<leader>ra', vim.lsp.buf.rename, '[R]en[a]me')

        -- Execute a code action
        map('ca', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })

        -- Find references for the word under your cursor.
        map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

        -- Jump to the implementation of the word under your cursor.
        map('gi', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

        -- Jump to the definition of the word under your cursor.
        map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

        -- Goto Declaration
        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

        -- Fuzzy find all the symbols in your current document.
        map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')

        -- Fuzzy find all the symbols in your current workspace.
        map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')

        -- Jump to the type of the word under your cursor.
        map('<leader>D', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')

        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
          local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
            end,
          })
        end

        -- Toggle inlay hints
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
          map('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
          end, '[T]oggle Inlay [H]ints')
        end
      end,
    })

    -- Diagnostic Config
    vim.diagnostic.config {
      severity_sort = true,
      float = { border = 'rounded', source = 'if_many' },
      underline = { severity = vim.diagnostic.severity.ERROR },
      signs = vim.g.have_nerd_font and {
        text = {
          [vim.diagnostic.severity.ERROR] = '󰅚 ',
          [vim.diagnostic.severity.WARN] = '󰀪 ',
          [vim.diagnostic.severity.INFO] = '󰋽 ',
          [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
      } or {},
      virtual_text = {
        source = 'if_many',
        spacing = 2,
        format = function(diagnostic)
          return diagnostic.message
        end,
      },
    }

    -- Get capabilities from blink.cmp
    local capabilities = require('blink.cmp').get_lsp_capabilities()

    -- Language servers configuration (managed by Nix, not Mason)
    local servers = {
      gopls = {},
      pyright = {
        settings = {
          python = {
            analysis = {
              typeCheckingMode = 'strict',
              autoSearchPath = true,
              useLibraryCodeForTypes = true,
              reportMissingTypeStubs = false,
              diagnosticMode = 'workspace',
            },
          },
        },
      },
      ts_ls = {
        settings = {
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints = 'all',
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = 'all',
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
        },
      },
      rust_analyzer = {},
      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
            telemetry = { enable = false },
          },
        },
      },
      nil_ls = {},
    }

    -- Setup all LSP servers using the new vim.lsp.config API
    for server_name, server_config in pairs(servers) do
      local config = vim.tbl_deep_extend('force', {
        capabilities = capabilities,
      }, server_config)
      
      vim.lsp.config[server_name] = config
      vim.lsp.enable(server_name)
    end

    -- Setup sourcekit-lsp if available (for Swift)
    if vim.fn.executable 'sourcekit-lsp' == 1 then
      vim.lsp.config.sourcekit = {
        capabilities = vim.tbl_deep_extend('force', capabilities, {
          workspace = {
            didChangeWatchedFiles = {
              dynamicRegistration = true,
            },
          },
        }),
        filetypes = { 'swift' },
      }
      vim.lsp.enable('sourcekit')
    end

    -- Setup jdtls if available (for Java)
    if vim.fn.executable 'jdtls' == 1 then
      vim.lsp.config.jdtls = {
        capabilities = capabilities,
      }
      vim.lsp.enable('jdtls')
    end
  end,
}
