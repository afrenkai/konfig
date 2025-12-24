require("options")
require("plugins")
require("remaps")
require("autocmd")

-- from bufferline repo readme :)
vim.opt.termguicolors = true
require("bufferline").setup{}
