-- [[ Configure Formatters and Autoformatting ]]

return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  lazy = false,
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true }
      end,
      mode = 'n',
      desc = '[F]ormat the current buffer',
    },
  },
  opts = {
    formatters_by_ft = {
      -- NOTE: Conform can also run multiple formatters sequentially
      --
      -- python = {
      --   'isort',
      --   'black'
      -- },

      -- NOTE: You can use a sub-list to tell conform to run until a formatter is found.
      --
      -- javascript = { { "prettierd", "prettier" } },

      lua = { 'stylua' },
      proto = { 'buf' },
      terraform = { 'terraform_fmt' },
      markdown = { 'markdownlint' },
    },
    default_format_opts = {
      lsp_format = 'never',
    },
    format_on_save = function(bufnr)
      local ignore_files = {
        'proto',
        'markdown',
      }
      if vim.tbl_contains(ignore_files, vim.bo[bufnr].filetype) then
        return
      end
      return {
        lsp_format = 'never',
        timeout_ms = 500,
      }
    end,
  },
  init = function()
    vim.o.formatexpr = 'v:lua.require("conform").formatexpr()'
  end,
}

-- vim: ts=2 sts=2 sw=2 et
