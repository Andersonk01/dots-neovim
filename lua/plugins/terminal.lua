return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = true,
  keys = {
    { "<leader>tt", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle Terminal (Float)" },
    { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Toggle Terminal (Horizontal)" },
    { "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Toggle Terminal (Vertical)" },
  },
  opts = {
    open_mapping = [[<c-\>]],
    direction = "float",
    shade_terminals = true,
    shading_factor = 2,
    float_opts = {
      border = "curved",
      winblend = 0,
    },
  },
} 