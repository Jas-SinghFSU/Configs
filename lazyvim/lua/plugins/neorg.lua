return {
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    opts = {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {
          config = {
            icon_preset = "varied",
            icons = {
              code_block = {
                -- If true will only dim the content of the code block (without the
                -- `@code` and `@end` lines), not the entirety of the code block itself.
                content_only = true,

                -- The width to use for code block backgrounds.
                --
                -- When set to `fullwidth` (the default), will create a background
                -- that spans the width of the buffer.
                --
                -- When set to `content`, will only span as far as the longest line
                -- within the code block.
                width = "content",

                -- Additional padding to apply to either the left or the right. Making
                -- these values negative is considered undefined behaviour (it is
                -- likely to work, but it's not officially supported).
                padding = {
                  left = 1,
                  right = 1,
                },

                -- If `true` will conceal (hide) the `@code` and `@end` portion of the code
                -- block.
                conceal = true,

                nodes = { "ranged_verbatim_tag" },
                highlight = "CursorLine",
                -- render = module.public.icon_renderers.render_code_block,
                insert_enabled = true,
              },
            },
          },
        }, -- Adds pretty icons to your documents
        ["core.ui.calendar"] = {},
        ["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
        ["core.integrations.nvim-cmp"] = {},
        -- ["core.concealer"] = { config = { icon_preset = "diamond" } },
        ["core.esupports.metagen"] = { config = { type = "auto", update_date = true } },
        ["core.qol.toc"] = {},
        ["core.qol.todo_items"] = {},
        ["core.looking-glass"] = {},
        ["core.presenter"] = { config = { zen_mode = "zen-mode" } },
        ["core.export"] = {},
        ["core.export.markdown"] = { config = { extensions = "all" } },
        ["core.summary"] = {},
        ["core.tangle"] = { config = { report_on_empty = false } },
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/notes/notes",
              work = "~/notes/work",
            },
            default_workspace = "work",
          },
        },
      },
    },
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
  },
}
