-- Neovim Config File
--
-- References:
-- https://dotfiles.substack.com/p/neovim-options-the-most-common-ones
-- https://cmgriffing.github.io/neovim-docs-web/en/options/
--
--
-- Set <space> as the leader key
-- See `:h mapleader`
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '


-- OPTIONS
--
-- See `:h vim.o`
-- NOTE: You can change these options as you wish!
-- For more options, you can see `:h option-list`
-- To see documentation for an option, you can use `:h 'optionname'`, for example `:h 'number'`
-- (Note the single quotes)
--
-- UI / Display
--
vim.o.number = true -- Show line numbers in a column.
-- Show line numbers relative to where the cursor is.
-- Affects the 'number' option above, see `:h number_relativenumber`.
vim.o.relativenumber = true
vim.o.ruler = true -- show cursor line and column in the statusline
vim.o.showmode = true -- Show the current mode in the command area (disable if in statusline)
-- Enable Sign Column
vim.o.signcolumn = "yes"
-- Enable 24-bit RGB color in the terminal UI
vim.o.termguicolors = true
-- Split behavior: new splits open below & to the right of current window
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.cursorline = true -- Highlight the line where the cursor is on.
vim.o.scrolloff = 10 -- Keep this many screen lines above/below the cursor.
vim.o.visualbell = true -- user visual bell instead of beeping
vim.o.syntax = "on" -- Enable syntax highlighting
--
-- Indentation / Whitepace / Wrapping
--
-- Autoindent: take indent for new line from previous line
vim.o.autoindent = true
-- Control how wide a literal tab character is displayed
vim.o.tabstop = 4
-- Define how many columns count as one level of indentation for operations like
-- >>, <<, and various indent features.
vim.o.shiftwidth = 4
-- Control how <Tab> and <BS> behave in Insert mode.
vim.o.softtabstop = 4
-- Make pressing <Tab> insert spaces instead of a literal tab character
vim.o.expandtab = true
-- Disable line wrapping
vim.o.wrap = false
-- When wrapping is enabled, break long lines at nicer boundaries instead of
-- the middle of a word, indent the continuation, and set # of columns to
-- keep to the left & right of the cursor
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.sidescrolloff = 10
-- Make Whitespace Visible
vim.o.list = true
-- Customize how invisible characters are shown when list is enabled
-- vim.opt.listchars = {
--   tab = "» ",
--   trail = "·",
--   nbsp = "␣",
-- }
--
-- Searching
--
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true -- Highlight all matches from the last search pattern
vim.o.incsearch = true -- Show matches as you type the search pattern
--
-- Command line / completion
--
-- Autocomplete: enable automatic completion in insert mode
vim.o.autocomplete = true
-- Show the completion menu, do not force-select the first item immediately
vim.opt.completeopt = { "menu", "menuone", "noselect" }
-- Enhance command-line completion
vim.o.wildmenu = true
-- Control how command-line completion behaves across repeated <Tab> presses
vim.o.wildmode = "longest:full,full"
-- Show partial commands as they are being typed
vim.o.showcmd = true
-- Briefly jump to amatching bracket if insert one for X tenths of a second
vim.o.showmatch = true
vim.o.mat = 2
--
-- System / Files
--
-- If performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s). See `:h 'confirm'`
vim.o.confirm = true
-- Sync clipboard between OS and Neovim. Schedule the setting after `UIEnter` because it can
-- increase startup-time. Remove this option if you want your OS clipboard to remain independent.
-- See `:h 'clipboard'`
vim.api.nvim_create_autocmd('UIEnter', {
  callback = function()
    vim.o.clipboard = 'unnamedplus'
  end,
})
-- Autoread: Automatically read file when changed outside of Vim (when set to true)
vim.o.autoread = false
-- Persist undo history to disk
vim.o.undofile = true
-- Set number of undo levels
vim.o.undolevels = 1000
-- Number of command-lines that are remembered
vim.o.history = 500
-- Enable mouse support in all major modes
vim.o.mouse = "a"
-- Fix backspace
vim.o.backspace = "indent,eol,start"
-- Allow specified keys to cross line boundaries
-- vim.o.whichwrap = "<,>,h"


-- KEYMAPS
--
-- See `:h vim.keymap.set()`, `:h mapping`, `:h keycodes`

-- Use <Esc> to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Map <A-j>, <A-k>, <A-h>, <A-l> to navigate between windows in any modes
vim.keymap.set({ 't', 'i' }, '<A-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set({ 't', 'i' }, '<A-j>', '<C-\\><C-n><C-w>j')
vim.keymap.set({ 't', 'i' }, '<A-k>', '<C-\\><C-n><C-w>k')
vim.keymap.set({ 't', 'i' }, '<A-l>', '<C-\\><C-n><C-w>l')
vim.keymap.set({ 'n' }, '<A-h>', '<C-w>h')
vim.keymap.set({ 'n' }, '<A-j>', '<C-w>j')
vim.keymap.set({ 'n' }, '<A-k>', '<C-w>k')
vim.keymap.set({ 'n' }, '<A-l>', '<C-w>l')

-- AUTOCOMMANDS (EVENT HANDLERS)
--
-- See `:h lua-guide-autocommands`, `:h autocmd`, `:h nvim_create_autocmd()`

-- Highlight when yanking (copying) text.
-- Try it with `yap` in normal mode. See `:h vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.hl.on_yank()
  end,
})

-- USER COMMANDS: DEFINE CUSTOM COMMANDS
--
-- See `:h nvim_create_user_command()` and `:h user-commands`

-- Create a command `:GitBlameLine` that print the git blame for the current line
vim.api.nvim_create_user_command('GitBlameLine', function()
  local line_number = vim.fn.line('.') -- Get the current line number. See `:h line()`
  local filename = vim.api.nvim_buf_get_name(0)
  print(vim.system({ 'git', 'blame', '-L', line_number .. ',+1', filename }):wait().stdout)
end, { desc = 'Print the git blame for the current line' })

-- PLUGINS
--
-- See `:h :packadd`, `:h vim.pack`

-- Add the "nohlsearch" package to automatically disable search highlighting after
-- 'updatetime' and when going to insert mode.
vim.cmd('packadd! nohlsearch')

-- Install third-party plugins via "vim.pack.add()".
vim.pack.add({
  -- Quickstart configs for LSP
  'https://github.com/neovim/nvim-lspconfig',
  -- Fuzzy picker
  'https://github.com/ibhagwan/fzf-lua',
  -- Autocompletion
  'https://github.com/nvim-mini/mini.completion',
  -- Enhanced quickfix/loclist
  'https://github.com/stevearc/quicker.nvim',
  -- Git integration
  'https://github.com/lewis6991/gitsigns.nvim',
  -- OneDark Color Scheme
  'https://github.com/navarasu/onedark.nvim',
  -- Highlight Color Codes
  'https://github.com/catgoose/nvim-colorizer.lua',
  -- Logfile highlighting
  'https://github.com/fei6409/log-highlight.nvim',
  -- LLM Autocompletions
--  'https://github.com/milanglacier/minuet-ai.nvim',
})

require('fzf-lua').setup { fzf_colors = true }
require('mini.completion').setup {}
require('quicker').setup {}
require('gitsigns').setup {}
 -- OneDark color styles: dark, darker, cool, deep, warm, warmer
require('onedark').setup { style = 'darker' }
require('onedark').load()
require("colorizer").setup{}
require('log-highlight').setup{}
--require('minuet').setup {
--    virtualtext = {
--        auto_trigger_ft = { "*" },
--        keymap = {
--            -- accept whole completion
--            accept = '<A-A>',
--            -- accept = '<Tab>',
--            -- accept one line
--            accept_line = '<A-a>',
--            -- accept_line = '<C-y>',
--            -- accept n lines (prompts for number)
--            -- e.g. "A-z 2 CR" will accept 2 lines
--            accept_n_lines = '<A-z>',
--            -- accept_n_lines = '<C-z>',
--            -- Cycle to prev completion item, or manually invoke completion
--            prev = '<A-[>',
--            -- prev = '<C-p>',
--            -- Cycle to next completion item, or manually invoke completion
--            next = '<A-]>',
--            dismiss = '<A-e>',
--            -- next = '<C-n>',
--            -- dismiss = '<C-e>',
--        },
--    },
--    provider = 'openai_fim_compatible',
--    n_completions = 1, -- recommend for local model for resource saving
--    -- I recommend beginning with a small context window size and incrementally
--    -- expanding it, depending on your local computing power. A context window
--    -- of 512, serves as an good starting point to estimate your computing
--    -- power. Once you have a reliable estimate of your local computing power,
--    -- you should adjust the context window to a larger value.
--    context_window = 4096,
--    throttle = 500, -- Minimum time between requests in ms
--    debounce = 300, -- Wait time after typing stops before requesting
--    provider_options = {
--        openai_fim_compatible = {
--            -- For Windows users, TERM may not be present in environment variables.
--            -- Consider using APPDATA instead.
--            api_key = 'TERM',
--            name = 'Ollama',
--            end_point = 'http://localhost:18081/v1/completions',
--            model = 'qwen2.5-coder:7b',
--            optional = {
--                max_tokens = 256,
--                top_p = 0.9,
--            },
--        },
--    },
--}
