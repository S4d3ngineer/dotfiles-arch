local M = {}

local servers = {
  html = {},
  cssls = {},
  jsonls = {},
  graphql = {},
  pyright = {},
  rust_analyzer = {},
  sumneko_lua = {},
  tsserver = {},
  angularls = {},
}

local lsp_signature = require "lsp_signature"
lsp_signature.setup {
  bind = true,
  handler_opts = {
    border = "rounded",
  },
  hint_prefix = "",
  toggle_key = "jl"
}

local function on_attach(client, bufnr)
  -- Enable completion triggered by <C-X><C-O>
  -- See `:help omnifunc` and `:help ins-completion` for more information.
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Use LSP as the handler for formatexpr.
  -- See `:help formatexpr` for more information.
  vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")

  -- Configure key mappings
  require("config.lsp.keymaps").setup(client, bufnr)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local opts = {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
}

function M.setup()

  -- -- Diagnostic symbols in the sign column (gutter)
  -- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
  -- for type, icon in pairs(signs) do
  --   local hl = "DiagnosticSign" .. type
  --   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  -- end

  require("config.lsp.installer").setup(servers, opts)
  require("config.lsp.null-ls").setup(opts)
  require('lspconfig.ui.windows').default_options.border = 'single'
end

return M
