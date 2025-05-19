local config=require("PurpleILike.config")
local hsl=require("PurpleILike.utils").hsl

local M={
standardWhite="#ffffff",
standardBlack="#000000",
}

if vim.o.background=="light" then
M.editorBackground=config.transparent and "NONE" or "#ffffff"
M.popupBackground=hsl(260,10,97)
M.menuOptionBackground=hsl(260,8,92)

M.mainText=hsl(260,25,15)
M.inactiveText=hsl(260,10,50)
M.lineNumberText=hsl(260,12,45)
M.lineNumberTextActive=hsl(260,25,35)
M.selectedText=hsl(260,20,90)
M.border=hsl(260,8,85)

M.syntaxConstant=hsl(265,60,40)
M.syntaxKeyword=hsl(280,55,38)
M.syntaxFunction=hsl(250,55,38)
M.syntaxProperty=hsl(260,25,15)

M.errorText=hsl(0,70,42)
M.warningText=hsl(30,70,45)
M.commentText=hsl(260,10,50)
M.stringText=hsl(150,35,40)
M.successText=hsl(142,55,38)
else
M.editorBackground=config.transparent and "NONE" or "#000000"
M.popupBackground=hsl(260,6,12)
M.menuOptionBackground=hsl(260,6,14)

M.mainText=hsl(260,30,88)
M.inactiveText=hsl(260,12,60)
M.lineNumberText=hsl(260,14,40)
M.lineNumberTextActive=hsl(260,20,75)
M.selectedText=hsl(260,25,25)
M.border=hsl(260,6,18)

M.syntaxConstant=hsl(265,70,70)
M.syntaxKeyword=hsl(280,70,75)
M.syntaxFunction=hsl(250,70,75)
M.syntaxProperty=hsl(260,30,88)

M.errorText=hsl(0,65,60)
M.warningText=hsl(30,65,70)
M.commentText=hsl(260,12,60)
M.stringText=hsl(145,35,60)
M.successText=hsl(142,55,50)
end

return M

