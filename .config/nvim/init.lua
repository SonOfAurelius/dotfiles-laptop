    -- Plugins --
vim.pack.add({
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/nvim-mini/mini.completion" },
    { src = "https://github.com/j-hui/fidget.nvim" }, -- info widget
    { src = "https://github.com/dgagn/diagflow.nvim" }, -- minimal diagnostics
    { src = "https://github.com/windwp/nvim-autopairs" },
    { src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
    { src = "https://github.com/rebelot/kanagawa.nvim" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
})

-- Keymaps --
require("keymaps")

-- Options -- 
require("options")

-- Misc Setup -- 
require("nvim-autopairs").setup{
    event = "InsertEnter",
    config = true,
    opts = {}
}
require("ibl").setup{
    indent = { char = "▏"},
}

-- Telescope Setup --
require("telescope").setup{
    dependencies = {
        vim.pack.add({
            { src = "https://github.com/nvim-lua/plenary.nvim" },
            { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
        })
    }
}

-- LSP Setup --
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

-- Mini.completion Setup -- 
require("mini.completion").setup()

-- Diagflow Setup --
require("diagflow").setup{
    event = "LspAttach",
    opts = {
        scope = "line",
        show_borders = false,
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
}

-- Colorscheme Setup --
require("kanagawa").setup({
    transparent = false,
    overrides = function(colors)
         return {
            TabLine = { bg = "none" },
            TabLineFill = { bg = "none" },
            TablineSel = { bg = "none" },
            SignColumn = { bg = "none" },
        }
    end,
    colors = {
        theme = {
            dragon = {
                ui = {
                    bg = "none",
                    bg_gutter = "none",
                }
            }
        }
    }
})
require("kanagawa").load("dragon")


-- Lualine Setup --
require("lualine").setup{
    options = {
        icons_enabled = true,
        theme = "iceberg_dark",
        --theme = "gruvbox_light",
        section_separators = { left = "", right =  "" },
        component_separators = { left = "", right = "" },
        always_divide_middle = true,
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
            "diff",
        },
        lualine_x = { "diagnostics" }
    }
}
