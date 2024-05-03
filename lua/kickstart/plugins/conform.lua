-- [[ Configure Autoformatting ]]

return {
  {
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = false,
      format_on_save = {
        timeout_ms = 5000,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        -- Conform can also run multiple formatters sequentially
        python = { 'isort', 'black' },

        -- You can use a sub-list to tell conform to run *until* a formatter is found.
        -- javascript = { { "prettierd", "prettier" } },

        -- TODO: Add and test configuration for sqlfluff.
        --
        -- sql = { 'sqlfluff' },

        lua = { 'stylua' },
        rust = { 'rustfmt' },
        go = { 'goimports', 'golines', 'gofmt' },
        protobuf = { 'buf' },
        terraform = { 'terraform_fmt' },
        json = { 'jq' },
      },
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
