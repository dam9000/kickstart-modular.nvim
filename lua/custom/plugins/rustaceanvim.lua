return { -- Better tooling for rust than lspconfig built in.
  -- References:
  -- Configure Neovim For Easy Rust Development by Mental Outlaw https://www.youtube.com/watch?v=8nWzcVq5l3g&t=263s
  -- Rust and Neovim are AMAZING together by typecraft https://www.youtube.com/watch?v=gihHLsClHF0
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy,
    ['rust-analyzer'] = {
      cargo = { allFeatures = true },
    },
  },
}
