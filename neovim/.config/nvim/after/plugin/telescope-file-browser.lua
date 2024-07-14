local bind = vim.keymap.set

bind("n", "<space>.", function()
	require("telescope").extensions.file_browser.file_browser(
    {path_display = { "absolute" }}
    )
end)
