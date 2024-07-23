-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
if false then return {} end

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },

  -- change trouble config
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },

  -- disable trouble
  { "folke/trouble.nvim", enabled = true },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      local cmp_select = {
        behavior = cmp.SelectBehavior.Select,
      }
      require("luasnip/loaders/from_vscode").lazy_load()

      cmp.setup({
        sources = {
          {
            name = "luasnip",
            keyword_length = 2,
          },
          {
            name = "path",
          },
          {
            name = "nvim_lsp",
          },
          {
            name = "nvim_lua",
          },
          {
            name = "buffer",
            keyword_length = 3,
          },
        },
        mapping = cmp.mapping.preset.insert({
          ["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
          ["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
          ["<S-CR>"] = cmp.mapping.confirm({
            select = true,
          }),
          -- ['<C-Space>'] = cmp.mapping.complete(),
        }),
      })
    end,
  },

  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>pf",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find File",
      },
      {
        "<leader>ps",
        function()
          require("telescope.builtin").grep_string({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Search File",
      },
    },
    -- change some options
  },

  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},
      },
    },
  },

  -- add tsserver and setup with typescript.nvim instead of lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      init = function()
        require("lazyvim.util").lsp.on_attach(function(_, buffer)
          -- stylua: ignore
          vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
        end)
      end,
    },
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- tsserver will be automatically installed with mason and loaded with lspconfig
        tsserver = {},
      },
      inlay_hints = { enabled = false },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- example to setup with typescript.nvim
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
  },

  -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
  -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
  { import = "lazyvim.plugins.extras.lang.typescript" },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },

  -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- would overwrite `ensure_installed` with the new value.
  -- If you'd rather extend the default config, use the code below instead:
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = function(_, opts)
  --     -- add tsx and treesitter
  --     vim.list_extend(opts.ensure_installed, {
  --       "tsx",
  --       "typescript",
  --     })
  --   end,
  -- },

  -- the opts function can also be used to change the default opts:
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   event = "VeryLazy",
  --   opts = function(_, opts)
  --     table.insert(opts.sections.lualine_x, "😄")
  --   end,
  -- },

  -- or you can return new options to override all the defaults
  {
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
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      local git_blame = require("gitblame")
      return {

        require("lualine").setup({
          options = {
            icons_enabled = true,
            theme = "catppuccin",
            component_separators = {
              left = "",
              right = "",
            },
            section_separators = {
              left = "",
              right = "",
            },
            disabled_filetypes = {
              statusline = {},
              winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = false,
            refresh = {
              statusline = 1000,
              tabline = 1000,
              winbar = 1000,
            },
          },
          sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = {
              {
                color = {
                  fg = "#1e1e2e",
                  bg = "#1e1e2e",
                },
              },
            },
            lualine_x = {
              {
                git_blame.get_current_blame_text,
                cond = git_blame.is_blame_text_available,
                draw_empty = false,
                separator = {
                  right = "",
                  left = "",
                },
                color = {
                  fg = "#282A36",
                  bg = "#eba0ac",
                },
              },
            },
            lualine_y = { "progress" },
            lualine_z = { "location" },
          },
          inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { "filename" },
            lualine_x = { "location" },
            lualine_y = {},
            lualine_z = {},
          },
          tabline = {},
          winbar = {},
          inactive_winbar = {},
          extensions = {},
        }),
      }
    end,
  },

  -- use mini.starter instead of alpha
  -- { import = "lazyvim.plugins.extras.ui.mini-starter" },

  -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
  { import = "lazyvim.plugins.extras.lang.json" },

  -- add any tools you want to have installed below
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
            FloatBorder = { guifg = "#BD93F9" },
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
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        always_show_bufferline = true,
      },
    },
  },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup({
        theme = "hyper",
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
              group = "PreProc",
              action = "Telescope find_files",
              key = "f",
            },
            {
              icon = "󰬔 ",
              desc = "Mason",
              group = "Character",
              action = "Mason",
              key = "m",
            },
            {
              desc = " Config",
              group = "Error",
              action = "Telescope find_files cwd=~/.config/nvim",
              key = "c",
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
      })

      -- Dashboard Highlights
      vim.api.nvim_command([[ highlight DashboardHeader guifg=#f38ba8 ]])
      vim.api.nvim_command([[ highlight DashboardProjectTitle guifg=#fab387 ]])
      vim.api.nvim_command([[ highlight DashboardProjectIcon guifg=#fab387 ]])
      vim.api.nvim_command([[ highlight DashboardFiles guifg=#f9e2af ]])
      vim.api.nvim_command([[ highlight DashboardMruTitle guifg=#f4b8e4]])
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      -- config here
    end,
  },
}
