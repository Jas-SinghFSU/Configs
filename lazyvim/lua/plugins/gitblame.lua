return {
    "f-person/git-blame.nvim",
    config = function()
        require("gitblame").setup({
            -- Note how the `gitblame_` prefix is omitted in `setup`
            enabled = true,
        })
        vim.g.gitblame_display_virtual_text = 0
        vim.g.gitblame_message_template = "<author> • <date>"
        vim.g.gitblame_date_format = "%r"
        vim.g.gitblame_delay = 100
    end,
}
