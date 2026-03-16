return {
  {
    name = "dracula_pro",
    dir = vim.fn.expand("~/.local/share/nvim/site/pack/themes/start/dracula_pro"),
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.dracula_colorterm = 0
      vim.cmd("colorscheme dracula_pro")
    end,
  },
}
