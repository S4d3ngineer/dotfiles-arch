local M = {}

function M.setup(opts)
  local null_ls = require("null-ls")

  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics

  null_ls.setup({
    sources = {
      formatting.rustfmt,
      formatting.prettierd,
      diagnostics.eslint,
    },
    on_attach = opts.on_attach
  })

end

return M
