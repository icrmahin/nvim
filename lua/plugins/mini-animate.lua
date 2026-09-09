return {
    {
        "nvim-mini/mini.animate",
        opts = {
            open = {
                enable = true,
                winconfig = function(win_id)
                    if not vim.api.nvim_win_is_valid(win_id) then
                        return {}
                    end

                    return require("mini.animate").gen_winconfig.static({ steps = 15 })(win_id)
                end,
            },
            close = { enable = false },
        },
    },
}
