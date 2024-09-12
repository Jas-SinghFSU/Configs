return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>pf",
        function()
          require("telescope.builtin").find_files({})
        end,
        desc = "Find File",
      },
      {
        "<leader>ps",
        function()
          require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
        end,
        desc = "Search Words",
      },
    },
  },
}
