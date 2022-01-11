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
require("nvim-tree").setup({
    --open_on_setup = true,
})

local diagnostics_indicator = function(count, level, diagnostics_dict, context)
  local s = " "
  for e, n in pairs(diagnostics_dict) do
    local sym = e == "error" and ERROR
      or (e == "warning" and WARN or HINT )
    s = s .. n .. sym
  end
  return s
end

require("bufferline").setup({
    options = {
        diagnostics = "nvim_lsp",
        buffer_close_icon = '',
        --diagnostics_indicator = diagnostics_indicator
    }
})
--print("uh")
