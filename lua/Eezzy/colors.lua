local config = require("Eezzy.config")

local M = {
	standardBlack = "#000000",
}

M.editorBackground = config.transparent and "NONE" or "#050706"
M.currentLineBackground = "#0D120F"
M.selectionBackground = "#17251D"
M.popupBackground = "#0A0F0C"
M.menuOptionBackground = "#111A15"
M.border = "#1B2A22"
M.mutedForeground = "#7A8494"
M.mainText = "#DDE5EE"
M.selectedText = "#F8FAFC"
M.inactiveText = "#8792A2"
M.lineNumberText = "#343D4B"
M.lineNumberTextActive = "#A7B0BE"
M.commentText = "#6F7A89"

M.syntaxConstant = "#7EA6FF"
M.syntaxKeyword = "#FF5C8A"
M.syntaxFunction = "#4DD6C3"
M.syntaxProperty = "#7CF9B8"

M.stringText = "#A6D88A"
M.syntaxNumber = "#C792EA"
M.syntaxType = "#FFB86C"
M.syntaxClass = "#D2FF72"

M.errorText = "#FF6B6B"
M.warningText = "#FFD166"
M.successText = "#74D66A"
M.infoText = "#5CCFE6"
M.hintText = "#A6E3A1"
M.linkText = "#80BFFF"

-- Backward-compatible aliases for integrations and user overrides.
M.bg = M.editorBackground
M.syntaxError = M.errorText

return M
