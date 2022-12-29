local M = {}

function M.setup()
  local whichkey = require "which-key"

  local conf = {
    window = {
      border = "single", -- none, single, double, shadow
      position = "bottom", -- bottom, top
    },
  }

  local opts = {
    mode = "n", -- Normal mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  }

  local mappings = {
    ["w"] = { "<cmd>update!<CR>", "Save" },
    ["q"] = { "<cmd>q!<CR>", "Quit" },

    b = {
      name = "Buffer",
      c = { "<cmd>Bdelete<CR>", "Close current buffer" },
      D = { "<cmd>%bd|e#|bd#<CR>", "Delete all buffers" },
    },

    c = { "<cmd>NoNeckPain<CR>", "Center current buffer" },

    t = { "<cmd>tabclose<CR>", "Close current tab" },

    z = {
      name = "Packer",
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      s = { "<cmd>PackerSync<cr>", "Sync" },
      S = { "<cmd>PackerStatus<cr>", "Status" },
      u = { "<cmd>PackerUpdate<cr>", "Update" },
    },

    g = {
      name = "Git",

      -- Gitsigns hunks
      p = { "<cmd>Gitsigns preview_hunk<CR>", "Preview hunk" },
      s = { "<cmd>Gitsigns stage_hunk<CR>", "Stage hunk" },
      r = { "<cmd>Gitsigns reset_hunk<CR>", "Reset hunk" },
      u = { "<cmd>Gitsigns undo_stage_hunk<CR>", "Undo stage hunk" },
      -- Gitsigns buffer
      S = { "<cmd>Gitsigns stage_buffer<CR>", "Stage buffer" },
      R = { "<cmd>Gitsings reset_buffer<CR>", "Reset buffer" },
      U = { "<cmd>Gitsings stage_buffer_index<CR>", "Reset buffer index" },

      -- Fugitive
      g = { "<cmd>0G<CR>", "Status" },
      c = { "<cmd>Git commit | startinsert<CR>", "Commit" },

      -- Diffview
      d = { "<cmd>DiffviewOpen<CR>", "Open diffview" },
      h = { "<cmd>DiffviewFileHistory<CR>", "Show file history" },
      H = { "<cmd>DiffviewFileHistory %<CR>", "Show currenct file history" },
      f = { "<cmd>DiffviewToggleFiles<CR>", "Toggle files pane in diffview" },
      F = { "<cmd>DiffviewFocusFiles<CR>", "Focus files pane in diffview" }
    },
  }

  whichkey.setup(conf)
  whichkey.register(mappings, opts)
end

return M
