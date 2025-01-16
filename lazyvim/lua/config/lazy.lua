local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },

    { import = "lazyvim.plugins.extras.linting.eslint" },
    { import = "lazyvim.plugins.extras.formatting.prettier" },

    { import = "lazyvim.plugins.extras.coding.luasnip" },

    { import = "lazyvim.plugins.extras.util.dot" },

    { import = "lazyvim.plugins.extras.ai.copilot-chat" },
    { import = "lazyvim.plugins.extras.ai.copilot" },

    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.rust" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.markdown" },

    { import = "lazyvim.plugins.extras.editor.snacks_picker" },

    { import = "plugins" },
  },
  defaults = {
    lazy = false,
    version = false, -- always use the latest git commit
  },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

require("functions.banner")

-- Hyprlang LSP
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.hl", "hypr*.conf" },
  callback = function(event)
    print(string.format("starting hyprls for %s", vim.inspect(event)))
    vim.lsp.start({
      name = "hyprlang",
      cmd = { "hyprls" },
      root_dir = vim.fn.getcwd(),
    })
  end,
})

-- Set cursor styles for different modes
vim.opt.guicursor = {
  "n-v-c-sm:block-Cursor", -- Normal, Visual, Command-line, Select modes
  "i-ci-ve:ver25-Cursor", -- Insert modes
  "r-cr-o:hor20-Cursor", -- Replace and other modes
}

-- Function to set the Cursor highlight group
local function set_cursor_highlight()
  vim.cmd([[highlight Cursor guibg=#31748f guifg=#11111b]])
end

local function set_snacks_highlights()
  ---------------
  -- DASHBOARD --
  ---------------
  vim.cmd([[highlight SnacksDashboardHeader guifg=#eb6f92]])
  vim.cmd([[highlight SnacksDashboardIcon guifg=#31748f]])
  vim.cmd([[highlight SnacksDashboardTitle guifg=#31748f]])
  vim.cmd([[highlight SnacksDashboardKey guifg=#ebbcba]])
  vim.cmd([[highlight SnacksDashboardDesc guifg=#f6c177]])
  vim.cmd([[highlight SnacksDashboardDir guifg=#c4a7e7]])
  vim.cmd([[highlight SnacksDashboardFile guifg=#9ccfd8]])

  ----------------
  --   INDENT   --
  ----------------
  vim.cmd([[highlight SnacksIndent guifg=#26233a]])
  vim.cmd([[highlight SnacksIndentScope guifg=#9ccfd8]])
end

-- Apply the Cursor highlight after setting the colorscheme
vim.cmd([[
  augroup CustomizeCursor
    autocmd!
    autocmd Colorscheme * lua set_cursor_highlight()
  augroup END
]])

-- Initial call to set the Cursor highlight
set_cursor_highlight()
set_snacks_highlights()
