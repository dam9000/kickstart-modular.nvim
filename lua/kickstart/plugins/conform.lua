-- [[ Configure Formatters and Autoformatting ]]

return {
  {
    'stevearc/conform.nvim',
    lazy = false,
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = 'n',
        desc = '[F]ormat the current buffer',
      },
    },
    opts = {
      notify_on_error = false,

      format_on_save = false,
      -- NOTE: Replace the above line with this to enable `format_on_save lsp_fallback`
      -- for languages that don't have a well standardized coding style.
      --
      -- format_on_save = function(bufnr)
      --   local disabled_fts = { c = true, cpp = true, objc = true, objcpp = true }
      --   return {
      --     timeout_ms = 500,
      --     lsp_fallback = not disabled_fts[vim.bo[bufnr].filetype],
      --   }
      -- end,

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
        -- rust = { 'rustfmt' },
      },
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
