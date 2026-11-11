return {
  -- status bar
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = { options = { theme = "auto", globalstatus = true } },
  },
  -- buffer tabs at the top
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        offsets = { { filetype = "neo-tree", text = "Explorer", text_align = "left", separator = true } },
      },
    },
    keys = {
      { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
      { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
      { "<leader>x", "<cmd>bdelete<cr>", desc = "Close buffer" },
    },
  },
}
