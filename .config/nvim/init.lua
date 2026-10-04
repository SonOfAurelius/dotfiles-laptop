vim.deprecate = function() end
-- Plugins --
vim.pack.add({
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/nvim-mini/mini.completion" },
    { src = "https://github.com/j-hui/fidget.nvim" }, -- info widget
    { src = "https://github.com/dgagn/diagflow.nvim" }, -- minimal diagnostics
    { src = "https://github.com/windwp/nvim-autopairs" },
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    { src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
    { src = "https://github.com/metalelf0/black-metal-theme-neovim" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
    { src = "https://github.com/folke/which-key.nvim" },
    { src = "https://github.com/norcalli/nvim-colorizer.lua" }
})

-- Keymaps --
require("keymaps")

-- Options -- 
require("options")

-- Misc Setup -- 
require("fidget").setup()
require("colorizer").setup()
require("which-key").setup()
require("nvim-autopairs").setup({
    event = "InsertEnter",
    config = true,
    opts = {}
})
require("ibl").setup({
    indent = { char = "▏"},
})

-- Telescope Setup --
require("telescope").setup({
    dependencies = {
        vim.pack.add({
            { src = "https://github.com/nvim-lua/plenary.nvim" },
            { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
        })
    }
})

-- LSP Setup --
require("mini.completion").setup({
    delay = { completion = 1, info = 100, signature = 50 },
    window = {
        info = { height = 25, width = 80, border = nil },
        signature = { height = 25, width = 80, border = nil },
    },
    mappings = {
      scroll_down = '<C-n>',
      scroll_up = '<C-p>',
    },
})

local servers = {
    lua_ls = {
        cmd = { "lua-language-server" },
        filetypes = { "lua" },
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                }
            }
        }
    },
    clangd = {
        cmd = { "clangd" },
        filetypes = { "c", "cpp", }
    },
    ols = {
        cmd = { "ols" },
        filetypes = { "odin" },
    },
    gopls = {
	    cmd = { "gopls" },
	    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    },
    nixd = {
	    cmd = { "nixd" },
	    filetypes = { "nix" },
    },
    denols = {
        cmd = { "deno", "lsp" },
        root_markers = { "deno.json", "deno.jsonc" },
        filetypes = { "javascript", "typescript"},
        settings = {
            deno = {
                enable = true,
                lint = true,
            }
        }
    }
}

vim.lsp.config("*", { capabilities = require("mini.completion").get_lsp_capabilities() })
for server, config in pairs(servers) do
    vim.lsp.config(server, config)
    vim.lsp.enable(server)
end

-- Diagflow Setup --
require("diagflow").setup({
    event = "LspAttach",
    opts = {
        scope = "line",
        show_borders = true,
        border_chars = {
            top_left = "┌",
            top_right = "┐",
            bottom_left = "└",
            bottom_right = "┘",
            horizontal = "─",
            vertical = "│",
        },
        placement = "top",
        inline_padding_left = 3,
    }
})

-- Gitsigns Setup --
require("gitsigns").setup({
    signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
    },
    signs_staged = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
    },
})

-- Colorscheme Setup --
require("black-metal").setup({
    theme = "windir",
    transparent = true,
})
require("black-metal").load()

-- Lualine Setup --
local function lsp_status_with_filetype()
    local devicons = require("nvim-web-devicons")

    local icon = devicons.get_icon_by_filetype(vim.bo.filetype)

    local clients = vim.lsp.get_clients({ bufnr = 0 })

    if #clients == 0 then
        return ""
    end

    local names = {}
    for _, client in ipairs(clients) do
        table.insert(names, client.name)
    end

    return (icon or "󰈚") .. " " .. table.concat(names, ", ")
end

local gruvbox = require("lualine.themes.gruvbox_dark")
gruvbox.insert = gruvbox.normal
gruvbox.visual = gruvbox.normal
gruvbox.replace = gruvbox.normal
gruvbox.command = gruvbox.normal

require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = "gruvbox",
        section_separators = { left = "", right =  "" },
        component_separators = { left = "", right = "" },
        always_divide_middle = true,
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { "filename" },

        lualine_x = { "diagnostics" },
        lualine_z = { lsp_status_with_filetype }
    }
})
