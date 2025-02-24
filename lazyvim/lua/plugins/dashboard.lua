return {
    "folke/snacks.nvim",
    lazy = false,
    enabled = true,
    opts = {
        dashboard = {
            example = "advanced",
            preset = {
                header = [[
     ██╗ █████╗ ███████╗██╗  ██╗██╗██████╗  
     ██║██╔══██╗██╔════╝██║ ██╔╝██║██╔══██╗ 
     ██║███████║███████╗█████╔╝ ██║██████╔╝ 
██   ██║██╔══██║╚════██║██╔═██╗ ██║██╔══██╗ 
╚█████╔╝██║  ██║███████║██║  ██╗██║██║  ██║ 
 ╚════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═╝ ]],
            },
            sections = {
                { section = "header", hl = "@property" },
                {
                    icon = " ",
                    title = "Keymaps",
                    hl = "DashboardTitle",
                    section = "keys",
                    indent = 2,
                    padding = 1,
                },
                {
                    icon = " ",
                    title = "Recent Files",
                    hl = "DashboardTitle",
                    section = "recent_files",
                    indent = 2,
                    padding = 1,
                },
                {
                    icon = " ",
                    title = "Projects",
                    hl = "DashboardTitle",
                    section = "projects",
                    indent = 2,
                    padding = 1,
                },
                { section = "startup" },
            },
        },
    },
    keys = {
        {
            "<leader><CR>",
            function()
                Snacks.dashboard()
            end,
            desc = "Toggle Dashboard",
        },
    },
}
