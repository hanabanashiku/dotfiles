require('toggleterm').setup{
    size = function(term)
        if term.direction == "horizontal" then
            return 10
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,
    autochdir = true,
    float_opts = {
        border = "curved",
        highlights = {
            border = "Normal",
            background = "Normal"
        }
    }
}
