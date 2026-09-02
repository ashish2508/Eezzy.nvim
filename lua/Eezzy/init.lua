local colors = require("Eezzy.colors")
local config = require("Eezzy.config")
local utils = require("Eezzy.utils")

local M = {}

---@param options Options?
function M.setup(options)
	options = options or {}
	setmetatable(config, { __index = vim.tbl_deep_extend("force", config.defaults, options) })

	M.highlights = { bufferline = {}, navic = {} }
	M.highlights.bufferline = require("Eezzy.integrations.bufferline").highlights(config)
	M.highlights.navic = require("Eezzy.integrations.navic").highlights(config)
end

function M.colorscheme()
	vim.api.nvim_command("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.api.nvim_command("syntax reset")
	end

	vim.g.VM_theme_set_by_colorscheme = true
	vim.o.termguicolors = true
	vim.g.colors_name = "Eezzy"

	M.set_terminal_colors()
	M.set_groups()
end

function M.set_terminal_colors()
	vim.g.terminal_color_0 = colors.editorBackground
	vim.g.terminal_color_1 = colors.errorText
	vim.g.terminal_color_2 = colors.successText
	vim.g.terminal_color_3 = colors.warningText
	vim.g.terminal_color_4 = colors.syntaxConstant
	vim.g.terminal_color_5 = colors.syntaxNumber
	vim.g.terminal_color_6 = colors.syntaxFunction
	vim.g.terminal_color_7 = colors.mainText
	vim.g.terminal_color_8 = colors.mutedForeground
	vim.g.terminal_color_9 = colors.errorText
	vim.g.terminal_color_10 = colors.successText
	vim.g.terminal_color_11 = colors.warningText
	vim.g.terminal_color_12 = colors.syntaxConstant
	vim.g.terminal_color_13 = colors.syntaxNumber
	vim.g.terminal_color_14 = colors.syntaxFunction
	vim.g.terminal_color_15 = colors.selectedText
	vim.g.terminal_color_background = colors.editorBackground
	vim.g.terminal_color_foreground = colors.mainText
end

function M.set_groups()
	local bg = config.transparent and "NONE" or colors.editorBackground
	local float_bg = config.transparent and "NONE" or colors.popupBackground
	local diff_add = utils.mix(colors.successText, colors.editorBackground, 0.22)
	local diff_delete = utils.mix(colors.errorText, colors.editorBackground, 0.22)
	local diff_change = utils.mix(colors.syntaxFunction, colors.editorBackground, 0.18)
	local diff_text = utils.mix(colors.syntaxProperty, colors.editorBackground, 0.24)
	local reference_bg = utils.mix(colors.syntaxConstant, colors.editorBackground, 0.16)
	local visual_bg = utils.mix(colors.syntaxConstant, colors.editorBackground, 0.30)

	local groups = {
		Normal = { fg = colors.mainText, bg = bg },
		NormalNC = { link = "Normal" },
		NormalFloat = { fg = colors.mainText, bg = float_bg },
		FloatBorder = { fg = colors.border, bg = float_bg },
		FloatTitle = { fg = colors.syntaxFunction, bg = float_bg, bold = true },
		ColorColumn = { bg = colors.currentLineBackground },
		Conceal = {},
		Cursor = { fg = colors.editorBackground, bg = colors.mainText },
		lCursor = { link = "Cursor" },
		CursorIM = { link = "Cursor" },
		CursorLine = { bg = colors.popupBackground },
		CursorColumn = { link = "CursorLine" },
		CursorLineNr = { fg = colors.syntaxFunction, bold = true },
		LineNrAbove = { fg = colors.lineNumberText },
		LineNr = { fg = colors.lineNumberTextActive },
		LineNrBelow = { fg = colors.lineNumberText },
		SignColumn = { link = "Normal" },
		FoldColumn = { link = "SignColumn" },
		Folded = { fg = colors.inactiveText, bg = colors.popupBackground },
		EndOfBuffer = { fg = colors.lineNumberText },
		NonText = { fg = colors.lineNumberText },
		Whitespace = { fg = colors.lineNumberText },
		SpecialKey = { fg = colors.syntaxProperty },
		Directory = { fg = colors.syntaxFunction },
		DiffAdd = { bg = diff_add },
		DiffChange = { bg = diff_change },
		DiffDelete = { bg = diff_delete },
		DiffText = { bg = diff_text },
		TermCursor = { link = "Cursor" },
		TermCursorNC = { link = "Cursor" },
		ErrorMsg = { fg = colors.errorText },
		WarningMsg = { fg = colors.warningText },
		MoreMsg = { fg = colors.syntaxConstant },
		ModeMsg = { link = "Normal" },
		MsgArea = { link = "Normal" },
		Question = { fg = colors.syntaxFunction },
		VertSplit = { fg = colors.border, bg = "NONE" },
		Winseparator = { link = "VertSplit" },
		IncSearch = { fg = colors.editorBackground, bg = utils.mix(colors.warningText, colors.editorBackground, 0.78) },
		Search = { fg = colors.editorBackground, bg = utils.mix(colors.stringText, colors.editorBackground, 0.82) },
		Substitute = { link = "IncSearch" },
		MatchParen = { fg = colors.syntaxKeyword, bg = colors.menuOptionBackground, bold = true },
		Visual = { bg = visual_bg },
		VisualNOS = { link = "Visual" },
		QuickFixLine = { bg = reference_bg },
		Pmenu = { fg = colors.mainText, bg = float_bg },
		PmenuSel = { fg = colors.selectedText, bg = colors.menuOptionBackground, bold = true },
		PmenuSbar = { bg = colors.popupBackground },
		PmenuThumb = { bg = colors.border },
		WildMenu = { bg = colors.menuOptionBackground },
		StatusLine = { fg = colors.mainText, bg = float_bg },
		StatusLineNC = { fg = colors.inactiveText, bg = bg },
		TabLine = { fg = colors.inactiveText, bg = colors.editorBackground },
		TabLineFill = { link = "TabLine" },
		TabLineSel = { fg = colors.mainText, bg = colors.editorBackground },
		Title = { fg = colors.syntaxConstant, bold = true },
		SpellBad = { undercurl = true, sp = colors.errorText },
		SpellCap = { undercurl = true, sp = colors.syntaxFunction },
		SpellLocal = { undercurl = true, sp = colors.syntaxConstant },
		SpellRare = { undercurl = true, sp = colors.warningText },
		Comment = { fg = colors.commentText, italic = config.italics.comments or false },
		Constant = { fg = colors.syntaxConstant },
		String = { fg = colors.stringText, italic = config.italics.strings or false },
		Character = { fg = colors.stringText },
		Number = { fg = colors.syntaxNumber },
		Boolean = { fg = colors.syntaxConstant },
		Float = { link = "Number" },
		Identifier = { fg = colors.mainText },
		Function = { fg = colors.syntaxFunction },
		Method = { fg = colors.syntaxFunction },
		Property = { fg = colors.syntaxProperty },
		Field = { link = "Property" },
		Parameter = { fg = colors.syntaxType },
		Statement = { fg = colors.syntaxKeyword },
		Conditional = { fg = colors.syntaxKeyword },
		Repeat = { fg = colors.syntaxKeyword },
		Label = { fg = colors.syntaxFunction },
		Operator = { fg = colors.syntaxKeyword },
		Keyword = { link = "Statement", italic = config.italics.keywords or false },
		Exception = { fg = colors.syntaxKeyword },
		PreProc = { link = "Keyword" },
		Include = { fg = colors.syntaxFunction },
		Define = { fg = colors.syntaxKeyword },
		Macro = { link = "Define" },
		PreCondit = { fg = colors.syntaxKeyword },
		Type = { fg = colors.syntaxType },
		Struct = { link = "Type" },
		Class = { fg = colors.syntaxClass },
		StorageClass = { fg = colors.syntaxKeyword },
		Structure = { link = "Struct" },
		Typedef = { link = "Type" },
		Attribute = { fg = colors.syntaxProperty },
		Punctuation = { fg = colors.mutedForeground },
		Special = { fg = colors.syntaxProperty },
		SpecialChar = { fg = colors.syntaxKeyword },
		Tag = { fg = colors.syntaxKeyword },
		Delimiter = { fg = colors.mutedForeground },
		SpecialComment = { fg = colors.commentText, italic = true },
		Debug = { fg = colors.mainText },
		Underlined = { underline = true },
		Bold = { bold = true },
		Italic = { italic = true },
		Ignore = { fg = colors.editorBackground },
		Error = { link = "ErrorMsg" },
		Todo = { fg = colors.warningText, bold = true },
		LspReferenceText = { bg = reference_bg },
		LspReferenceRead = { bg = reference_bg },
		LspReferenceWrite = { bg = reference_bg, underline = true },
		LspCodeLens = { fg = colors.commentText, italic = true },
		LspCodeLensSeparator = { fg = colors.lineNumberText },
		LspSignatureActiveParameter = { fg = colors.syntaxType, bold = true },
		DiagnosticError = { fg = colors.errorText },
		DiagnosticWarn = { fg = colors.warningText },
		DiagnosticInfo = { fg = colors.infoText },
		DiagnosticHint = { fg = colors.hintText },
		DiagnosticOk = { fg = colors.successText },
		DiagnosticVirtualTextError = { fg = colors.errorText, bg = utils.mix(colors.errorText, colors.editorBackground, 0.12) },
		DiagnosticVirtualTextWarn = { fg = colors.warningText, bg = utils.mix(colors.warningText, colors.editorBackground, 0.12) },
		DiagnosticVirtualTextInfo = { fg = colors.infoText, bg = utils.mix(colors.infoText, colors.editorBackground, 0.12) },
		DiagnosticVirtualTextHint = { fg = colors.hintText, bg = utils.mix(colors.hintText, colors.editorBackground, 0.12) },
		DiagnosticUnderlineError = { undercurl = true, sp = colors.errorText },
		DiagnosticUnderlineWarn = { undercurl = true, sp = colors.warningText },
		DiagnosticUnderlineInfo = { undercurl = true, sp = colors.infoText },
		DiagnosticUnderlineHint = { undercurl = true, sp = colors.hintText },
		DiagnosticFloatingError = { fg = colors.errorText },
		DiagnosticFloatingWarn = { fg = colors.warningText },
		DiagnosticFloatingInfo = { fg = colors.infoText },
		DiagnosticFloatingHint = { fg = colors.hintText },
		DiagnosticSignError = { fg = colors.errorText },
		DiagnosticSignWarn = { fg = colors.warningText },
		DiagnosticSignInfo = { fg = colors.infoText },
		DiagnosticSignHint = { fg = colors.hintText },

		["@text"] = { fg = colors.mainText },
		["@text.literal"] = { fg = colors.stringText },
		["@text.reference"] = { fg = colors.linkText },
		["@text.strong"] = { link = "Bold" },
		["@text.emphasis"] = { link = "Italic" },
		["@text.title"] = { fg = colors.syntaxConstant, bold = true },
		["@text.uri"] = { fg = colors.linkText, sp = colors.linkText, underline = true },
		["@text.underline"] = { link = "Underlined" },
		["@text.todo"] = { link = "Todo" },
		["@text.note"] = { fg = colors.infoText, bold = true },
		["@text.warning"] = { fg = colors.warningText, bold = true },
		["@text.danger"] = { fg = colors.errorText, bold = true },
		["@text.diff.add"] = { fg = colors.successText },
		["@text.diff.delete"] = { fg = colors.errorText },
		["@markup.heading"] = { fg = colors.syntaxConstant, bold = true },
		["@markup.heading.1"] = { fg = colors.syntaxConstant, bold = true },
		["@markup.heading.2"] = { fg = colors.syntaxFunction, bold = true },
		["@markup.heading.3"] = { fg = colors.syntaxType, bold = true },
		["@markup.strong"] = { link = "Bold" },
		["@markup.italic"] = { link = "Italic" },
		["@markup.strikethrough"] = { strikethrough = true },
		["@markup.underline"] = { link = "Underlined" },
		["@markup.link"] = { fg = colors.linkText },
		["@markup.link.label"] = { fg = colors.syntaxProperty },
		["@markup.link.url"] = { fg = colors.linkText, underline = true },
		["@markup.raw"] = { fg = colors.stringText },
		["@markup.list"] = { fg = colors.syntaxKeyword },
		["@markup.quote"] = { fg = colors.commentText, italic = true },
		["@comment"] = { link = "Comment" },
		["@comment.documentation"] = { fg = colors.commentText, italic = true },
		["@comment.error"] = { fg = colors.errorText, bold = true },
		["@comment.warning"] = { fg = colors.warningText, bold = true },
		["@comment.note"] = { fg = colors.infoText, bold = true },
		["@comment.todo"] = { link = "Todo" },
		["@punctuation"] = { link = "Punctuation" },
		["@punctuation.bracket"] = { fg = colors.mutedForeground },
		["@punctuation.delimiter"] = { fg = colors.mutedForeground },
		["@punctuation.special"] = { fg = colors.syntaxKeyword },
		["@punctuation.separator.keyvalue"] = { fg = colors.syntaxKeyword },
		["@constant"] = { link = "Constant" },
		["@constant.builtin"] = { fg = colors.syntaxConstant },
		["@constant.macro"] = { fg = colors.syntaxKeyword },
		["@define"] = { link = "Define" },
		["@macro"] = { link = "Macro" },
		["@string"] = { link = "String" },
		["@string.documentation"] = { fg = colors.stringText },
		["@string.regex"] = { fg = colors.syntaxProperty },
		["@string.escape"] = { fg = colors.syntaxFunction },
		["@string.special"] = { fg = colors.syntaxFunction },
		["@string.special.path"] = { fg = colors.linkText },
		["@string.special.symbol"] = { fg = colors.syntaxClass },
		["@string.special.url"] = { fg = colors.linkText, underline = true },
		["@character"] = { link = "Character" },
		["@character.special"] = { fg = colors.syntaxFunction },
		["@number"] = { link = "Number" },
		["@float"] = { link = "Float" },
		["@boolean"] = { link = "Boolean" },
		["@function"] = { link = "Function", italic = config.italics.functions or false },
		["@function.call"] = { link = "Function" },
		["@function.builtin"] = { fg = colors.syntaxFunction, bold = true },
		["@function.macro"] = { fg = colors.syntaxKeyword },
		["@function.method"] = { link = "Method" },
		["@function.method.call"] = { link = "Method" },
		["@method"] = { link = "Method" },
		["@method.call"] = { link = "Method" },
		["@constructor"] = { fg = colors.syntaxClass },
		["@parameter"] = { link = "Parameter" },
		["@keyword"] = { link = "Keyword" },
		["@keyword.coroutine"] = { link = "Keyword" },
		["@keyword.function"] = { link = "Keyword" },
		["@keyword.operator"] = { link = "Operator" },
		["@keyword.import"] = { link = "Include" },
		["@keyword.type"] = { link = "Type" },
		["@keyword.modifier"] = { link = "StorageClass" },
		["@keyword.repeat"] = { link = "Repeat" },
		["@keyword.return"] = { link = "Keyword" },
		["@keyword.debug"] = { link = "Debug" },
		["@keyword.exception"] = { link = "Exception" },
		["@conditional"] = { link = "Conditional" },
		["@repeat"] = { link = "Repeat" },
		["@label"] = { link = "Label" },
		["@operator"] = { link = "Operator" },
		["@exception"] = { link = "Exception" },
		["@variable"] = { fg = colors.mainText, italic = config.italics.variables or false },
		["@variable.builtin"] = { fg = colors.syntaxConstant },
		["@variable.member"] = { link = "Property" },
		["@variable.parameter"] = { link = "Parameter" },
		["@field"] = { link = "Property" },
		["@property"] = { link = "Property" },
		["@property.json"] = { fg = colors.syntaxProperty },
		["@property.yaml"] = { fg = colors.syntaxProperty },
		["@type"] = { link = "Type" },
		["@type.builtin"] = { fg = colors.syntaxType, italic = true },
		["@type.definition"] = { fg = colors.syntaxClass },
		["@type.qualifier"] = { link = "StorageClass" },
		["@storageclass"] = { link = "StorageClass" },
		["@structure"] = { link = "Structure" },
		["@namespace"] = { fg = colors.syntaxConstant },
		["@module"] = { fg = colors.syntaxConstant },
		["@module.builtin"] = { fg = colors.syntaxFunction },
		["@annotation"] = { fg = colors.syntaxProperty },
		["@attribute"] = { fg = colors.syntaxProperty },
		["@attribute.builtin"] = { fg = colors.syntaxFunction },
		["@tag"] = { link = "Tag" },
		["@tag.builtin"] = { link = "Tag" },
		["@tag.delimiter"] = { fg = colors.mutedForeground },
		["@tag.attribute"] = { fg = colors.syntaxProperty },
		["@diff.plus"] = { fg = colors.successText },
		["@diff.minus"] = { fg = colors.errorText },
		["@diff.delta"] = { fg = colors.warningText },
		["@label.help"] = { link = "@text.uri" },
		["@number.tsx"] = { link = "Number" },
		["@type.tsx"] = { fg = colors.syntaxType },
		["@tag.jsx.element"] = { link = "Tag" },
		["@tag.tsx"] = { link = "Tag" },

		["@lsp.type.namespace"] = { link = "@namespace" },
		["@lsp.type.type"] = { link = "@type" },
		["@lsp.type.class"] = { fg = colors.syntaxClass },
		["@lsp.type.enum"] = { link = "@type" },
		["@lsp.type.enumMember"] = { fg = colors.syntaxConstant },
		["@lsp.type.interface"] = { fg = colors.syntaxClass },
		["@lsp.type.struct"] = { fg = colors.syntaxClass },
		["@lsp.type.parameter"] = { link = "@variable.parameter" },
		["@lsp.type.property"] = { link = "@property" },
		["@lsp.type.function"] = { link = "@function" },
		["@lsp.type.method"] = { link = "@method" },
		["@lsp.type.macro"] = { link = "@function.macro" },
		["@lsp.type.decorator"] = { link = "@attribute" },
		["@lsp.type.variable"] = { link = "@variable" },
		["@lsp.typemod.variable.readonly"] = { fg = colors.syntaxConstant },
		["@lsp.typemod.variable.defaultLibrary"] = { fg = colors.syntaxConstant },
		["@lsp.typemod.variable.declaration"] = { fg = colors.mainText },
		["@lsp.typemod.function.declaration"] = { link = "@function" },
		["@lsp.typemod.method.declaration"] = { link = "@method" },
		["@lsp.typemod.parameter.declaration"] = { link = "@variable.parameter" },
		["@lsp.typemod.property.readonly"] = { fg = colors.syntaxProperty },
	}

	groups = vim.tbl_extend("force", groups, require("Eezzy.integrations.cmp").highlights())
	groups = vim.tbl_extend(
		"force",
		groups,
		type(config.overrides) == "function" and config.overrides(config) or config.overrides
	)

	for group, parameters in pairs(groups) do
		vim.api.nvim_set_hl(0, group, parameters)
	end
end

return M
