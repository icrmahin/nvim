-- Options are automatically loaded before lazy.nvim startup.
require("config.remote_clipboard").setup()

vim.opt.relativenumber = true
vim.g.autoformat = false
vim.opt.cursorline = false

-- No smooth scroll / mouse animations, keep it simple and instant
vim.opt.smoothscroll = false
vim.opt.mousescroll = "ver:1,hor:1"
