local dap = require "dap"

dap.adapters.rust = {
        type = 'executable',
        attach = {
                pidProperty = "pid",
                pidSelect = "ask"
        },
        command = 'lldb-vscode',
        env = {
                LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"
        },
        name = "lldb"
}

dap.configurations.rust = {
        {
                type = "rust",
                name = "Debug",
                request = "launch"
        }
}
