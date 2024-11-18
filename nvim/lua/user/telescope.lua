require 'telescope'.setup {
    defaults =
    {
            file_ignore_patterns = {
                "node_modules",
                "bin",
                "obj",
                ".cache",
                ".parcel_cache",
                ".git",
                ".idea",
                ".DS_Store"
            }
    }
}
