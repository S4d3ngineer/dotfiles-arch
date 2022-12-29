local M = {}

function M.setup()
  require("nvim-tree").setup {
    disable_netrw = true,
    hijack_netrw = true,
    view = {
      -- adaptive_size = true,
      number = true,
      relativenumber = true,
    },
    git = {
      ignore = false
    },
    -- actions = {
    --   open_file = {
    --     resize_window = true
    --   }
    -- }
  }
end

return M
