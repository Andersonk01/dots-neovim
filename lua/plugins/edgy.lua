return {
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    opts = {
      bottom = {
        -- toggleterm holds the terminal
        {
          ft = "toggleterm",
          size = { height = 0.4 },
        },
        {
          ft = "qf",
          title = "QuickFix",
        },
        {
          ft = "help",
          size = { height = 0.5 },
        },
      },
      left = {
        -- Combined view with both Explorer and Outline
        {
          title = "Explorer & Outline",
          ft = "neo-tree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "filesystem"
          end,
          size = { width = 30 },
        },
      },
      right = {
        -- Neo-tree Git panel
        {
          title = "Git",
          ft = "neo-tree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "git_status"
          end,
          pinned = true,
          open = "Neotree focus position=right source=git_status",
        },
        -- Neo-tree Buffers panel
        {
          title = "Buffers",
          ft = "neo-tree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "buffers"
          end,
          pinned = true,
          open = "Neotree focus position=right source=buffers",
        },
      },
      -- configuration options
      animate = {
        enabled = true,
        fps = 100,
        on_begin = function()
          vim.g.minianimate_disable = true
        end,
        on_end = function()
          vim.g.minianimate_disable = false
        end,
      },
      keys = {
        -- increase width
        ["<c-w>>"] = function(win)
          win:resize("width", 2)
        end,
        -- decrease width
        ["<c-w><lt>"] = function(win)
          win:resize("width", -2)
        end,
        -- increase height
        ["<c-w>+"] = function(win)
          win:resize("height", 2)
        end,
        -- decrease height
        ["<c-w>-"] = function(win)
          win:resize("height", -2)
        end,
      },
    },
    init = function()
      -- Configuração para adicionar o Aerial no Neo-tree
      vim.api.nvim_create_autocmd("BufWinEnter", {
        pattern = "*",
        callback = function()
          -- Se o buffer atual é o Neo-Tree
          if vim.bo.filetype == "neo-tree" then
            -- Verificar se o Neo-Tree está no painel esquerdo
            local win = vim.api.nvim_get_current_win()
            local buf = vim.api.nvim_get_current_buf()
            local is_filesystem = vim.b[buf].neo_tree_source == "filesystem"
            
            if is_filesystem then
              -- Esperar um pouco para garantir que Neo-tree está completamente carregado
              vim.defer_fn(function()
                -- Abrir o Aerial apenas se ainda não estiver aberto
                if vim.fn.bufwinid("aerial") == -1 then
                  vim.cmd("AerialToggle!")
                end
              end, 100)
            end
          end
        end
      })
    end
  },
  -- Make sure aerial is installed
  {
    "stevearc/aerial.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "neovim/nvim-lspconfig",
    },
    event = "VeryLazy",
    cmd = { "AerialToggle", "AerialOpen", "AerialInfo" },
    keys = {
      { "<leader>o", "<cmd>AerialToggle!<cr>", desc = "Toggle Outline" },
    },
    opts = {
      -- This is critical to make it work with Neo-tree
      manage_folds = false,
      layout = {
        -- Outline visível ao lado do Explorer
        default_direction = "right", -- Exibe no lado direito do Neo-tree
        placement = "window", -- Coloca em uma janela separada
        width = 25, -- Largura fixa
      },
      -- Attach to all buffers
      attach_mode = "global",
      backends = { "lsp", "treesitter", "markdown", "man" },
      show_guides = true,
      filter_kind = false,
      guides = {
        mid_item = "├ ",
        last_item = "└ ",
        nested_top = "│ ",
        whitespace = "  ",
      },
      keymaps = {
        ["[y"] = "actions.prev",
        ["]y"] = "actions.next",
        ["[Y"] = "actions.prev_up",
        ["]Y"] = "actions.next_up",
        ["{"] = false,
        ["}"] = false,
        ["[["] = false,
        ["]]"] = false,
      },
      close_on_select = false,
      highlight_on_hover = true,
      open_automatic = true,
      ignore = {
        filetypes = {},
        buftypes = {},
        wintypes = {},
      },
      icons = {
        Array = "󰅪 ",
        Boolean = " ",
        Class = "󰠱 ",
        Constant = "󰏿 ",
        Constructor = " ",
        Enum = " ",
        EnumMember = " ",
        Event = " ",
        Field = " ",
        File = "󰈙 ",
        Function = "󰊕 ",
        Interface = " ",
        Key = "󰌋 ",
        Method = "󰆧 ",
        Module = " ",
        Namespace = "󰌗 ",
        Null = "󰟢 ",
        Number = "󰎠 ",
        Object = "󰅩 ",
        Operator = "󰆕 ",
        Package = " ",
        Property = " ",
        String = " ",
        Struct = "󰙅 ",
        TypeParameter = "󰊄 ",
        Variable = "󰆧 ",
      },
      nerd_font = "auto",
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    optional = true,
    opts = {
      window = {
        width = 30,
        mappings = {
          ["o"] = "toggle_outline",
        },
      },
      commands = {
        toggle_outline = function()
          vim.cmd("AerialToggle!")
        end,
      },
    },
  },
} 