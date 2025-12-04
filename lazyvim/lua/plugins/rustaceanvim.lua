return {
    "mrcjkb/rustaceanvim",
    opts = {
        server = {
            settings = {
                ["rust-analyzer"] = {
                    procMacro = {
                        enable = true,
                    },
                    cargo = {
                        features = "all",
                    },
                    checkOnSave = {
                        command = "clippy",
                        extraArgs = { "--no-deps" },
                    },
                    inlayHints = {
                        bindingModeHints = {
                            enable = false,
                        },
                        chainingHints = {
                            enable = true,
                        },
                        closingBraceHints = {
                            enable = true,
                            minLines = 25,
                        },
                        closureReturnTypeHints = {
                            enable = "never",
                        },
                        lifetimeElisionHints = {
                            enable = "never",
                            useParameterNames = false,
                        },
                        maxLength = 25,
                        parameterHints = {
                            enable = true,
                        },
                        reborrowHints = {
                            enable = "never",
                        },
                        renderColons = true,
                        typeHints = {
                            enable = true,
                            hideClosureInitialization = false,
                            hideNamedConstructor = false,
                        },
                    },
                },
            },
        },
        tools = {
            hover_actions = {
                auto_focus = true,
            },
        },
    },
}