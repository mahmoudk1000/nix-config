vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
		if not lang then
			return
		end

		local ok = pcall(vim.treesitter.language.add, lang)
		if ok then
			vim.treesitter.start()
		end
	end,
})
