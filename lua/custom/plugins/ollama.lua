return {
   'nomnivore/ollama.nvim',
   dependencies = {
      'nvim-lua/plenary.nvim',
   },

   cmd = { 'Ollama', 'OllamaModel', 'OllamaServe', 'OllamaServeStop' },

   keys = {
      {
         '\\"',
         ":<c-u>lua require('ollama').prompt()<cr>",
         desc = 'Ollama Prompt',
         mode = { 'n', 'v' },
      },

      {
         "\\'",
         ":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
         desc = 'Ollama Generate Code',
         mode = { 'n', 'v' },
      },
   },

   ---@type Ollama.Config
   opts = {
      model = 'gemma:7b',
      url = 'http://192.168.4.28:11434',
   },
}
