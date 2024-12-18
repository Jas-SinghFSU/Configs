return {
  {
    "saghen/blink.cmp",

    opts = {
      highlight = {
        -- supporting themes: tokyonight
        -- not supported: nightfox
        use_nvim_cmp_as_default = true,
      },
      sources = {
        completion = {
          enabled_providers = { "lsp", "path", "snippets", "buffer" },
        },
        providers = {
          snippets = {
            min_keyword_length = 1, -- don't show when triggered manually, useful for JSON keys
            score_offset = -1,
          },
          path = {
            opts = { get_cwd = vim.uv.cwd },
          },
          buffer = {
            fallback_for = {}, -- disable being fallback for LSP
            max_items = 4,
            min_keyword_length = 4,
            score_offset = -3,
          },
        },
      },
      keymap = {
        ["<S-CR>"] = { "select_and_accept", "fallback" },
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "scroll_documentation_down" },
        ["<Up>"] = { "scroll_documentation_up" },
      },
      windows = {
        documentation = {
          border = vim.g.borderStyle,
          min_width = 15,
          max_width = 45, -- smaller, due to https://github.com/Saghen/blink.cmp/issues/194
          max_height = 10,
          auto_show = true,
          auto_show_delay_ms = 250,
        },
        autocomplete = {
          border = vim.g.borderStyle,
          min_width = 10, -- max_width controlled by draw-function
          max_height = 10,
          cycle = { from_top = false }, -- cycle at bottom, but not at the top
          draw = function(ctx)
            -- https://github.com/Saghen/blink.cmp/blob/9846c2d2bfdeaa3088c9c0143030524402fffdf9/lua/blink/cmp/types.lua#L1-L6
            -- https://github.com/Saghen/blink.cmp/blob/9846c2d2bfdeaa3088c9c0143030524402fffdf9/lua/blink/cmp/windows/autocomplete.lua#L298-L349
            -- differentiate LSP snippets from user snippets and emmet snippets
            local source, client = ctx.item.source_id, ctx.item.client_id
            if client and vim.lsp.get_client_by_id(client).name == "emmet_language_server" then
              source = "emmet"
            end

            local sourceIcons = { snippets = "󰩫", buffer = "󰦨", emmet = "" }
            local icon = sourceIcons[source] or ctx.kind_icon

            return {
              {
                " " .. ctx.item.label .. " ",
                fill = true,
                hl_group = ctx.deprecated and "BlinkCmpLabelDeprecated" or "BlinkCmpLabel",
                max_width = 40,
              },
              { icon .. " ", hl_group = "BlinkCmpKind" .. ctx.kind },
            }
          end,
        },
      },
      kind_icons = {
        Text = "",
        Method = "󰊕",
        Function = "󰊕",
        Constructor = "",
        Field = "󰇽",
        Variable = "󰂡",
        Class = "󰜁",
        Interface = "",
        Module = "",
        Property = "󰜢",
        Unit = "",
        Value = "󰎠",
        Enum = "",
        Keyword = "󰌋",
        Snippet = "󰒕",
        Color = "󰏘",
        Reference = "",
        File = "",
        Folder = "󰉋",
        EnumMember = "",
        Constant = "󰏿",
        Struct = "",
        Event = "",
        Operator = "󰆕",
        TypeParameter = "󰅲",
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
