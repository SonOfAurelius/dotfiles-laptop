vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Disable default spacebar key behavior in normal and visual mode
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Telescope --
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>", { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help Tags" })

-- LSP --
local tb = require("telescope.builtin")
vim.keymap.set("n", "gd", tb.lsp_definitions, { desc = "Goto Definition" })
vim.keymap.set("n", "gr", tb.lsp_references, { desc = "Goto References" })
vim.keymap.set("n", "gI", tb.lsp_implementations, { desc = "Goto Implementation" })
vim.keymap.set("n", "<leader>D", tb.lsp_type_definitions, { desc = "Type Definition" })
vim.keymap.set("n", "<leader>ds", tb.lsp_document_symbols, { desc = "Document Symbols" })
vim.keymap.set("n", "<leader>ws", tb.lsp_dynamic_workspace_symbols, { desc = "Workspace Symbols" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
vim.keymap.set("n", "<leader>th", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle Inlay Hints" })

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', { silent = true })
