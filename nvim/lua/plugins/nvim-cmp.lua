local cmp = require("cmp")

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
  },
  opts = {
    sources = cmp.config.sources({
      { name = "nvim_lsp", group_index = 1, max_item_count = 30 },
      { name = "buffer" },
      { name = "path" },
    }),
    performance = {
      trigger_debounce_time = 500,
      throttle = 550,
      fetching_timeout = 80,
    },
  },
}
