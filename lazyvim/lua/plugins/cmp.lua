return {
  {
    "saghen/blink.cmp",

    opts = {
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      keymap = {
        ["<CR>"] = {},
        ["<S-CR>"] = { "select_and_accept", "fallback" },
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "scroll_documentation_down" },
        ["<Up>"] = { "scroll_documentation_up" },
      },
    },
  },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = {
  --     "L3MON4D3/LuaSnip",
  --     "saadparwaiz1/cmp_luasnip",
  --     "onsails/lspkind.nvim",
  --     "hrsh7th/cmp-emoji",
  --     "hrsh7th/cmp-nvim-lsp",
  --     "hrsh7th/nvim-cmp",
  --     "hrsh7th/cmp-buffer",
  --     "hrsh7th/cmp-path",
  --     "hrsh7th/cmp-nvim-lua",
  --   },
  --   ---@param opts cmp.ConfigSchema
  --   opts = function(_, opts)
  --     local cmp = require("cmp")
  --     local cmp_select = {
  --       behavior = cmp.SelectBehavior.Select,
  --     }
  --     opts.mapping = vim.tbl_deep_extend("force", opts.mapping, {
  --       ["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
  --       ["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
  --       ["<S-CR>"] = cmp.mapping.confirm({
  --         select = true,
  --       }),
  --       ["<CR>"] = cmp.config.disable,
  --       -- ['<C-Space>'] = cmp.mapping.complete(),
  --     })
  --
  --     opts.sources = cmp.config.sources({
  --       {
  --         name = "luasnip",
  --         group_index = 2,
  --       },
  --       {
  --         name = "nvim_lsp",
  --         group_index = 2,
  --       },
  --       {
  --         name = "copilot",
  --         group_index = 2,
  --       },
  --       {
  --         name = "nvim_lua",
  --         group_index = 2,
  --       },
  --       {
  --         name = "path",
  --         group_index = 2,
  --       },
  --       {
  --         name = "buffer",
  --         keyword_length = 3,
  --         group_index = 2,
  --       },
  --     })
  --
  --     require("luasnip/loaders/from_vscode").lazy_load()
  --   end,
  -- },
}
