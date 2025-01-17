local lsp_name = "cmake"
local config = require("lspmanager.utilities").get_config(lsp_name)
local installers = require("lspmanager.installers")
local os = require("lspmanager.os")

local cmd_exec = "./venv/bin/cmake-language-server"

if os.get_os() == os.OSes.Windows then
    cmd_exec = cmd_exec .. ".cmd"
end

config.default_config.cmd[1] = cmd_exec

return vim.tbl_extend("error", config, {
    install_script = function()
        return installers.pip.install_script({ "cmake-language-server" })
    end,
})
