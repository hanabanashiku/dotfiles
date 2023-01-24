local spotify = require('nvim-spotify')

spotify.setup {
    status = {
        update_interval = 10000,
        format = '%a - %t'
    }
}

vim.g.spotify_token='ZDU0ZGIxNzg2ZGMGZmYmE0N2ExOWY4ZjVkNDAzMTk6Y2U4ZWFjMmI4OWFjNGM0YmIzNWE3NzI3NDE2MWVmNmE='
