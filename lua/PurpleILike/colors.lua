local config=require("PurpleILike.config")
local hsl=require("PurpleILike.utils").hsl

local M={
standardWhite="#ffffff",
standardBlack="#000000",
}

if vim.o.background=="light" then
M.editorBackground=config.transparent and "NONE" or "#ffffff"
M.popupBackground=hsl(24,30,96)
M.menuOptionBackground=hsl(24,25,92)

M.mainText=hsl(24,40,15)
M.inactiveText=hsl(24,15,50)
M.lineNumberText=hsl(24,18,45)
M.lineNumberTextActive=hsl(24,35,35)
M.selectedText=hsl(24,25,90)
M.border=hsl(24,20,85)

M.syntaxConstant=hsl(13,70,40) -- soft red
M.syntaxKeyword=hsl(24,90,45)  -- bright orange
M.syntaxFunction=hsl(6,75,38)  -- deeper red
M.syntaxProperty=hsl(24,40,15)

M.errorText=hsl(0,80,42)
M.warningText=hsl(30,80,45)
M.commentText=hsl(24,15,50)
M.stringText=hsl(110,30,35) -- desaturated green for balance
M.successText=hsl(110,45,38)
else
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
end

return M

