local M = {}

function M.setup()
  local autotag = require "nvim-ts-autotag"

  lvim.builtin.treesitter.autotag.enable = true
end

return M
