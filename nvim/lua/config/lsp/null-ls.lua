local M = {}

function M.setup(opts)
  local null_ls = require("null-ls")

  local formatting = null_ls.builtins.formatting

  null_ls.setup({
    sources = {
      formatting.prettierd,
    },
    on_attach = opts.on_attach
  })

end

return M
