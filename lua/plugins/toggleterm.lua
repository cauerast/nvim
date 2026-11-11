return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    open_mapping = [[<C-\>]],
    direction = "horizontal",
    size = 15,
    shade_terminals = false,
  },
  keys = {
    { "<C-\\>", desc = "Toggle terminal" },
    { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Floating terminal" },
    { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Bottom terminal" },
  },
}
