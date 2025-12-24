vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	desc = "Configure LaTeX files for Tree-sitter highlighting",
	pattern = { "tex", "latex" },
	group = vim.api.nvim_create_augroup("latex-treesitter", { clear = true }),
	callback = function()
		vim.treesitter.start()
		vim.cmd("syntax off")
	end,
})

vim.api.nvim_create_autocmd("BufNewFile", {
	desc = "Insert LaTeX template for new .tex files",
	pattern = "*.tex",
	group = vim.api.nvim_create_augroup("latex-template", { clear = true }),
	callback = function()
		local template = {
			"\\documentclass{article}",
			"",
			"% Packages",
			"\\usepackage[utf8]{inputenc}",
			"\\usepackage[T1]{fontenc}",
			"\\usepackage{amsmath, amssymb, amsthm}",
			"\\usepackage{graphicx}",
			"\\usepackage{hyperref}",
			"",
			"% Title information",
			"\\title{Document Title}",
			"\\author{Your Name}",
			"\\date{\\today}",
			"",
			"\\begin{document}",
			"",
			"\\maketitle",
			"",
			"\\section{Introduction}",
			"",
			"Start writing here.",
			"",
			"\\end{document}",
		}

		vim.api.nvim_buf_set_lines(0, 0, -1, false, template)

		vim.api.nvim_win_set_cursor(0, { 21, 0 })

		vim.bo.modified = false
	end,
})

