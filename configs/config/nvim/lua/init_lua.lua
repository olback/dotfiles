local ERROR = " "
local WARN = " "
local HINT = " "

require('lsp')

local signs = {Error = ERROR, Warn = WARN, Hint = HINT, Info = HINT}
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end

require("lsp-colors").setup({})
require('trouble').setup({use_diagnostic_signs = true})
require("todo-comments").setup({
    keywords = {
        FIX = {icon = ERROR},
        TODO = {icon = " "},
        HACK = {icon = " "},
        WARN = {icon = WARN},
        PERF = {icon = " "},
        NOTE = {icon = HINT}
    }
})

-- print("uh")
