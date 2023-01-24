require("neo-tree").setup({
    close_if_last_window = true,
    enable_git_status = true,
    filesystem = {
        follow_current_file = true,
        hijack_netrw_behavior = "open_current"
    },
    window = {
        width = 30
    },
    event_handlers = {
        { event = "neo_tree_buffer_enter", handler = function(_) vim.opt_local.signcolumn = "auto" end },
    },
})
