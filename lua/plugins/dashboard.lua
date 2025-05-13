return {
  -- Configuração para desativar o snacks.nvim dashboard
  {
    "snacks.nvim",
    optional = true,
    opts = {
      dashboard = {
        enable = false,
      },
    },
  },
  
  -- Desativar o Alpha Dashboard padrão 
  {
    "goolord/alpha-nvim",
    optional = true,
    enabled = false,
  },
  
  -- Desativar o mini.starter
  {
    "echasnovski/mini.starter",
    enabled = false,
  },
  
  -- Usar dashboard-nvim como alternativa
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-telescope/telescope.nvim",
    },
    opts = function()
      local logo = [[
       ██╗  ██╗ █████╗  ██████╗██╗  ██╗███████╗██████╗ ███╗   ███╗ █████╗ ███╗   ██╗
       ██║  ██║██╔══██╗██╔════╝██║ ██╔╝██╔════╝██╔══██╗████╗ ████║██╔══██╗████╗  ██║
       ███████║███████║██║     █████╔╝ █████╗  ██████╔╝██╔████╔██║███████║██╔██╗ ██║
       ██╔══██║██╔══██║██║     ██╔═██╗ ██╔══╝  ██╔══██╗██║╚██╔╝██║██╔══██║██║╚██╗██║
       ██║  ██║██║  ██║╚██████╗██║  ██╗███████╗██║  ██║██║ ╚═╝ ██║██║  ██║██║ ╚████║
       ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝
                                                                  
            « The quieter you become, the more you are able to hear... »                
      ]]

      -- Utility function to open telescope with specific picker
      local function telescope(picker)
        return function()
          require("telescope.builtin")[picker]()
        end
      end

      local opts = {
        theme = "doom",
        hide = {
          statusline = true,
          tabline = false,
          winbar = false,
        },
        config = {
          header = vim.split(logo, "\n"),
          center = {
            {
              icon = " ",
              icon_hl = "DashboardIcon",
              desc = "Find File",
              desc_hl = "DashboardDesc",
              key = "f",
              key_hl = "DashboardKey",
              action = "Telescope find_files",
            },
            {
              icon = " ",
              icon_hl = "DashboardIcon",
              desc = "Recent Files",
              desc_hl = "DashboardDesc",
              key = "r",
              key_hl = "DashboardKey",
              action = "Telescope oldfiles",
            },
            {
              icon = " ",
              icon_hl = "DashboardIcon",
              desc = "Find Word",
              desc_hl = "DashboardDesc",
              key = "g",
              key_hl = "DashboardKey",
              action = "Telescope live_grep",
            },
            {
              icon = "󰮗 ",
              icon_hl = "DashboardIcon",
              desc = "New File",
              desc_hl = "DashboardDesc",
              key = "n",
              key_hl = "DashboardKey", 
              action = "enew",
            },
            {
              icon = " ",
              icon_hl = "DashboardIcon",
              desc = "Config Files",
              desc_hl = "DashboardDesc",
              key = "c",
              key_hl = "DashboardKey",
              action = function()
                vim.cmd("cd ~/.config/nvim")
                require("telescope.builtin").find_files()
              end,
            },
            {
              icon = " ", 
              icon_hl = "DashboardIcon",
              desc = "Lazy Plugin Manager",
              desc_hl = "DashboardDesc",
              key = "l",
              key_hl = "DashboardKey",
              action = "Lazy",
            },
            {
              icon = " ",
              icon_hl = "DashboardIcon",
              desc = "Quit Neovim",
              desc_hl = "DashboardDesc",
              key = "q",
              key_hl = "DashboardKey",
              action = "qa",
            },
          },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms" }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      end
      
      return opts
    end,
    config = function(_, opts)
      -- Highlight setup
      vim.cmd([[
        highlight! link DashboardHeader String
        highlight! link DashboardFooter Comment
        highlight! link DashboardIcon Type
        highlight! link DashboardKey Number
        highlight! link DashboardDesc Keyword
      ]])

      -- Automatically close dashboard when opening a file
      vim.api.nvim_create_autocmd("BufEnter", {
        callback = function()
          if vim.bo.filetype == "dashboard" and #vim.fn.getbufinfo({ buflisted = true }) > 1 then
            vim.defer_fn(function()
              if vim.bo.filetype == "dashboard" then
                vim.cmd('quit')
              end
            end, 0)
          end
        end,
        group = vim.api.nvim_create_augroup("DashboardClose", { clear = true }),
      })

      require("dashboard").setup(opts)
    end,
  },
  
  -- Desativar a dashboard do Snacks se estiver configurada como extra
  {
    "snacks.nvim",
    optional = true,
    init = function()
      -- Definir um autocmd para fechar a janela do dashboard do Snacks quando um arquivo for aberto
      vim.api.nvim_create_autocmd("BufEnter", {
        callback = function()
          if vim.bo.filetype == "snacks_dashboard" and #vim.fn.getbufinfo({ buflisted = true }) > 1 then
            vim.defer_fn(function()
              if vim.bo.filetype == "snacks_dashboard" then
                vim.cmd('quit')
              end
            end, 0)
          end
        end,
        group = vim.api.nvim_create_augroup("SnacksDashboardClose", { clear = true }),
      })
    end,
  },
} 