-- [[ Configure plugin for writing and navigating obsidian notes ]]

return {
  'epwalsh/obsidian.nvim',
  version = '*',
  lazy = true,
  event = {
    'BufReadPre ' .. vim.fn.expand '~' .. '/Downloads/enrique-perez-obsidian/**.md',
    'BufNewFile ' .. vim.fn.expand '~' .. '/Downloads/enrique-perez-obsidian/**.md',
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
    'nvim-telescope/telescope.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
    workspaces = {
      {
        name = 'personal',
        path = '~/Downloads/enrique-perez-obsidian/',
      },
    },
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },

    -- Where to put new notes. Valid options are
    --  * "current_dir" - put new notes in same directory as the current buffer.
    --  * "notes_subdir" - put new notes in the default notes subdirectory.
    new_notes_location = 'current_dir',

    -- Either `wiki` or `markdown`.
    preferred_link_style = 'markdown',

    -- Disable obsidian's rendering of markdown, because of the `render-markdown` plugin.
    ui = { enable = false },

    mappings = {
      ['<leader>of'] = {
        action = function()
          return require('obsidian').util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
        desc = '[F]ollow Link',
      },
      ['<leader>oc'] = {
        action = function()
          return require('obsidian').util.toggle_checkbox()
        end,
        opts = { buffer = true },
        desc = 'Toggle [C]heckbox',
      },
    },

    -- Customizes the frontmatter data.
    ---@return table
    note_frontmatter_func = function(note)
      local out = { id = note.id, aliases = note.aliases, tags = note.tags, area = '', project = '' }

      -- `note.metadata` contains any manually added fields in the frontmatter.
      -- So here we just make sure those fields are kept in the frontmatter.
      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end
      return out
    end,

    -- Customizes how note IDs are generated given an optional title.
    ---@param title string|?
    ---@return string
    note_id_func = function(title)
      -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
      -- In this case a note with the title 'My new note' will be given an ID that looks
      -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
      local suffix = ''
      if title ~= nil then
        -- If title is given, transform it into valid file name.
        suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
      else
        -- If title is nil, just add 4 random uppercase letters to the suffix.
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return suffix
    end,

    templates = {
      folder = 'Templates',
      date_format = '%Y-%m-%d-%a',
      time_format = '%H:%M',
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
