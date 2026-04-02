return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'main',
    build = ':TSUpdate',
    config = function()
      local parsers = {
        'lua',
        'python',
        'javascript',
        'typescript',
        'bash',
        'markdown',
        'markdown_inline',
        'java',
      }
      require('nvim-treesitter').setup()

      vim.defer_fn(function()
        require('nvim-treesitter').install(parsers):wait(300000)
      end, 0)

      vim.api.nvim_create_autocmd('FileType', {
        pattern = parsers,
        callback = function()
          vim.treesitter.start()
        end,
      })
    end,
  }

