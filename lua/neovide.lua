-- This file contains settings specifically for neovide, so only load them if the editor session is actually neovide (below code is not run in terminal)
if vim.g.neovide then
  vim.o.guifont = 'JetBrainsMono Nerd Font:h9.5'
  vim.g.neovide_cursor_animation_length = 0.04
  vim.g.neovide_cursor_vfx_mode = 'wireframe'
  -- By default, neovide does not do anything with ctrl-shift-c / v, because that is typically handled by the terminal emulator. Hence, add this back in when running in neovide.
  vim.keymap.set('v', '<C-S-c>', '"+y') -- Copy to system clipboard in visual mode
  vim.keymap.set('n', '<C-S-v>', '"+P') -- Paste from system clipboard (normal mode)
  vim.keymap.set('v', '<C-S-v>', '"+P') -- Paste from system clipboard (visual mode)
  vim.keymap.set('i', '<C-S-v>', '<ESC>"+P') -- Paste from system clipboard (insert mode)
  vim.keymap.set('c', '<C-S-v>', '<C-R>+') -- Paste from system clipboard (command mode)

  -- https://neovide.dev/faq.html#how-can-i-dynamically-change-the-scale-at-runtime
  vim.g.neovide_scale_factor = 1.0
  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end
  vim.keymap.set('n', '<C-=>', function()
    change_scale_factor(1.25)
  end)
  vim.keymap.set('n', '<C-->', function()
    change_scale_factor(1 / 1.25)
  end)

  vim.keymap.set('n', '<leader>vz', function()
    vim.g.neovide_scale_factor = 1.0
  end, { desc = 'Reset [Z]oom' })
end
