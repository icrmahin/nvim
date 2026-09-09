-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

--- ============================================================= ---

-- Disable spell check in markdown files
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown" },
    callback = function()
        vim.opt_local.spell = false
    end,
})

--- ============================================================= ---

-- Run Mason updates after Lazy finishes syncing
vim.api.nvim_create_autocmd("User", {
    group = vim.api.nvim_create_augroup("AlphaLazyThenMason", { clear = true }),
    pattern = "LazySync",
    callback = function()
        vim.schedule(function()
            vim.cmd("MasonUpdate")
            vim.cmd("MasonUpdateAll")
        end)
    end,
})
