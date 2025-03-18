return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = '[G]it [S]tatus' })

    local thedondope_fugitive = vim.api.nvim_create_augroup('thedondope-fugitive', {})

    local autocmd = vim.api.nvim_create_autocmd
    autocmd('BufWinEnter', {
      group = thedondope_fugitive,
      pattern = '*',
      callback = function()
        if vim.bo.ft ~= 'fugitive' then
          return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        vim.keymap.set('n', '<leader>p', function()
          vim.cmd.Git 'push'
        end, { buffer = bufnr, remap = false, desc = 'Git: Push HEAD to remote' })

        -- rebase always
        vim.keymap.set('n', '<leader>P', function()
          vim.cmd.Git { 'pull', '--rebase' }
        end, { buffer = bufnr, remap = false, desc = 'Git: Pull from remote' })

        -- NOTE: It allows me to easily set the branch i am pushing and any tracking
        -- needed if i did not set the branch up correctly
        vim.keymap.set('n', '<leader>t', ':Git push -u origin ', { desc = 'Git: Push current branch to remote' })
      end,
    })

    vim.keymap.set('n', 'gu', '<cmd>diffget //2<CR>', { desc = 'Git: Diff: Get changes from left' })
    vim.keymap.set('n', 'gh', '<cmd>diffget //3<CR>', { desc = 'Git: Diff: Get changes from right' })
  end,
}
