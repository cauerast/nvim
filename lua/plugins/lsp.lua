return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    vim.lsp.log.set_level("error")
    vim.o.winborder = "single" -- border for hover and floating windows

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Keymaps applied when an LSP attaches to the buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local opts = { buffer = args.buf }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<leader>df", function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
        vim.keymap.set("n", "<leader>dp", function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
        vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", opts)
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>fr", require("telescope.builtin").lsp_references, opts)
        vim.keymap.set("n", "<leader>e", function()
          vim.diagnostic.open_float(nil, { focusable = false, scope = "line", max_width = 80 })
        end, opts)
      end,
    })

    -- Capabilities for all servers
    vim.lsp.config("*", { capabilities = capabilities })

    vim.lsp.config("clangd", {
      cmd = { "clangd", "--compile-commands-dir=build" },
      root_markers = { "compile_commands.json", ".git" },
    })

    -- tsserver was renamed to ts_ls
    vim.lsp.enable({ "clangd", "gopls", "pyright", "ts_ls", "jdtls" })
  end,
}
