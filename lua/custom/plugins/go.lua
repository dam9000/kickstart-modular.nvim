return {
  {
    'ray-x/go.nvim',
    dependencies = { -- optional packages
      'ray-x/guihua.lua',
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',

      'mfussenegger/nvim-dap',
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
    },
    config = function()
      require('go').setup {
        goimports = 'gopls', -- if set to 'gopls' will use golsp format
        gofmt = 'gopls', -- if set to gopls will use golsp format
        tag_transform = false,
        test_dir = '',
        comment_placeholder = '   ',
        lsp_cfg = true, -- false: use your own lspconfig
        lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
        lsp_on_attach = true, -- use on_attach from go.nvim
        dap_debug = true,
      }

      -- Run gofmt + goimports on save
      local format_sync_grp = vim.api.nvim_create_augroup('goimports', {})
      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = '*.go',
        callback = function()
          require('go.format').goimports()
        end,
        group = format_sync_grp,
      })
    end,
    event = { 'CmdlineEnter' },
    ft = { 'go', 'gomod' },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries

    vim.keymap.set('n', '<leader>gg', '<cmd>GoAlt!<cr>', { desc = '[A]lternate code file' }),
    vim.keymap.set('n', '<leader>gs', '<cmd>GoTestSum<cr>', { desc = '[S]um Go Tests' }),
    vim.keymap.set('n', '<leader>gr', '<cmd>GoRun<cr>', { desc = '[R]un' }),
    vim.keymap.set('n', '<leader>gb', '<cmd>GoBuild<cr>', { desc = '[B]uild' }),
    vim.keymap.set('n', '<leader>gt', '<cmd>GoTest -f<cr>', { desc = 'Run [T]ests' }),
    vim.keymap.set('n', '<leader>gT', '<cmd>GoTest -n<cr>', { desc = 'Run a single [T]est' }),
    vim.keymap.set('n', '<leader>gc', '<cmd>GoCoverage<cr>', { desc = 'Test [C]overage' }),
    vim.keymap.set('n', '<leader>gd', '<cmd>GoDebug<cr>', { desc = 'Launch [D]ebugger' }),
    vim.keymap.set('n', '<leader>gv', '<cmd>GoVet<cr>', { desc = '[V]et Code' }),
    vim.keymap.set('n', '<leader>ge', "<cmd>!errcheck -ignore 'fmt:[FS]?[Pp]rint*' ./...<cr>", { desc = '[E]rror Check' }),
  },
}
