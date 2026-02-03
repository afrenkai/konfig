return	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		build = ":TSUpdate",
		main = "nvim-treesitter.configs",
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"diff",
				"html",
				-- "latex",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"query",
				"vim",
				"vimdoc",
			},
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "ruby" },
				disable = function(lang, buf)
					-- if lang == "latex" then
					-- 	return vim.b[buf].vimtex_main ~= nil and vim.g.vimtex_syntax_enabled == 1
					-- end
					return false
				end,
			},
			indent = { enable = true, disable = { "ruby" } },
		},
	}
