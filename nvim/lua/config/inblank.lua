local M = {}

local icons = {
  lineleft = '▏',
  linemiddle = '│'
}

function M.setup()

 require("indent_blankline").setup {
   show_current_context = true,
   char = icons.lineleft,
 }

end

return M
