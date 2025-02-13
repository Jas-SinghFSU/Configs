return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
    {
      "akinsho/toggleterm.nvim",
      config = function()
        -- Calculate center window position
        local function center_win(width, height)
          -- Get the dimensions of the Neovim window
          local vim_width = vim.api.nvim_get_option("columns")
          local vim_height = vim.api.nvim_get_option("lines")

          -- Calculate the position to center the floating window
          local row = math.ceil((vim_height - height) / 2)
          local col = math.ceil((vim_width - width) / 2)

          return {
            relative = "editor",
            row = row,
            col = col,
            width = width,
            height = height,
          }
        end

        require("toggleterm").setup({
          shade_terminals = false,
          open_mapping = "<A-t>",
          shell = "zsh",
          direction = "float",
          highlights = {
            FloatBorder = { guifg = "#cba6f7" },
          },
          float_opts = {
            border = "single",
            width = math.floor(vim.o.columns * 0.8), -- 80% width
            height = math.floor(vim.o.lines * 0.6), -- 60% height
            winblend = 0, -- Transparency level
            highlights = {
              border = "Normal",
            },
          },
          size = function(term)
            return center_win(term.float_opts.width, term.float_opts.height)
          end,
        })
      end,
    },
  },
}
