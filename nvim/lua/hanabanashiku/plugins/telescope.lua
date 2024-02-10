require 'telescope'.setup {
    defaults = {
        file_ignore_patterns = {
            "node_modules",
            "bin",
            "obj",
            "lib",
            "dist",
            "build",
            ".cargo",
            ".cache",
            ".vite",
            ".parcel-cache",
            "package-lock.json",
            ".DS_Store",
            ".git"
        }
    }
}