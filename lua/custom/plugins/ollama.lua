return {
  -- Plugin: David-Kunz/gen.nvim
  {
    'David-Kunz/gen.nvim',
    config = function()
      require('gen').setup {
        model = 'codellama:7b-instruct',
        host = '192.168.4.28',
        init = nil,
        display_mode = 'split',
        show_prompt = true,
        show_model = true,
      }
    end,
  },

  -- Keymap: <leader>]
  vim.keymap.set({ 'n', 'v' }, '\\]', ':Gen<cr>', { desc = 'AI Interface via Ollama' }),
}
