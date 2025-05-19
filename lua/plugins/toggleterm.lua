return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    event = "VeryLazy",
    opts = {
      -- Configurações do terminal
      size = 30,
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = false,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      -- Força o terminal a ser sempre flutuante
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        -- Configurações da janela flutuante
        border = "curved",
        width = math.floor(vim.o.columns * 0.8),
        height = math.floor(vim.o.lines * 0.8),
        winblend = 0,
        title_pos = "center",
        title = "Terminal",
      },
    },
    keys = {
      -- Configuramos o atalho diretamente para forçar sempre float
      { "<leader>tt", "<cmd>ToggleTerm direction=float<cr>", desc = "Terminal Flutuante" },
      { "<C-\\>", "<cmd>ToggleTerm direction=float<cr>", desc = "Alternar Terminal", mode = { "n", "t" } },
    },
    config = function(_, opts)
      -- Configurar o plugin
      require("toggleterm").setup(opts)
      
      -- Definir mapeamentos para terminal
      vim.api.nvim_create_autocmd("TermOpen", {
        pattern = "term://*",
        callback = function()
          -- Configurar teclas de escape para o terminal
          local keymap_opts = { buffer = true, silent = true }
          vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], keymap_opts)
          vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-W>h]], keymap_opts)
          vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-W>j]], keymap_opts)
          vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-W>k]], keymap_opts)
          vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-W>l]], keymap_opts)
        end,
      })
    end,
  },
} 