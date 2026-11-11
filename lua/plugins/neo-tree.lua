return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle file tree" },
    { "<leader>E", "<cmd>Neotree reveal<cr>", desc = "Reveal current file in tree" },
  },
  opts = {
    close_if_last_window = true,
    filesystem = {
      hijack_netrw_behavior = "disabled", -- let oil.nvim handle this
      follow_current_file = { enabled = true },
      filtered_items = { visible = true, hide_dotfiles = false, hide_gitignored = false },
    },
    window = { width = 30 },
  },
}
