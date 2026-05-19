-- LSP config
-- Golang
vim.lsp.config['gopls'] = {
    cmd = { 'gopls' },
    filetypes = { 'go' },
}
vim.lsp.enable('gopls')

-- Rust
vim.lsp.config['rust-analyzer'] = {
    cmd = { 'rust-analyzer' },
    filetypes = { 'rust' },
}
vim.lsp.enable('rust-analyzer')

vim.diagnostic.config({
  virtual_text = true, -- Shows diagnostics inline
  signs = true,        -- Shows icons in the gutter
  underline = true,    -- Underlines errors
})

require("conform").setup({
  formatters_by_ft = {
    go = { "gofmt", "goimports" },
    rust = { "rustfmt" },
  },
  format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
})
