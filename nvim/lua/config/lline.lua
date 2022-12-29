local M = {}

function M.setup()
  require('lualine').setup {
    options = {
      globalstatus = true
    },
    sections = {
      lualine_c = { {
        'filename',
        path = 1,
      } }
    }
  }
end

return M
