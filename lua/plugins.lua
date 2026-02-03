local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end


---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)
require("lazy").setup(
	{require("plugins.guess_indent"),
	require("plugins.gitsigns"),
	require("plugins.indent_line"),
	require("plugins.neo_tree"),
	require("plugins.autopairs"),
	require("plugins.vimtex"),
	require("plugins.lazydev"),
	require("plugins.tokyonight"),
	require("plugins.todo_comments"),
	require("plugins.treesitter"),
	-- require("plugins.subwaysurfers"),
	require("plugins.web_devicons"),
	require("plugins.bufferline"),
	require("plugins.lsp"),
	require("plugins.telescope"),
	}, {})
