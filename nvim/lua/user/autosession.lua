require 'auto-session'.setup {
    auto_session_suppress_dirs = { "~/", "~/code", "/", "~/Downloads", "~/Documents", "~/Desktop" },
    auto_save_enabled = true,
    auto_restore_enabled = true,
    auto_session_use_git_branch = true,
    pre_save_cmds = {
        function()
            require 'neo-tree.sources.manager'.close_all()
        end
    }
}
