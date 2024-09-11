-- Add format command
vim.api.nvim_create_user_command('Format', function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ['end'] = { args.line2, end_line:len() },
    }
  end
  -- Use CLI args instead of LSP server settings
  require('conform').formatters.ruff_format = { append_args = { '--line-length', '120' } }
  require('conform').formatters.sqlfluff = { append_args = { '--dialect', 'postgres' } }
  require('conform').format { async = true, lsp_format = 'fallback', range = range }
end, { range = true })

-- Add toggle command to format-on-save
vim.api.nvim_create_user_command('FormatDisable', function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = 'Disable autoformat-on-save',
  bang = true,
})
vim.api.nvim_create_user_command('FormatEnable', function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = 'Re-enable autoformat-on-save',
})

-- kickstart config
return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').formatters.ruff_format = { append_args = { '--line-length', '120' } }
          require('conform').formatters.sqlfluff = { append_args = { '--dialect', 'postgres' } }
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Define default behaviour here (default disable autoformat)
        if (vim.g.disable_autoformat == nil) or (vim.b[bufnr].disable_autoformat == nil) then
          return
        end
        -- Disable autoformat with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        local lsp_format_opt
        if disable_filetypes[vim.bo[bufnr].filetype] then
          lsp_format_opt = 'never'
        else
          lsp_format_opt = 'fallback'
        end
        return {
          timeout_ms = 500,
          lsp_format = lsp_format_opt,
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        -- use ruff as formatter, conform with 'ruff_format' uses ruff binary and ignores server settings/configs
        -- https://github.com/astral-sh/ruff/issues/12778
        -- currently ruff_organize_imports uses linter rather than formater, a unified interface is planned
        -- https://github.com/astral-sh/ruff/issues/8232
        python = { 'ruff_fix', 'ruff_organize_imports', 'ruff_format' },
        sql = { 'sqlfluff' },
        markdown = { 'prettier', 'markdown-toc', 'markdownlint-cli2' },
        json = { 'prettier', 'jq' },
        sh = { 'bashls', 'shfmt' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use 'stop_after_first' to run the first available formatter from the list
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
