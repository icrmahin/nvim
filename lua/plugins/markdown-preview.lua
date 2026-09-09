return {
    {
        "iamcco/markdown-preview.nvim",
        keys = {
            { "<leader>cp", ft = "markdown", "<cmd>MarkdownPreview<cr>", desc = "Markdown Preview" },
        },
        init = function()
            vim.g.mkdp_theme = "dark" -- It's used to light i converted it to the dark
        end,
    },
}
