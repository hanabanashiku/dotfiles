require 'auto-session'.setup {
    log_level = "error",
    auto_session_suppress_dirs = { "~", "~/code", "~/Downloads", "~/Documents", "/" },
    auto_restore_enabled = false,
    pre_save_cmds = {
        function()
            require 'neo-tree.sources.manager'.close_all()
        end
    }
}
