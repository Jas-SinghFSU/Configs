return {
  {
    "nvimdev/dashboard-nvim",
    lazy = false,
    opts = function()
      local opts = {
        theme = "hyper",
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          header = {
            "     ██╗ █████╗ ███████╗██╗  ██╗██╗██████╗ ",
            "     ██║██╔══██╗██╔════╝██║ ██╔╝██║██╔══██╗",
            "     ██║███████║███████╗█████╔╝ ██║██████╔╝",
            "██   ██║██╔══██║╚════██║██╔═██╗ ██║██╔══██╗",
            "╚█████╔╝██║  ██║███████║██║  ██╗██║██║  ██║",
            " ╚════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═╝",
            "                                            ",
          },
          shortcut = {
            {
              icon = "󰊳 ",
              desc = "Update",
              group = "Statement",
              action = "Lazy update",
              key = "u",
            },
            {
              icon = " ",
              desc = "Files",
              group = "Label",
              action = "Telescope find_files",
              key = "f",
            },
            {
              icon = "󰬔 ",
              desc = "Mason",
              group = "String",
              action = "Mason",
              key = "m",
            },
            {
              desc = " Config",
              group = "Error",
              action = "Telescope find_files cwd=~/.config/nvim",
              key = "c",
            },
            {
              desc = " Hyprland",
              group = "@property",
              action = "e ~/.config/hypr/hyprland.conf",
              key = "h",
            },
            {
              desc = "󰆍 Kitty",
              group = "Statement",
              action = "e ~/.config/kitty/kitty.conf",
              key = "t",
            },
          },
          packages = {
            enable = true,
          },
          project = {
            enable = true,
            limit = 8,
            icon = " ",
            group = "String",
            label = "Recent Projects",
            action = "Telescope find_files cwd=",
          },
          mru = {
            icon = "󰈮 ",
            label = "Recent Files",
            cwd_only = true,
          },
          footer = { "" },
        },
      }
      -- Dashboard Highlights
      vim.api.nvim_command([[ highlight DashboardHeader guifg=#eb6f92]])
      vim.api.nvim_command([[ highlight DashboardProjectTitle guifg=#fab387 ]])
      vim.api.nvim_command([[ highlight DashboardProjectIcon guifg=#ebbcba]])
      vim.api.nvim_command([[ highlight DashboardFiles guifg=#f6c177]])
      vim.api.nvim_command([[ highlight DashboardMruTitle guifg=#c4a7e7]])

      -- open dashboard after closing lazy
      if vim.o.filetype == "lazy" then
        vim.api.nvim_create_autocmd("WinClosed", {
          pattern = tostring(vim.api.nvim_get_current_win()),
          once = true,
          callback = function()
            vim.schedule(function()
              vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
            end)
          end,
        })
      end

      return opts
    end,
  },
}
