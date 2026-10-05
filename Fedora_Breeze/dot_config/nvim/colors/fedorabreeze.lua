-- ~/.config/nvim/colors/fedora.lua

vim.cmd("highlight clear")

if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.g.colors_name = "fedora"

local c = {
    -- Base
    bg          = "#232627",
    fg          = "#fcfcfc",

    -- UI
    cursor      = "#51a2da",
    cursor_text = "#ffd117",
    selection   = "#3c6eb4",
    selection_fg = "#fefefe",

    -- ANSI palette
    black       = "#232627",
    red         = "#ee0000",
    green       = "#38bc3b",
    yellow      = "#e59728",
    blue        = "#294172",
    magenta     = "#603e79",
    cyan        = "#51a2da",
    white       = "#a1a9b1",

    bright_black   = "#31363b",
    bright_red     = "#db3279",
    bright_green   = "#79db32",
    bright_yellow  = "#ffd117",
    bright_blue    = "#3c6eb4",
    bright_magenta = "#a07cbc",
    bright_cyan    = "#60a5fa",
    bright_white   = "#ffffff",
}

local function hi(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

-----------------------------------------------------------------------------
-- Editor UI
-----------------------------------------------------------------------------

hi("Normal",       { fg = c.fg, bg = c.bg })
hi("NormalNC",     { fg = c.fg, bg = c.bg })
hi("NormalFloat",  { fg = c.fg, bg = c.bright_black })
hi("FloatBorder",  { fg = c.blue, bg = c.bright_black })
hi("FloatTitle",   { fg = c.bright_cyan, bg = c.bright_black, bold = true })

hi("Cursor",       { fg = c.cursor_text, bg = c.cursor })
hi("CursorIM",     { fg = c.cursor_text, bg = c.cursor })
hi("TermCursor",   { fg = c.cursor_text, bg = c.cursor })
hi("CursorColumn", { bg = c.bright_black })
hi("CursorLine",   { bg = c.bright_black })
hi("CursorLineNr", { fg = c.bright_yellow, bg = c.bright_black, bold = true })

hi("LineNr",       { fg = c.white, bg = c.bg })
hi("SignColumn",   { fg = c.white, bg = c.bg })
hi("FoldColumn",   { fg = c.blue, bg = c.bg })
hi("Folded",       { fg = c.white, bg = c.bright_black })

hi("Visual",       { fg = c.selection_fg, bg = c.selection })
hi("VisualNOS",    { fg = c.selection_fg, bg = c.selection })

hi("Search",       { fg = c.black, bg = c.bright_yellow })
hi("IncSearch",    { fg = c.black, bg = c.cyan, bold = true })
hi("CurSearch",    { fg = c.black, bg = c.bright_cyan, bold = true })
hi("Substitute",   { fg = c.bright_white, bg = c.red })

hi("MatchParen",   { fg = c.bright_yellow, bold = true, underline = true })

hi("ColorColumn",  { bg = c.bright_black })
hi("NonText",      { fg = c.bright_black })
hi("Whitespace",   { fg = c.bright_black })
hi("SpecialKey",   { fg = c.blue })
hi("EndOfBuffer",  { fg = c.bg })

hi("VertSplit",    { fg = c.bright_black, bg = c.bg })
hi("WinSeparator", { fg = c.bright_black, bg = c.bg })

-----------------------------------------------------------------------------
-- Menus / completion
-----------------------------------------------------------------------------

hi("Pmenu",         { fg = c.fg, bg = c.bright_black })
hi("PmenuSel",      { fg = c.bright_white, bg = c.blue, bold = true })
hi("PmenuSbar",     { bg = c.bright_black })
hi("PmenuThumb",    { bg = c.white })
hi("PmenuMatch",    { fg = c.bright_cyan, bg = c.bright_black, bold = true })
hi("PmenuMatchSel", { fg = c.bright_yellow, bg = c.blue, bold = true })

hi("WildMenu",      { fg = c.bright_white, bg = c.blue, bold = true })

-----------------------------------------------------------------------------
-- Status line / tabs
-----------------------------------------------------------------------------

hi("StatusLine",   { fg = c.bright_white, bg = c.blue, bold = true })
hi("StatusLineNC", { fg = c.white, bg = c.bright_black })

hi("TabLine",      { fg = c.white, bg = c.bright_black })
hi("TabLineFill",  { fg = c.white, bg = c.bright_black })
hi("TabLineSel",   { fg = c.bright_white, bg = c.blue, bold = true })

hi("WinBar",       { fg = c.bright_white, bg = c.bg, bold = true })
hi("WinBarNC",     { fg = c.white, bg = c.bg })

-----------------------------------------------------------------------------
-- Messages
-----------------------------------------------------------------------------

hi("ErrorMsg",   { fg = c.bright_red, bold = true })
hi("WarningMsg", { fg = c.bright_yellow, bold = true })
hi("ModeMsg",    { fg = c.bright_green, bold = true })
hi("MoreMsg",    { fg = c.bright_cyan })
hi("Question",   { fg = c.bright_green })
hi("Title",      { fg = c.bright_cyan, bold = true })
hi("Directory",  { fg = c.bright_blue, bold = true })

-----------------------------------------------------------------------------
-- Core syntax
-----------------------------------------------------------------------------

hi("Comment",        { fg = c.white, italic = true })

hi("Constant",       { fg = c.bright_magenta })
hi("String",         { fg = c.bright_green })
hi("Character",      { fg = c.bright_green })
hi("Number",         { fg = c.bright_magenta })
hi("Boolean",        { fg = c.bright_magenta, bold = true })
hi("Float",          { fg = c.bright_magenta })

hi("Identifier",     { fg = c.bright_cyan })
hi("Function",       { fg = c.bright_blue })

hi("Statement",      { fg = c.cyan })
hi("Conditional",    { fg = c.cyan, bold = true })
hi("Repeat",         { fg = c.cyan, bold = true })
hi("Label",          { fg = c.bright_yellow })
hi("Operator",       { fg = c.yellow })
hi("Keyword",        { fg = c.cyan, bold = true })
hi("Exception",      { fg = c.bright_red, bold = true })

hi("PreProc",        { fg = c.magenta })
hi("Include",        { fg = c.bright_magenta })
hi("Define",         { fg = c.magenta })
hi("Macro",          { fg = c.bright_magenta })
hi("PreCondit",      { fg = c.magenta })

hi("Type",           { fg = c.bright_yellow })
hi("StorageClass",   { fg = c.yellow })
hi("Structure",      { fg = c.bright_yellow })
hi("Typedef",        { fg = c.bright_yellow })

hi("Special",        { fg = c.bright_cyan })
hi("SpecialChar",    { fg = c.bright_yellow })
hi("Tag",            { fg = c.bright_blue })
hi("Delimiter",      { fg = c.white })
hi("SpecialComment", { fg = c.bright_cyan, italic = true })
hi("Debug",          { fg = c.bright_red })

hi("Underlined",     { fg = c.bright_cyan, underline = true })
hi("Ignore",         { fg = c.white })
hi("Error",          { fg = c.bright_white, bg = c.red })
hi("Todo",           { fg = c.black, bg = c.bright_yellow, bold = true })

-----------------------------------------------------------------------------
-- Diff
-----------------------------------------------------------------------------

hi("DiffAdd",    { fg = c.bright_green, bg = c.bg })
hi("DiffChange", { fg = c.bright_yellow, bg = c.bg })
hi("DiffDelete", { fg = c.bright_red, bg = c.bg })
hi("DiffText",   { fg = c.black, bg = c.bright_yellow, bold = true })

-----------------------------------------------------------------------------
-- Diagnostics
-----------------------------------------------------------------------------

hi("DiagnosticError", { fg = c.bright_red })
hi("DiagnosticWarn",  { fg = c.bright_yellow })
hi("DiagnosticInfo",  { fg = c.bright_blue })
hi("DiagnosticHint",  { fg = c.bright_cyan })
hi("DiagnosticOk",    { fg = c.bright_green })

hi("DiagnosticUnderlineError", { undercurl = true, sp = c.bright_red })
hi("DiagnosticUnderlineWarn",  { undercurl = true, sp = c.bright_yellow })
hi("DiagnosticUnderlineInfo",  { undercurl = true, sp = c.bright_blue })
hi("DiagnosticUnderlineHint",  { undercurl = true, sp = c.bright_cyan })

hi("DiagnosticVirtualTextError", { fg = c.red })
hi("DiagnosticVirtualTextWarn",  { fg = c.yellow })
hi("DiagnosticVirtualTextInfo",  { fg = c.blue })
hi("DiagnosticVirtualTextHint",  { fg = c.cyan })

-----------------------------------------------------------------------------
-- Treesitter
-----------------------------------------------------------------------------

hi("@comment",             { link = "Comment" })
hi("@string",              { link = "String" })
hi("@string.escape",       { fg = c.bright_yellow })
hi("@character",           { link = "Character" })
hi("@number",              { link = "Number" })
hi("@boolean",             { link = "Boolean" })
hi("@constant",            { link = "Constant" })
hi("@constant.builtin",    { fg = c.bright_magenta, bold = true })

hi("@variable",            { fg = c.fg })
hi("@variable.builtin",    { fg = c.bright_cyan, italic = true })
hi("@variable.parameter",  { fg = c.cyan })
hi("@variable.member",     { fg = c.bright_cyan })

hi("@function",            { link = "Function" })
hi("@function.builtin",    { fg = c.bright_blue, bold = true })
hi("@function.call",       { fg = c.bright_blue })
hi("@function.method",     { fg = c.bright_blue })
hi("@function.method.call",{ fg = c.bright_blue })

hi("@constructor",         { fg = c.bright_yellow })
hi("@operator",            { link = "Operator" })

hi("@keyword",             { link = "Keyword" })
hi("@keyword.function",    { fg = c.cyan, bold = true })
hi("@keyword.return",      { fg = c.cyan, bold = true })
hi("@keyword.import",      { fg = c.bright_magenta })
hi("@keyword.conditional", { link = "Conditional" })
hi("@keyword.repeat",      { link = "Repeat" })
hi("@keyword.exception",   { link = "Exception" })

hi("@type",                { link = "Type" })
hi("@type.builtin",        { fg = c.bright_yellow })
hi("@property",            { fg = c.bright_cyan })
hi("@attribute",           { fg = c.magenta })

hi("@punctuation",         { fg = c.white })
hi("@punctuation.bracket", { fg = c.white })
hi("@punctuation.delimiter",{ fg = c.white })
hi("@punctuation.special", { fg = c.bright_yellow })

hi("@tag",                 { fg = c.bright_blue })
hi("@tag.attribute",       { fg = c.bright_cyan })
hi("@tag.delimiter",       { fg = c.white })

hi("@markup.heading",      { fg = c.bright_blue, bold = true })
hi("@markup.bold",         { bold = true })
hi("@markup.italic",       { italic = true })
hi("@markup.link",         { fg = c.bright_cyan, underline = true })
hi("@markup.raw",          { fg = c.bright_green })
hi("@markup.list",         { fg = c.bright_yellow })

-----------------------------------------------------------------------------
-- LSP semantic tokens
-----------------------------------------------------------------------------

hi("@lsp.type.class",         { fg = c.bright_yellow })
hi("@lsp.type.struct",        { fg = c.bright_yellow })
hi("@lsp.type.enum",          { fg = c.bright_yellow })
hi("@lsp.type.interface",     { fg = c.bright_yellow })
hi("@lsp.type.typeParameter", { fg = c.yellow })
hi("@lsp.type.function",      { fg = c.bright_blue })
hi("@lsp.type.method",        { fg = c.bright_blue })
hi("@lsp.type.parameter",     { fg = c.cyan })
hi("@lsp.type.property",      { fg = c.bright_cyan })
hi("@lsp.type.variable",      { fg = c.fg })
hi("@lsp.type.enumMember",    { fg = c.bright_magenta })
hi("@lsp.type.keyword",       { fg = c.cyan, bold = true })
hi("@lsp.type.macro",         { fg = c.bright_magenta })

-----------------------------------------------------------------------------
-- Git
-----------------------------------------------------------------------------

hi("Added",   { fg = c.bright_green })
hi("Changed", { fg = c.bright_yellow })
hi("Removed", { fg = c.bright_red })

hi("GitSignsAdd",          { fg = c.bright_green })
hi("GitSignsChange",       { fg = c.bright_yellow })
hi("GitSignsDelete",       { fg = c.bright_red })
hi("GitSignsCurrentLineBlame", { fg = c.white, italic = true })

-----------------------------------------------------------------------------
-- Spell checking
-----------------------------------------------------------------------------

hi("SpellBad",   { undercurl = true, sp = c.bright_red })
hi("SpellCap",   { undercurl = true, sp = c.bright_blue })
hi("SpellLocal", { undercurl = true, sp = c.bright_cyan })
hi("SpellRare",  { undercurl = true, sp = c.bright_magenta })

-----------------------------------------------------------------------------
-- Terminal palette
-----------------------------------------------------------------------------

vim.g.terminal_color_0  = c.black
vim.g.terminal_color_1  = c.red
vim.g.terminal_color_2  = c.green
vim.g.terminal_color_3  = c.yellow
vim.g.terminal_color_4  = c.blue
vim.g.terminal_color_5  = c.magenta
vim.g.terminal_color_6  = c.cyan
vim.g.terminal_color_7  = c.white

vim.g.terminal_color_8  = c.bright_black
vim.g.terminal_color_9  = c.bright_red
vim.g.terminal_color_10 = c.bright_green
vim.g.terminal_color_11 = c.bright_yellow
vim.g.terminal_color_12 = c.bright_blue
vim.g.terminal_color_13 = c.bright_magenta
vim.g.terminal_color_14 = c.bright_cyan
vim.g.terminal_color_15 = c.bright_white
