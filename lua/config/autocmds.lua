-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Adicionar no final do arquivo
-- Fechar automaticamente as telas iniciais quando abrir arquivos
local dash_filetypes = { "alpha", "starter", "ministart", "dashboard", "snacks_dashboard" }

-- Fechar dashboards quando abrir arquivos
vim.api.nvim_create_autocmd("BufAdd", {
  callback = function()
    if #vim.fn.getbufinfo({ buflisted = true }) > 1 then
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        local ft = vim.api.nvim_buf_get_option(buf, "filetype")
        if vim.tbl_contains(dash_filetypes, ft) then
          -- Tentativa de fechar a janela do dashboard
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            local win_buf = vim.api.nvim_win_get_buf(win)
            if win_buf == buf then
              vim.api.nvim_win_close(win, true)
              break
            end
          end
        end
      end
    end
  end,
  group = vim.api.nvim_create_augroup("CloseDashboards", { clear = true }),
})

-- Fechar quaisquer dashboards quando mudar para outro buffer
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    if vim.bo.buftype ~= "" or vim.bo.filetype == "" then
      return
    end
    
    -- Se este buffer não for um dashboard, feche todos os dashboards
    local curr_ft = vim.bo.filetype
    if not vim.tbl_contains(dash_filetypes, curr_ft) then
      vim.defer_fn(function() 
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          local ft = vim.api.nvim_buf_get_option(buf, "filetype")
          if vim.tbl_contains(dash_filetypes, ft) then
            -- Tentativa de fechar a janela do dashboard
            for _, win in ipairs(vim.api.nvim_list_wins()) do
              local win_buf = vim.api.nvim_win_get_buf(win)
              if win_buf == buf then
                vim.api.nvim_win_close(win, true)
                break
              end
            end
          end
        end
      end, 10) -- Pequeno delay para evitar problemas
    end
  end,
  group = vim.api.nvim_create_augroup("CloseDashboardsOnBufferEnter", { clear = true }),
})
