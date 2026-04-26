vim.pack.add {
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
    { src = "https://github.com/nvim-tree/nvim-tree.lua", name = "nvim-tree.lua" },
    { src = "https://github.com/neovim/nvim-lspconfig", name = "nvim-lspconfig" },
    { src = "https://github.com/stevearc/conform.nvim", name = "conform" },
    { src = "https://github.com/nvim-lua/plenary.nvim", name = "plenary" },
    { src = "https://github.com/nvim-telescope/telescope.nvim", name = "telescope" },
    { src = "https://github.com/nvim-lualine/lualine.nvim", name = "lualine" },
}

-- config color scheme
require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
})

-- global key remappings
require("remap")

-- set color schema and other UI options
vim.cmd.colorscheme "catppuccin-nvim"
vim.opt.guifont = { "JetBrainsMono Nerd Font", ":h12" }

-- basic Vim config options
vim.opt.number = true
vim.opt.scrolloff = 8

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Vim native autocomplete
vim.opt.complete = ".,o" -- use buffer and omnifunc
vim.opt.completeopt = { "menuone", "fuzzy", "noselect", "noinsert", "preview", "popup" } -- add 'popup' for docs (sometimes)
vim.opt.autocomplete = true

-- search options
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- folding
vim.opt.foldmethod = "syntax"
vim.opt.foldlevelstart = 1
vim.opt.foldtext = ""

-- Neovide
if vim.g.neovide then
    -- copy/paste from OS clipboard
    local function save() vim.cmd.write() end
    local function copy() vim.cmd([[normal! "+y]]) end
    local function paste() vim.api.nvim_paste(vim.fn.getreg("+"), true, -1) end

    vim.keymap.set({ "n", "i", "v" }, "<D-s>", save, { desc = "Save" })
    vim.keymap.set("v", "<D-c>", copy, { silent = true, desc = "Copy" })
    vim.keymap.set({ "n", "i", "v", "c", "t" }, "<D-v>", paste, { silent = true, desc = "Paste" })
end

-- file explorer
require("nvim-tree").setup({
    sync_root_with_cwd = true,
    filters = {
        dotfiles = false,
    }
})

-- IDE config
require("ide")
require("statusline")

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>fl", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

vim.keymap.set("n", "<leader>ld", builtin.lsp_definitions, { desc = "Telescope LSP definitions" })
vim.keymap.set("n", "<leader>li", builtin.lsp_implementations, { desc = "Telescope LSP implementations" })
vim.keymap.set("n", "<leader>lr", builtin.lsp_references, { desc = "Telescope LSP references" })
vim.keymap.set("n", "<leader>lt", builtin.lsp_type_definitions, { desc = "Telescope LSP references" })

