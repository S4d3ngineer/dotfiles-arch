local M = {}

function M.setup()
  require('Comment').setup {
    pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
  }
  -- local ft = require('Comment.ft')
  -- -- ft.scss = '/* %s */'
  -- ft.set('scss', '/* %s */')
end

return M
