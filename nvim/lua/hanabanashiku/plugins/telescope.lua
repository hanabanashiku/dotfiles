require 'telescope'.setup {
    defaults = {
        file_ignore_patterns = {
            "node_modules",
            "bin",
            "obj",
            "lib",
            "dist",
            "lib",
            "build",
            ".cargo",
            ".parcel-cache"
        }
    }
}
