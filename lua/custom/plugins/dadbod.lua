return {
    "kristijanhusak/vim-dadbod-completion",
    lazy = true,
    dependencies = {
        "tpope/vim-dadbod",
        "kristijanhusak/vim-dadbod-ui"
    },
    ft = {"sql", "mysql", "plsql"},
    init = function()
        vim.api.nvim_create_autocmd("FileType", {
            group = vim.api.nvim_create_augroup("kide_vim_dadbod_completion", {
                clear = true
            }),
            pattern = {"sql", "mysql", "plsql"},
            callback = function(event)
                require("cmp").setup.buffer({
                    sources = {{
                        name = "vim-dadbod-completion"
                    }}
                })
            end
        })
    end,
    config = function()
    end
}
