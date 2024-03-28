
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'


-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

if vim.g.vscode then

    -- VS Code: Neovim UI modifier: change UI elements color depending on the current vim mode
    vim.api.nvim_exec([[
        " THEME CHANGER
        function! SetCursorLineNrColorInsert(mode)
            " Insert mode: blue
            if a:mode == "i"
                call VSCodeNotify('nvim-theme.insert')

            " Replace mode: red
            elseif a:mode == "r"
                call VSCodeNotify('nvim-theme.replace')
            endif
        endfunction

        augroup CursorLineNrColorSwap
            autocmd!
            autocmd ModeChanged *:[vV\x16]* call VSCodeNotify('nvim-theme.visual')
            autocmd ModeChanged *:[R]* call VSCodeNotify('nvim-theme.replace')
            autocmd InsertEnter * call SetCursorLineNrColorInsert(v:insertmode)
            autocmd InsertLeave * call VSCodeNotify('nvim-theme.normal')
            autocmd CursorHold * call VSCodeNotify('nvim-theme.normal')
            autocmd ModeChanged [vV\x16]*:* call VSCodeNotify('nvim-theme.normal')
        augroup END
    ]], false)
end


