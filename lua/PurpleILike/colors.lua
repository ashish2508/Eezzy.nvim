local config=require("PurpleILike.config")
local hsl=require("PurpleILike.utils").hsl

local M={
standardBlack="#000000",
}

M.editorBackground=config.transparent and "NONE" or "#000000"
M.popupBackground=hsl(24,10,12)
M.menuOptionBackground=hsl(24,10,14)

M.mainText=hsl(24,35,88)
M.inactiveText=hsl(24,15,60)
M.lineNumberText=hsl(24,18,40)
M.lineNumberTextActive=hsl(24,30,75)
M.selectedText=hsl(24,25,25)
M.border=hsl(24,10,18)

M.syntaxConstant=hsl(13,75,70)
M.syntaxKeyword=hsl(24,90,75)
M.syntaxFunction=hsl(6,80,72)
M.syntaxProperty=hsl(24,35,88)

M.errorText=hsl(0,75,60)
M.warningText=hsl(30,80,70)
M.commentText=hsl(24,15,60)
M.stringText=hsl(110,30,60)
M.successText=hsl(110,45,50)

return M

