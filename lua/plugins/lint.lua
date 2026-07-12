return {

  { -- Linting
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'
      -- lint.linters_by_ft = {
      --   markdown = { 'markdownlint' },
      -- }

      -- To allow other plugins to add linters to require('lint').linters_by_ft,
      -- instead set linters_by_ft like this:
      lint.linters_by_ft = lint.linters_by_ft or {}
      lint.linters_by_ft['go'] = { 'golangcilint' }
      lint.linters_by_ft['swift'] = { 'swiftlint' }
      lint.linters_by_ft['python'] = { 'ruff' }
      lint.linters_by_ft['lua'] = { 'selene' }
      lint.linters_by_ft['yaml'] = { 'yamllint' }
      lint.linters_by_ft['markdown'] = nil
      lint.linters_by_ft['rst'] = nil
      lint.linters_by_ft['text'] = nil
      -- lint.linters_by_ft['markdown'] = { 'markdownlint' }
      --
      -- However, note that this will enable a set of default linters,
      -- which will cause errors unless these tools are available:
      -- {
      --   clojure = { "clj-kondo" },
      --   dockerfile = { "hadolint" },
      --   inko = { "inko" },
      --   janet = { "janet" },
      --   json = { "jsonlint" },
      --   markdown = { "vale" },
      --   rst = { "vale" },
      --   ruby = { "ruby" },
      --   terraform = { "tflint" },
      --   text = { "vale" }
      -- }
      --
      -- You can disable the default linters by setting their filetypes to nil:
      -- lint.linters_by_ft['clojure'] = nil
      -- lint.linters_by_ft['dockerfile'] = nil
      -- lint.linters_by_ft['inko'] = nil
      -- lint.linters_by_ft['janet'] = nil
      -- lint.linters_by_ft['json'] = nil
      -- lint.linters_by_ft['markdown'] = nil
      -- lint.linters_by_ft['rst'] = nil
      -- lint.linters_by_ft['ruby'] = nil
      -- lint.linters_by_ft['terraform'] = nil
      -- lint.linters_by_ft['text'] = nil

      local function resolve_linter(name)
        local linter = lint.linters[name]
        if not linter then
          return nil
        end
        if type(linter) == 'function' then
          linter = linter()
        end
        linter.name = linter.name or name
        return linter
      end

      local function linter_is_available(name)
        local linter = resolve_linter(name)
        if not linter then
          return false
        end

        local cmd = linter.cmd
        if type(cmd) == 'function' then
          local ok, resolved = pcall(cmd)
          if not ok then
            return false
          end
          cmd = resolved
        end

        return type(cmd) == 'string' and vim.fn.executable(cmd) == 1
      end

      local function try_lint_available()
        local names = lint._resolve_linter_by_ft(vim.bo.filetype) or {}
        if #names == 0 then
          return
        end

        local available = vim.tbl_filter(linter_is_available, names)
        if #available > 0 then
          lint.try_lint(available)
        end
      end

      -- Create autocommand which carries out the actual linting
      -- on the specified events.
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          -- Only run the linter in buffers that you can modify in order to
          -- avoid superfluous noise, notably within the handy LSP pop-ups that
          -- describe the hovered symbol using Markdown.
          if vim.opt_local.modifiable:get() then
            try_lint_available()
          end
        end,
      })
    end,
  },
}
