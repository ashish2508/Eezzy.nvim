local config=require("PurpleILike.config")
local hsl=require("PurpleILike.utils").hsl

local M={
standardWhite="#ffffff",
standardBlack="#000000",
}

if vim.o.background=="light" then
M.editorBackground=config.transparent and "NONE" or hsl(258,20,95)
M.popupBackground=hsl(260,24,98)
M.menuOptionBackground=hsl(260,18,92)

M.mainText=hsl(258,30,15)
M.inactiveText=hsl(260,10,50)
M.lineNumberText=hsl(260,20,45)
M.lineNumberTextActive=hsl(260,40,35)
M.selectedText=hsl(258,25,90)
M.border=hsl(260,18,88)

M.syntaxConstant=hsl(265,80,40)
M.syntaxKeyword=hsl(280,70,35)
M.syntaxFunction=hsl(250,70,35)
M.syntaxProperty=hsl(258,30,15)

M.errorText=hsl(340,70,40)
M.warningText=hsl(30,70,45)
M.commentText=hsl(260,10,50)
M.stringText=hsl(150,40,35)
M.successText=hsl(142,60,35)
else
M.editorBackground=config.transparent and "NONE" or hsl(258,20,6)
M.popupBackground=hsl(258,15,11)
M.menuOptionBackground=hsl(258,15,13)

M.mainText=hsl(258,40,90)
M.inactiveText=hsl(260,15,60)
M.lineNumberText=hsl(260,20,40)
M.lineNumberTextActive=hsl(260,25,80)
M.selectedText=hsl(258,35,25)
M.border=hsl(258,15,20)

M.syntaxConstant=hsl(265,80,70)
M.syntaxKeyword=hsl(280,80,75)
M.syntaxFunction=hsl(250,80,75)
M.syntaxProperty=hsl(258,40,90)

M.errorText=hsl(350,70,60)
M.warningText=hsl(30,70,70)
M.commentText=hsl(260,15,60)
M.stringText=hsl(145,40,65)
M.successText=hsl(142,60,50)
end

return M

