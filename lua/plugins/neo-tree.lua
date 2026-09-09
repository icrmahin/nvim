return {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
        close_if_last_window = true,

        default_component_configs = {
            indent = {
                expander_collapsed = "",
                expander_expanded = "",
            },
        },

        commands = {
            toggle_filesystem = function()
                local manager = require("neo-tree.sources.manager")
                local source_state = manager.get_state("filesystem")
                if source_state and source_state.winid and vim.api.nvim_win_is_valid(source_state.winid) then
                    vim.cmd("Neotree close")
                    return
                end
                pcall(vim.cmd, "Neotree source=filesystem toggle")
            end,
            toggle_buffers = function()
                local manager = require("neo-tree.sources.manager")
                local source_state = manager.get_state("buffers")
                if source_state and source_state.winid and vim.api.nvim_win_is_valid(source_state.winid) then
                    vim.cmd("Neotree close")
                    return
                end
                pcall(vim.cmd, "Neotree source=buffers toggle")
            end,
            toggle_git_status = function()
                local manager = require("neo-tree.sources.manager")
                local source_state = manager.get_state("git_status")
                if source_state and source_state.winid and vim.api.nvim_win_is_valid(source_state.winid) then
                    vim.cmd("Neotree close")
                    return
                end
                pcall(vim.cmd, "Neotree source=git_status toggle")
            end,
            copy_selector = function(state)
                local node = state.tree:get_node()
                if not node then
                    return
                end

                local filepath = node:get_id()
                local filename = node.name
                local modify = vim.fn.fnamemodify

                local vals = {
                    ["FILENAME"] = filename,
                    ["PATH"] = filepath,
                    ["PATH (CWD)"] = modify(filepath, ":."),
                    ["PATH (HOME)"] = modify(filepath, ":~"),
                    ["URI"] = vim.uri_from_fname(filepath),
                }

                local options = vim.tbl_filter(function(k)
                    return vals[k] ~= ""
                end, vim.tbl_keys(vals))
                if vim.tbl_isempty(options) then
                    vim.notify("Neo-tree: nothing to copy", vim.log.levels.WARN)
                    return
                end
                table.sort(options)

                local neo_tree_winid = vim.api.nvim_get_current_win()
                local saved_view = vim.fn.winsaveview()
                local saved_line = vim.api.nvim_win_get_cursor(neo_tree_winid)[1]

                vim.ui.select(options, {
                    prompt = "Choose to copy to clipboard:",
                    format_item = function(item)
                        return ("%s: %s"):format(item, vals[item])
                    end,
                }, function(choice)
                    local result = choice and vals[choice]
                    if result then
                        vim.fn.setreg("+", result)
                        vim.notify(("Copied: %s"):format(result))
                    end

                    vim.schedule(function()
                        if vim.api.nvim_win_is_valid(neo_tree_winid) then
                            vim.api.nvim_set_current_win(neo_tree_winid)
                            vim.api.nvim_win_set_cursor(neo_tree_winid, { saved_line, 0 })
                            vim.fn.winrestview(saved_view)
                        end
                    end)
                end)
            end,
        },

        window = {
            mappings = {
                ["Y"] = "copy_selector",
                ["e"] = "noop",
                ["<leader>et"] = "toggle_filesystem",
                ["<leader>eb"] = "toggle_buffers",
                ["<leader>eg"] = "toggle_git_status",
                ["P"] = {
                    "toggle_preview",
                    config = {
                        use_float = true,
                        use_snacks_image = true,
                        title = "Neo-tree Preview",
                    },
                },
            },
        },

        filesystem = {
            bind_to_cwd = false,
            use_libuv_file_watcher = true,
            filtered_items = {
                visible = true, -- when true, they will just be displayed differently than normal items
                never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
                    ".DS_Store",
                    "thumbs.db",
                },
            },
        },
    },
}
