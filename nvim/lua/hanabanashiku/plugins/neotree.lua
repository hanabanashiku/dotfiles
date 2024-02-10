require'neo-tree'.setup {
     filesystem = {
        never_show = {
            ".DS_Store",
            "thumbs.db"
        },
        hijack_netrw_behavior = "open_current",
        use_libuv_file_watcher = true,
    }
}