local config            = require("Eezzy.config")
local hsl               = require("Eezzy.utils").hsl

local M                 = {
  standardBlack = "#000000",
}

M.editorBackground      = config.transparent and "NONE" or "#080808"
M.currentLineBackground = "#71717a"
M.selectionBackground   = "#3c4848"
M.popupBackground       = "#141818"
M.menuOptionBackground  = "#1e2424"
M.border                = "#1e2424"
M.mutedForeground       = "#909090"
M.mainText              = "#d8d8d8"
M.selectedText          = "#f8f8f8"
M.inactiveText          = "#909090"
M.lineNumberText        = "#3c4848"
M.lineNumberTextActive  = "#909090"
M.commentText           = "#909090"

M.syntaxConstant        = "#6080ff"
M.syntaxKeyword         = "#ff0e6b"
M.syntaxFunction        = "#40c4aa"
M.syntaxProperty        = "#48fb9f"

M.stringText            = "#8bbb81"
M.syntaxNumber          = "#c080ff"
M.syntaxType            = "#ff9020"
M.syntaxClass           = "#a0ff20"

M.errorText             = "#e54c4c"
M.warningText           = "#f2be59"
M.successText           = "#54aa46"

return M
