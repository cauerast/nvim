return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    require('nvim-treesitter').install({ 
      "c", "lua", "vim", "vimdoc", "typescript", "javascript", "tsx", 
      "html", "css", "go", "markdown", "cpp", "python", "java", "rust"
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = { '*' },
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
        
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(args.buf))
        
        if ok and stats and stats.size > max_filesize then
          return
        end
        if lang then
          -- pcall: ignore filetypes without a parser (e.g. TelescopePrompt)
          pcall(vim.treesitter.start, args.buf, lang)
        end
      end,
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = { '*' },
      callback = function()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end
}
