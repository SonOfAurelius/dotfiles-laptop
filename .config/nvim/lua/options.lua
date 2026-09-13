vim.opt.number = true -- Make line numbers default (default: false)
vim.opt.relativenumber = true -- Set relative numbered lines (default: false)
vim.opt.clipboard = "unnamedplus" -- Sync clipboard with OS (default: '')
vim.opt.wrap = true -- (default: true)
vim.opt.linebreak = true -- Don't split words on wrap (default: false)
vim.opt.autoindent = true -- Copy indent from current line when starting a new one (default: true)
vim.opt.showtabline = 2 -- Always show tabs (default: 1)
vim.opt.mouse = "a"
vim.opt.splitright = true -- Force all vertical vertical splits to go the right of the current window (default: false)
vim.opt.swapfile = false
vim.opt.title = false
vim.opt.termguicolors = true
vim.opt.updatetime = 250
vim.opt.undofile = true
vim.opt.cmdheight = 1
vim.opt.fileencoding = "utf-8"
vim.opt.iskeyword:append("-")
vim.opt.pumheight = 10
vim.opt.numberwidth = 2
vim.opt.scrolloff = 4
vim.opt.fillchars = { eob = " " } -- Sets end of buffer character to a space, thus removing the tildes
vim.opt.completeopt = "menuone,noselect"
vim.opt.showmode = false
vim.opt.signcolumn = "yes"

-- Code Style --
vim.opt.autoindent = true -- Copy indent from current line when starting a new one (default: true)
vim.opt.shiftwidth = 4 -- Insert n spaces for each indent (default: 8)
vim.opt.tabstop = 4 -- Insert n spaces for a tab (default: 8)
vim.opt.softtabstop = 4 -- Number of spaces that  tab counts for while performing editing operations (default: 0)
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.expandtab = true -- Convert tabs to spaces (default: false)

