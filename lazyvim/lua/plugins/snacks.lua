return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    priority = 1000,
    lazy = false,
    enabled = true,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      statuscolumn = { enabled = true },
      scroll = { enabled = false },
      words = { enabled = true },
      picker = {},
      lazygit = {
        ---@class snacks.lazygit.Config: snacks.terminal.Opts
        ---@field args? string[]
        ---@field theme? snacks.lazygit.Theme
        {
          -- automatically configure lazygit to use the current colorscheme
          -- and integrate edit with the current neovim instance
          configure = true,
          -- extra configuration for lazygit that will be merged with the default
          -- snacks does NOT have a full yaml parser, so if you need `"test"` to appear with the quotes
          -- you need to double quote it: `"\"test\""`
          config = {
            os = { editPreset = "nvim-remote" },
            gui = {
              -- set to an empty string "" to disable icons
              nerdFontsVersion = "3",
            },
          },
          theme_path = vim.fs.normalize(vim.fn.stdpath("cache") .. "/lazygit-theme.yml"),
          -- Theme for lazygit
          theme = {
            [241] = { fg = "Special" },
            activeBorderColor = { fg = "MatchParen", bold = true },
            cherryPickedCommitBgColor = { fg = "Identifier" },
            cherryPickedCommitFgColor = { fg = "Function" },
            defaultFgColor = { fg = "Normal" },
            inactiveBorderColor = { fg = "FloatBorder" },
            optionsTextColor = { fg = "Function" },
            searchingActiveBorderColor = { fg = "MatchParen", bold = true },
            selectedLineBgColor = { bg = "Visual" }, -- set to `default` to have no background colour
            unstagedChangesColor = { fg = "DiagnosticError" },
          },
          win = {
            style = "lazygit",
          },
        },
      },
    },
    keys = {
      {
        "<leader><space>",
        function()
          Snacks.picker.files()
        end,
        desc = "Find Files",
      },
      {
        "<leader>pf",
        function()
          Snacks.picker.files()
        end,
        desc = "Find Files",
      },
      {
        "<leader>pd",
        function()
          Snacks.picker.diagnostics()
        end,
        desc = "Diagnostics",
      },
      {
        "<leader>ps",
        function()
          Snacks.picker.grep()
        end,
        desc = "Grep",
      },
      {
        "<leader>sT",
        function()
          Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } })
        end,
        desc = "Todo/Fix/Fixme",
      },
    },
  },
}
