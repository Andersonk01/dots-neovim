return {
  "folke/edgy.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>ue", function() require("edgy").toggle() end, desc = "Toggle Edgy Sidebars" },
    { "<leader>uE", function() require("edgy").select() end, desc = "Select Edgy Window" },
  },
  init = function()
    vim.opt.laststatus = 3
    vim.opt.splitkeep = "screen"
  end,
  opts = {
    -- Configuração das barras laterais
    left = {
      -- Neo-tree como explorador de arquivos
      {
        title = "Neo-Tree Explorer",
        ft = "neo-tree",
        filter = function(buf)
          return vim.b[buf].neo_tree_source == "filesystem"
        end,
        size = { height = 0.5, width = 30 },
      },
      -- Explorador Git
      {
        title = "Git Status",
        ft = "neo-tree",
        filter = function(buf)
          return vim.b[buf].neo_tree_source == "git_status"
        end,
        pinned = true,
        open = "Neotree position=left git_status",
      },
      -- Gerenciador de buffers
    --   {
    --     title = "Buffers",
    --     ft = "neo-tree",
    --     filter = function(buf)
    --       return vim.b[buf].neo_tree_source == "buffers"
    --     end,
    --     pinned = true,
    --     open = "Neotree position=left buffers",
    --   },
      -- Aerial para navegação de código
      {
        title = "Outline",
        ft = "aerial",
        pinned = true,
        open = "AerialOpen",
      },
      -- Outros possíveis plugins para sidebar
      "neotest",     -- Para testes
      "trouble",     -- Para erros e warnings
    },
    
    -- Painel inferior
    bottom = {
      -- Terminal integrado
      {
        ft = "toggleterm",
        size = { height = 0.4 },
        filter = function(buf, win)
          return vim.api.nvim_win_get_config(win).relative == ""
        end,
      },
      {
        ft = "lazyterm",
        title = "LazyTerm",
        size = { height = 0.4 },
      },
      -- Quickfix e location list
      { ft = "qf", title = "QuickFix" },
      { ft = "help", size = { height = 20 } },
      "Trouble",
      "spectre_panel",
    },
    
    -- Painel direito
    right = {
      -- Você pode adicionar outros plugins aqui
      {
        title = "Aerial",
        ft = "aerial",
        open = "AerialOpen right",
      },
    },
    
    -- Opções globais
    wo = {
      winbar = true,
      winfixwidth = true,
      signcolumn = "no",
      foldcolumn = "0",
      number = false,
      relativenumber = false,
      cursorline = true,
    },
    
    -- Atalhos de teclado personalizados para as janelas do Edgy
    keys = {
      -- Abrir/fechar
      ["q"] = function(win) win:close() end,
      ["<c-q>"] = function(win) win:hide() end,
      ["Q"] = function(win) win.view.edgebar:close() end,
      
      -- Navegação
      ["]w"] = function(win) win:next({ visible = true, focus = true }) end,
      ["[w"] = function(win) win:prev({ visible = true, focus = true }) end,
      
      -- Redimensionamento
      ["<c-w>>"] = function(win) win:resize("width", 2) end,
      ["<c-w><"] = function(win) win:resize("width", -2) end,
      ["<c-w>+"] = function(win) win:resize("height", 2) end,
      ["<c-w>-"] = function(win) win:resize("height", -2) end,
      ["<c-w>="] = function(win) win.view.edgebar:equalize() end,
    },
    
    -- Ícones
    icons = {
      closed = " ",
      open = " ",
    },
  },
} 