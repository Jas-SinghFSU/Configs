return {

    -- Define the lspconfig.options type alias
    ---@alias lspconfig.options table<string, any>
    ---
    -- add pyright to lspconfig
    "neovim/nvim-lspconfig",

    ---@class PluginLspOpts
    opts = {
        ---@type lspconfig.options
        inlay_hints = { enabled = false },
        servers = {
            -- pyright will be automatically installed with mason and loaded with lspconfig
            pyright = {},
            cssls = {},
            css_variables = {},
            hyprls = {},
            docker_compose_language_service = {},
            dockerls = {},
            somesass_ls = {},
            vtsls = {
                settings = {
                    typescript = {
                        preferences = {
                            importModuleSpecifierEnding = "minimal",
                        },
                        tsServer = {
                            maxTsServerMemory = 8192,
                        },
                    },
                },
            },
            -- rust_analyzer handled by rustaceanvim
        },
    },
}
