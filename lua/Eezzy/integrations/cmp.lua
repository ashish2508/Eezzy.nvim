local colors = require("Eezzy.colors")

local M = {}

--- Completion menu highlights
function M.highlights()
	return {
		CmpItemAbbr = { fg = colors.mainText },
		CmpItemAbbrDeprecated = { fg = colors.commentText, strikethrough = true },
		CmpItemKind = { fg = colors.syntaxFunction },
		CmpItemMenu = { fg = colors.inactiveText },
		CmpItemAbbrMatch = { fg = colors.syntaxFunction, bold = true },
		CmpItemAbbrMatchFuzzy = { fg = colors.syntaxFunction, bold = true },

		-- kind support
		CmpItemKindSnippet = { fg = colors.stringText },
		CmpItemKindKeyword = { fg = colors.syntaxKeyword },
		CmpItemKindText = { fg = colors.mainText },
		CmpItemKindMethod = { fg = colors.syntaxFunction },
		CmpItemKindConstructor = { fg = colors.syntaxClass },
		CmpItemKindFunction = { fg = colors.syntaxFunction },
		CmpItemKindFolder = { fg = colors.syntaxConstant },
		CmpItemKindModule = { fg = colors.syntaxConstant },
		CmpItemKindConstant = { fg = colors.syntaxConstant },
		CmpItemKindField = { fg = colors.syntaxProperty },
		CmpItemKindProperty = { fg = colors.syntaxProperty },
		CmpItemKindEnum = { fg = colors.syntaxType },
		CmpItemKindUnit = { fg = colors.syntaxNumber },
		CmpItemKindClass = { fg = colors.syntaxClass },
		CmpItemKindVariable = { fg = colors.mainText },
		CmpItemKindFile = { fg = colors.linkText },
		CmpItemKindInterface = { fg = colors.stringText },
		CmpItemKindColor = { fg = colors.syntaxProperty },
		CmpItemKindReference = { fg = colors.syntaxConstant },
		CmpItemKindEnumMember = { fg = colors.syntaxConstant },
		CmpItemKindStruct = { fg = colors.syntaxFunction },
		CmpItemKindValue = { fg = colors.syntaxNumber },
		CmpItemKindEvent = { fg = colors.syntaxFunction },
		CmpItemKindOperator = { fg = colors.syntaxKeyword },
		CmpItemKindTypeParameter = { fg = colors.syntaxType },
		CmpItemKindCopilot = { fg = colors.linkText },
	}
end

return M
