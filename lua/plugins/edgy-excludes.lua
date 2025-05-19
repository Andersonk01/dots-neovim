return {
  {
    "folke/edgy.nvim",
    optional = true,
    opts = function(_, opts)
      -- Adiciona filetypes para ignorar
      opts.exclude_filetypes = opts.exclude_filetypes or {}
      table.insert(opts.exclude_filetypes, "toggleterm")
      
      -- Ignorar também floats em geral
      opts.options = opts.options or {}
      opts.options.check_win_config = true
    end,
  },
} 