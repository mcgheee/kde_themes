-- Stellar Bloom
-- A dark Neovim colorscheme based on a blue/cyan/violet nebula palette.

vim.o.background = "dark"
vim.cmd("highlight clear")

if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "stellar-bloom"

local c = {
  bg = "#030B0F",
  bg_dark = "#02070A",
  bg_alt = "#07141C",
  bg_highlight = "#0A1D2A",
  bg_visual = "#1D4D7E",
  bg_search = "#5B3D67",

  fg = "#C7E0F0",
  fg_bright = "#D9EEF8",
  fg_dim = "#7892A5",
  comment = "#5E7B8E",

  black = "#07141C",
  red = "#C95D86",
  green = "#4EB7A5",
  yellow = "#C9AD72",
  blue = "#347FC4",
  magenta = "#9A6AB5",
  cyan = "#36AFCB",
  white = "#AFC7D8",

  bright_black = "#1A354A",
  bright_red = "#F07AA3",
  bright_green = "#72D8C4",
  bright_yellow = "#F0D58B",
  bright_blue = "#56BCE8",
  bright_magenta = "#D0A1D7",
  bright_cyan = "#69E6F7",
  bright_white = "#D9EEF8",

  none = "NONE",
}

local transparent = vim.g.stellar_bloom_transparent == true
local italic_comments = vim.g.stellar_bloom_italic_comments ~= false

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

local function link(group, target)
  hl(group, { link = target })
end

local normal_bg = transparent and c.none or c.bg
local float_bg = transparent and c.none or c.bg_alt

-- Editor UI ------------------------------------------------------------------

hl("Normal", { fg = c.fg, bg = normal_bg })
hl("NormalNC", { fg = c.fg, bg = normal_bg })
hl("NormalFloat", { fg = c.fg, bg = float_bg })
hl("FloatBorder", { fg = c.blue, bg = float_bg })
hl("FloatTitle", { fg = c.bright_cyan, bg = float_bg, bold = true })

hl("Cursor", { fg = c.bg, bg = c.bright_cyan })
link("lCursor", "Cursor")
link("CursorIM", "Cursor")
hl("TermCursor", { fg = c.bg, bg = c.bright_cyan })
hl("TermCursorNC", { fg = c.bg, bg = c.fg_dim })

hl("CursorLine", { bg = c.bg_highlight })
hl("CursorColumn", { bg = c.bg_highlight })
hl("ColorColumn", { bg = c.bg_alt })
hl("LineNr", { fg = c.bright_black })
hl("LineNrAbove", { fg = c.bright_black })
hl("LineNrBelow", { fg = c.bright_black })
hl("CursorLineNr", { fg = c.bright_cyan, bold = true })
hl("CursorLineSign", { fg = c.bright_blue, bg = c.bg_highlight })
hl("CursorLineFold", { fg = c.magenta, bg = c.bg_highlight })
hl("SignColumn", { fg = c.fg_dim, bg = normal_bg })
hl("FoldColumn", { fg = c.magenta, bg = normal_bg })
hl("Folded", { fg = c.fg_dim, bg = c.bg_alt, italic = true })

hl("EndOfBuffer", { fg = c.bg })
hl("NonText", { fg = c.bright_black })
hl("Whitespace", { fg = c.bright_black })
hl("SpecialKey", { fg = c.blue })
hl("Conceal", { fg = c.fg_dim })

hl("Visual", { bg = c.bg_visual })
hl("VisualNOS", { bg = c.bg_visual })
hl("Search", { fg = c.bg, bg = c.bright_yellow, bold = true })
hl("IncSearch", { fg = c.bg, bg = c.bright_cyan, bold = true })
hl("CurSearch", { fg = c.bg, bg = c.bright_red, bold = true })
hl("Substitute", { fg = c.bg, bg = c.bright_magenta, bold = true })
hl("MatchParen", { fg = c.bright_white, bg = c.bg_search, bold = true })

hl("Pmenu", { fg = c.fg, bg = c.bg_alt })
hl("PmenuSel", { fg = c.bg, bg = c.bright_blue, bold = true })
hl("PmenuKind", { fg = c.bright_magenta, bg = c.bg_alt })
hl("PmenuKindSel", { fg = c.bg, bg = c.bright_blue, bold = true })
hl("PmenuExtra", { fg = c.fg_dim, bg = c.bg_alt })
hl("PmenuExtraSel", { fg = c.bg, bg = c.bright_blue })
hl("PmenuSbar", { bg = c.bg_highlight })
hl("PmenuThumb", { bg = c.blue })
hl("WildMenu", { fg = c.bg, bg = c.bright_cyan, bold = true })

hl("StatusLine", { fg = c.fg_bright, bg = c.bg_highlight })
hl("StatusLineNC", { fg = c.fg_dim, bg = c.bg_alt })
hl("StatusLineTerm", { fg = c.fg_bright, bg = c.bg_highlight })
hl("StatusLineTermNC", { fg = c.fg_dim, bg = c.bg_alt })
hl("WinSeparator", { fg = c.bright_black })
hl("VertSplit", { fg = c.bright_black })

hl("TabLine", { fg = c.fg_dim, bg = c.bg_alt })
hl("TabLineFill", { bg = c.bg_dark })
hl("TabLineSel", { fg = c.bright_cyan, bg = c.bg_highlight, bold = true })
hl("WinBar", { fg = c.fg, bg = normal_bg, bold = true })
hl("WinBarNC", { fg = c.fg_dim, bg = normal_bg })

hl("MsgArea", { fg = c.fg })
hl("ModeMsg", { fg = c.bright_cyan, bold = true })
hl("MoreMsg", { fg = c.bright_green })
hl("WarningMsg", { fg = c.bright_yellow })
hl("ErrorMsg", { fg = c.bright_red, bold = true })
hl("Question", { fg = c.bright_cyan })
hl("Directory", { fg = c.bright_blue, bold = true })
hl("Title", { fg = c.bright_magenta, bold = true })
hl("QuickFixLine", { bg = c.bg_visual, bold = true })
hl("qfLineNr", { fg = c.bright_cyan })

hl("SpellBad", { undercurl = true, sp = c.bright_red })
hl("SpellCap", { undercurl = true, sp = c.bright_blue })
hl("SpellRare", { undercurl = true, sp = c.bright_magenta })
hl("SpellLocal", { undercurl = true, sp = c.bright_cyan })

-- Syntax ---------------------------------------------------------------------

hl("Comment", { fg = c.comment, italic = italic_comments })
hl("Constant", { fg = c.bright_magenta })
hl("String", { fg = c.bright_green })
hl("Character", { fg = c.bright_green })
hl("Number", { fg = c.bright_yellow })
hl("Boolean", { fg = c.bright_magenta, bold = true })
hl("Float", { fg = c.bright_yellow })

hl("Identifier", { fg = c.fg })
hl("Function", { fg = c.bright_blue })

hl("Statement", { fg = c.bright_magenta })
hl("Conditional", { fg = c.bright_magenta })
hl("Repeat", { fg = c.bright_magenta })
hl("Label", { fg = c.cyan })
hl("Operator", { fg = c.bright_cyan })
hl("Keyword", { fg = c.bright_magenta })
hl("Exception", { fg = c.bright_red })

hl("PreProc", { fg = c.cyan })
hl("Include", { fg = c.bright_magenta })
hl("Define", { fg = c.cyan })
hl("Macro", { fg = c.cyan })
hl("PreCondit", { fg = c.cyan })

hl("Type", { fg = c.bright_cyan })
hl("StorageClass", { fg = c.cyan })
hl("Structure", { fg = c.bright_cyan })
hl("Typedef", { fg = c.bright_cyan })

hl("Special", { fg = c.bright_cyan })
hl("SpecialChar", { fg = c.bright_yellow })
hl("Tag", { fg = c.bright_blue })
hl("Delimiter", { fg = c.white })
hl("SpecialComment", { fg = c.cyan, italic = italic_comments })
hl("Debug", { fg = c.bright_red })

hl("Underlined", { fg = c.bright_blue, underline = true })
hl("Ignore", { fg = c.fg_dim })
hl("Error", { fg = c.bright_red, bold = true })
hl("Todo", { fg = c.bg, bg = c.bright_yellow, bold = true })

-- Diff and version control ----------------------------------------------------

hl("DiffAdd", { fg = c.bright_green, bg = "#0C2A29" })
hl("DiffChange", { fg = c.bright_blue, bg = "#102840" })
hl("DiffDelete", { fg = c.bright_red, bg = "#301724" })
hl("DiffText", { fg = c.fg_bright, bg = "#214C73", bold = true })
hl("Added", { fg = c.bright_green })
hl("Changed", { fg = c.bright_blue })
hl("Removed", { fg = c.bright_red })

hl("GitSignsAdd", { fg = c.bright_green })
hl("GitSignsChange", { fg = c.bright_blue })
hl("GitSignsDelete", { fg = c.bright_red })
hl("GitSignsCurrentLineBlame", { fg = c.fg_dim, italic = true })

-- Diagnostics ----------------------------------------------------------------

hl("DiagnosticError", { fg = c.bright_red })
hl("DiagnosticWarn", { fg = c.bright_yellow })
hl("DiagnosticInfo", { fg = c.bright_blue })
hl("DiagnosticHint", { fg = c.bright_cyan })
hl("DiagnosticOk", { fg = c.bright_green })

hl("DiagnosticVirtualTextError", { fg = c.red, bg = "#24131D" })
hl("DiagnosticVirtualTextWarn", { fg = c.yellow, bg = "#262113" })
hl("DiagnosticVirtualTextInfo", { fg = c.blue, bg = "#102033" })
hl("DiagnosticVirtualTextHint", { fg = c.cyan, bg = "#0C252C" })
hl("DiagnosticVirtualTextOk", { fg = c.green, bg = "#0C2624" })

hl("DiagnosticUnderlineError", { undercurl = true, sp = c.bright_red })
hl("DiagnosticUnderlineWarn", { undercurl = true, sp = c.bright_yellow })
hl("DiagnosticUnderlineInfo", { undercurl = true, sp = c.bright_blue })
hl("DiagnosticUnderlineHint", { undercurl = true, sp = c.bright_cyan })
hl("DiagnosticUnderlineOk", { undercurl = true, sp = c.bright_green })

link("DiagnosticFloatingError", "DiagnosticError")
link("DiagnosticFloatingWarn", "DiagnosticWarn")
link("DiagnosticFloatingInfo", "DiagnosticInfo")
link("DiagnosticFloatingHint", "DiagnosticHint")
link("DiagnosticFloatingOk", "DiagnosticOk")
link("DiagnosticSignError", "DiagnosticError")
link("DiagnosticSignWarn", "DiagnosticWarn")
link("DiagnosticSignInfo", "DiagnosticInfo")
link("DiagnosticSignHint", "DiagnosticHint")
link("DiagnosticSignOk", "DiagnosticOk")

hl("DiagnosticDeprecated", { strikethrough = true, sp = c.fg_dim })
hl("DiagnosticUnnecessary", { fg = c.fg_dim })

-- Treesitter -----------------------------------------------------------------

link("@variable", "Identifier")
hl("@variable.builtin", { fg = c.bright_red, italic = true })
hl("@variable.parameter", { fg = c.yellow, italic = true })
link("@variable.parameter.builtin", "@variable.parameter")
hl("@variable.member", { fg = c.cyan })

link("@constant", "Constant")
hl("@constant.builtin", { fg = c.bright_magenta, bold = true })
link("@constant.macro", "Macro")

hl("@module", { fg = c.cyan })
link("@module.builtin", "@module")
link("@label", "Label")

link("@string", "String")
hl("@string.documentation", { fg = c.green, italic = true })
hl("@string.regexp", { fg = c.bright_cyan })
hl("@string.escape", { fg = c.bright_yellow })
hl("@string.special", { fg = c.cyan })
link("@string.special.symbol", "@string.special")
link("@string.special.url", "Underlined")
link("@string.special.path", "@string.special")

link("@character", "Character")
link("@character.special", "SpecialChar")
link("@boolean", "Boolean")
link("@number", "Number")
link("@number.float", "Float")

link("@type", "Type")
hl("@type.builtin", { fg = c.bright_cyan, italic = true })
link("@type.definition", "Typedef")

hl("@attribute", { fg = c.bright_yellow })
hl("@attribute.builtin", { fg = c.bright_yellow, italic = true })
hl("@property", { fg = c.cyan })

link("@function", "Function")
hl("@function.builtin", { fg = c.bright_cyan })
link("@function.call", "Function")
hl("@function.macro", { fg = c.cyan })
link("@function.method", "Function")
link("@function.method.call", "Function")
hl("@constructor", { fg = c.bright_cyan })

link("@operator", "Operator")

link("@keyword", "Keyword")
link("@keyword.coroutine", "Keyword")
link("@keyword.function", "Keyword")
link("@keyword.operator", "Operator")
hl("@keyword.import", { fg = c.bright_magenta })
link("@keyword.type", "Keyword")
link("@keyword.modifier", "Keyword")
link("@keyword.repeat", "Repeat")
link("@keyword.return", "Keyword")
link("@keyword.debug", "Debug")
link("@keyword.exception", "Exception")
link("@keyword.conditional", "Conditional")
link("@keyword.conditional.ternary", "Conditional")
link("@keyword.directive", "PreProc")
link("@keyword.directive.define", "Define")

link("@punctuation.delimiter", "Delimiter")
hl("@punctuation.bracket", { fg = c.white })
hl("@punctuation.special", { fg = c.bright_cyan })

link("@comment", "Comment")
hl("@comment.documentation", { fg = c.comment, italic = true })
link("@comment.error", "DiagnosticError")
link("@comment.warning", "DiagnosticWarn")
link("@comment.todo", "Todo")
hl("@comment.note", { fg = c.bg, bg = c.bright_cyan, bold = true })

hl("@markup.strong", { bold = true })
hl("@markup.italic", { italic = true })
hl("@markup.strikethrough", { strikethrough = true })
hl("@markup.underline", { underline = true })
hl("@markup.heading", { fg = c.bright_magenta, bold = true })
hl("@markup.heading.1", { fg = c.bright_magenta, bold = true })
hl("@markup.heading.2", { fg = c.bright_blue, bold = true })
hl("@markup.heading.3", { fg = c.bright_cyan, bold = true })
hl("@markup.heading.4", { fg = c.bright_green, bold = true })
hl("@markup.heading.5", { fg = c.bright_yellow, bold = true })
hl("@markup.heading.6", { fg = c.red, bold = true })
hl("@markup.quote", { fg = c.comment, italic = true })
hl("@markup.math", { fg = c.bright_yellow })
hl("@markup.link", { fg = c.bright_blue })
hl("@markup.link.label", { fg = c.bright_cyan })
link("@markup.link.url", "Underlined")
hl("@markup.raw", { fg = c.bright_green })
hl("@markup.raw.block", { fg = c.green })
hl("@markup.list", { fg = c.bright_magenta })
hl("@markup.list.checked", { fg = c.bright_green })
hl("@markup.list.unchecked", { fg = c.fg_dim })

link("@diff.plus", "Added")
link("@diff.minus", "Removed")
link("@diff.delta", "Changed")

link("@tag", "Tag")
hl("@tag.builtin", { fg = c.bright_blue, italic = true })
hl("@tag.attribute", { fg = c.bright_yellow })
hl("@tag.delimiter", { fg = c.white })

-- LSP semantic tokens ---------------------------------------------------------

link("@lsp.type.class", "@type")
link("@lsp.type.comment", "@comment")
link("@lsp.type.decorator", "@attribute")
link("@lsp.type.enum", "@type")
link("@lsp.type.enumMember", "@constant")
link("@lsp.type.event", "@type")
link("@lsp.type.function", "@function")
link("@lsp.type.interface", "@type")
link("@lsp.type.keyword", "@keyword")
link("@lsp.type.macro", "@function.macro")
link("@lsp.type.method", "@function.method")
link("@lsp.type.modifier", "@keyword.modifier")
link("@lsp.type.namespace", "@module")
link("@lsp.type.number", "@number")
link("@lsp.type.operator", "@operator")
link("@lsp.type.parameter", "@variable.parameter")
link("@lsp.type.property", "@property")
link("@lsp.type.regexp", "@string.regexp")
link("@lsp.type.string", "@string")
link("@lsp.type.struct", "@type")
link("@lsp.type.type", "@type")
link("@lsp.type.typeParameter", "@type.definition")
link("@lsp.type.variable", "@variable")

hl("@lsp.mod.deprecated", { strikethrough = true })
hl("@lsp.mod.readonly", { italic = true })
hl("@lsp.typemod.variable.readonly", { fg = c.bright_magenta })

-- Common plugins --------------------------------------------------------------

-- Completion
hl("CmpItemAbbr", { fg = c.fg })
hl("CmpItemAbbrDeprecated", { fg = c.fg_dim, strikethrough = true })
hl("CmpItemAbbrMatch", { fg = c.bright_cyan, bold = true })
hl("CmpItemAbbrMatchFuzzy", { fg = c.bright_blue, bold = true })
hl("CmpItemMenu", { fg = c.fg_dim })
hl("CmpItemKind", { fg = c.bright_magenta })

hl("BlinkCmpLabel", { fg = c.fg })
hl("BlinkCmpLabelDeprecated", { fg = c.fg_dim, strikethrough = true })
hl("BlinkCmpLabelMatch", { fg = c.bright_cyan, bold = true })
hl("BlinkCmpKind", { fg = c.bright_magenta })
hl("BlinkCmpMenu", { fg = c.fg, bg = c.bg_alt })
hl("BlinkCmpMenuSelection", { fg = c.bg, bg = c.bright_blue, bold = true })

-- Telescope
hl("TelescopeNormal", { fg = c.fg, bg = float_bg })
hl("TelescopeBorder", { fg = c.blue, bg = float_bg })
hl("TelescopeTitle", { fg = c.bg, bg = c.bright_blue, bold = true })
hl("TelescopePromptNormal", { fg = c.fg, bg = c.bg_highlight })
hl("TelescopePromptBorder", { fg = c.bright_cyan, bg = c.bg_highlight })
hl("TelescopePromptTitle", { fg = c.bg, bg = c.bright_cyan, bold = true })
hl("TelescopePromptPrefix", { fg = c.bright_cyan })
hl("TelescopeSelection", { bg = c.bg_visual, bold = true })
hl("TelescopeSelectionCaret", { fg = c.bright_cyan, bg = c.bg_visual })
hl("TelescopeMatching", { fg = c.bright_yellow, bold = true })

-- Neo-tree / NvimTree
hl("NeoTreeNormal", { fg = c.fg, bg = normal_bg })
hl("NeoTreeNormalNC", { fg = c.fg, bg = normal_bg })
hl("NeoTreeDirectoryName", { fg = c.bright_blue })
hl("NeoTreeDirectoryIcon", { fg = c.blue })
hl("NeoTreeRootName", { fg = c.bright_cyan, bold = true })
hl("NeoTreeGitAdded", { fg = c.bright_green })
hl("NeoTreeGitModified", { fg = c.bright_blue })
hl("NeoTreeGitDeleted", { fg = c.bright_red })
hl("NeoTreeGitUntracked", { fg = c.bright_yellow })
hl("NeoTreeIndentMarker", { fg = c.bright_black })

hl("NvimTreeNormal", { fg = c.fg, bg = normal_bg })
hl("NvimTreeNormalNC", { fg = c.fg, bg = normal_bg })
hl("NvimTreeFolderName", { fg = c.bright_blue })
hl("NvimTreeFolderIcon", { fg = c.blue })
hl("NvimTreeRootFolder", { fg = c.bright_cyan, bold = true })
hl("NvimTreeIndentMarker", { fg = c.bright_black })

-- Which-key
hl("WhichKey", { fg = c.bright_cyan })
hl("WhichKeyGroup", { fg = c.bright_blue })
hl("WhichKeyDesc", { fg = c.fg })
hl("WhichKeySeparator", { fg = c.fg_dim })
hl("WhichKeyFloat", { bg = float_bg })
hl("WhichKeyBorder", { fg = c.blue, bg = float_bg })
hl("WhichKeyValue", { fg = c.fg_dim })

-- Lazy / Mason
hl("LazyButton", { fg = c.fg, bg = c.bg_highlight })
hl("LazyButtonActive", { fg = c.bg, bg = c.bright_blue, bold = true })
hl("LazyH1", { fg = c.bg, bg = c.bright_cyan, bold = true })
hl("LazySpecial", { fg = c.bright_magenta })
hl("MasonHeader", { fg = c.bg, bg = c.bright_cyan, bold = true })
hl("MasonHeaderSecondary", { fg = c.bg, bg = c.bright_blue, bold = true })
hl("MasonHighlight", { fg = c.bright_cyan })
hl("MasonHighlightBlock", { fg = c.bg, bg = c.bright_cyan })
hl("MasonHighlightBlockBold", { fg = c.bg, bg = c.bright_cyan, bold = true })
hl("MasonMuted", { fg = c.fg_dim })
hl("MasonMutedBlock", { fg = c.fg_dim, bg = c.bg_alt })

-- Indent guides
hl("IblIndent", { fg = c.bright_black, nocombine = true })
hl("IblScope", { fg = c.blue, nocombine = true })
link("IndentBlanklineChar", "IblIndent")
link("IndentBlanklineContextChar", "IblScope")

-- Mini.nvim
hl("MiniIndentscopeSymbol", { fg = c.blue })
hl("MiniStatuslineModeNormal", { fg = c.bg, bg = c.bright_blue, bold = true })
hl("MiniStatuslineModeInsert", { fg = c.bg, bg = c.bright_green, bold = true })
hl("MiniStatuslineModeVisual", { fg = c.bg, bg = c.bright_magenta, bold = true })
hl("MiniStatuslineModeReplace", { fg = c.bg, bg = c.bright_red, bold = true })
hl("MiniStatuslineModeCommand", { fg = c.bg, bg = c.bright_yellow, bold = true })
hl("MiniStatuslineModeOther", { fg = c.bg, bg = c.bright_cyan, bold = true })

-- Notify
hl("NotifyERRORBorder", { fg = c.red })
hl("NotifyERRORTitle", { fg = c.bright_red })
hl("NotifyERRORIcon", { fg = c.bright_red })
hl("NotifyWARNBorder", { fg = c.yellow })
hl("NotifyWARNTitle", { fg = c.bright_yellow })
hl("NotifyWARNIcon", { fg = c.bright_yellow })
hl("NotifyINFOBorder", { fg = c.blue })
hl("NotifyINFOTitle", { fg = c.bright_blue })
hl("NotifyINFOIcon", { fg = c.bright_blue })
hl("NotifyDEBUGBorder", { fg = c.magenta })
hl("NotifyDEBUGTitle", { fg = c.bright_magenta })
hl("NotifyDEBUGIcon", { fg = c.bright_magenta })
hl("NotifyTRACEBorder", { fg = c.cyan })
hl("NotifyTRACETitle", { fg = c.bright_cyan })
hl("NotifyTRACEIcon", { fg = c.bright_cyan })

-- Terminal ANSI colors --------------------------------------------------------

vim.g.terminal_color_0 = c.black
vim.g.terminal_color_1 = c.red
vim.g.terminal_color_2 = c.green
vim.g.terminal_color_3 = c.yellow
vim.g.terminal_color_4 = c.blue
vim.g.terminal_color_5 = c.magenta
vim.g.terminal_color_6 = c.cyan
vim.g.terminal_color_7 = c.white
vim.g.terminal_color_8 = c.bright_black
vim.g.terminal_color_9 = c.bright_red
vim.g.terminal_color_10 = c.bright_green
vim.g.terminal_color_11 = c.bright_yellow
vim.g.terminal_color_12 = c.bright_blue
vim.g.terminal_color_13 = c.bright_magenta
vim.g.terminal_color_14 = c.bright_cyan
vim.g.terminal_color_15 = c.bright_white
