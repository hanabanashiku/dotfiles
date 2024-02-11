local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/omnisharp/"
local latest = 'v1.39.11'
local fw = '-net6.0'
local os = vim.loop.os_uname().sysname

if (fn.empty(fn.glob(install_path)) > 0) then
    print('Downloading Omnisharp')
    local binary = ''
    if os == 'Linux' then
        binary = 'omnisharp-linux-x64'..fw..'.tar.gz'
    elseif os == 'Darwin' then
        binary = 'omnisharp-osx'..fw..'.tar.gz'
    else
        binary = 'omnisharp-win-x64'..fw..'.zip'
    end

    local cmd = 'mkdir -p '..install_path..' && wget -c https://github.com/OmniSharp/omnisharp-roslyn/releases/download/'..latest..'/'..binary..' -O - | tar xz -C '..install_path
    vim.fn.jobstart(cmd)
    print('Downloaded '..binary)
end
