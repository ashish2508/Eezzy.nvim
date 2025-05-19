local config = require("vercel.config")
local hsl = require("vercel.utils").hsl

local M = {
	standardWhite = "#ffffff",
	standardBlack = "#000000",
}

if vim.o.background == "light" then
	M.editorBackground = config.transparent and "NONE" or hsl(1, 9, 2)
	M.popupBackground = hsl(285, 10, 100)
	M.menuOptionBackground = hsl(281, 0, 78)

	M.mainText = hsl(280, 10, 4)
	M.inactiveText = hsl(0, 3, 81)
	M.lineNumberText = hsl(281, 13, 9)
	M.lineNumberTextActive = hsl(281, 13, 67)
	M.selectedText = hsl(280, 0, 83)
	M.border = hsl(280, 30, 98)

	M.syntaxConstant = hsl(211, 100, 42)
	M.syntaxKeyword = hsl(336, 65, 45)
	M.syntaxFunction = hsl(274, 71, 43)
	M.syntaxProperty = hsl(0, 0, 4)

	M.errorText = hsl(3, 62, 42)
	M.warningText = hsl(24, 79, 43)
	M.commentText = hsl(0, 0, 40)
	M.stringText = hsl(139, 79, 28)
	M.successText = hsl(142.1, 76.2, 36.3)
else
	M.editorBackground = config.transparent and "NONE" or hsl(240, 10, 3.9)
	M.popupBackground = hsl(240, 3.7, 15.9)
	M.menuOptionBackground = hsl(0, 0, 17)

	M.mainText = hsl(0, 0, 93)
	M.inactiveText = hsl(0, 0, 64)
	M.lineNumberText = hsl(0, 0, 30)
	M.lineNumberTextActive = hsl(0, 0, 95)
	M.selectedText = hsl(0, 0, 93)
	M.border = hsl(0, 0, 13)

	M.syntaxConstant = hsl(210, 100, 66)
	M.syntaxKeyword = hsl(341, 90, 67)
	M.syntaxFunction = hsl(275, 80, 71)
	M.syntaxProperty = hsl(0, 0, 93)

	M.errorText = hsl(5, 61, 54)
	M.warningText = hsl(40, 71, 73)
	M.commentText = hsl(0, 0, 64)
	M.stringText = hsl(131, 43, 57)
	M.successText = hsl(142.1, 76.2, 36.3)
end

return M
