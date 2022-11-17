local M = {}
function M.setup()
  -- Indicate first time installation
  local packer_bootstrap = false

  -- packer.nvim configuration
  local conf = {

    profile = {
      enable = true,
      threshold = 1, -- the amount in ms that a plugins load time must be over for it to be included in the profile
    },

    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },

  }

  -- Plugins
  local function plugins(use)
    use { "wbthomason/packer.nvim" }

    -- nvim-tree
    use {
      "kyazdani42/nvim-tree.lua",
      wants = "nvim-web-devicons",
      cmd = { "NvimTreeToggle", "NvimTreeClose" },
      config = function()
        require("config.nvimtree").setup()
      end,
    }

    -- Telescope
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      -- or                            , branch = '0.1.x',
      requires = {
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
        'BurntSushi/ripgrep'
      }
    }

    -- Toggleterm
    use {
      "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("config.tterm").setup()
      end
    }
    -- Bufferline
    use {
      "akinsho/nvim-bufferline.lua",
      event = "BufReadPre",
      wants = "nvim-web-devicons",
      config = function()
        require("config.bufferline").setup()
      end,
    }

    -- Lualine
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      config = function()
        require('config.lline').setup()
      end,
    }

    -- WhichKey
    use {
      "folke/which-key.nvim",
      config = function()
        require("config.whichkey").setup()
      end,
    }

    -- vim-commentary
    use { "tpope/vim-commentary" }

    -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      opt = true,
      event = "BufRead",
      run = ":TSUpdate",
      config = function()
        require("config.treesitter").setup()
      end,
      requires = {
        { "nvim-treesitter/nvim-treesitter-textobjects" },
      },
    }

    -- git -->

    use {
      "sindrets/diffview.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
      },
      cmd = { "DiffviewOpen" },
    }

    use { "tpope/vim-fugitive" }

    use {
      'lewis6991/gitsigns.nvim',
      config = function()
        require('gitsigns').setup()
      end
    }

    -- git <--

    -- Vim repreat
    use { "tpope/vim-repeat" }

    -- Bbye (deleting buffers without closing windows)
    use { "moll/vim-bbye" }

    -- Rainbow brackets
    use {
      'p00f/nvim-ts-rainbow',
      after = "nvim-treesitter",
      config = function()
        require("config.treesitter").setup()
      end,
    }

    -- Auto pairs
    use {
      "windwp/nvim-autopairs",
      -- wants = "nvim-treesitter",
      module = { "nvim-autopairs.completion.cmp", "nvim-autopairs" },
      config = function()
        require("config.autopairs").setup()
      end,
    }

    -- Auto tags
    use {
      "windwp/nvim-ts-autotag",
      wants = "nvim-treesitter",
      event = "InsertEnter",
      config = function()
        -- require("nvim-ts-autotag").setup { enable = true }
        require("nvim-ts-autotag").setup()
      end,
    }

    -- Indent blankline
    use {
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require("config.inblank").setup()
      end,
    }

    -- Surround vim
    use { "tpope/vim-surround" }

    -- Neoscroll
    use {
      'karb94/neoscroll.nvim',
      config = function()
        require('config.nscroll').setup()
      end,
    }

    -- LSP
    use {
      "neovim/nvim-lspconfig",
      opt = true,
      event = "BufRead",
      wants = { "nvim-lsp-installer", "lsp_signature.nvim", "cmp-nvim-lsp" }, -- for nvim-cmp
      -- wants = { "nvim-lsp-installer", "lsp_signature.nvim", "coq_nvim" },  -- for coq.nvim
      config = function()
        require("config.lsp").setup()
      end,
      requires = {
        "williamboman/nvim-lsp-installer",
        "ray-x/lsp_signature.nvim",
      },
    }

    -- coq
    use {
      "ms-jpq/coq_nvim",
      branch = "coq",
      event = "VimEnter",
      opt = true,
      run = ":COQdeps",
      config = function()
        require("config.coq").setup()
      end,
      requires = {
        { "ms-jpq/coq.artifacts", branch = "artifacts" },
        { "ms-jpq/coq.thirdparty", branch = "3p", module = "coq_3p" },
      },
      disable = true,
    }

    -- nvim-cmp
    use {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      opt = true,
      config = function()
        require("config.cmp").setup()
      end,
      wants = { "LuaSnip" },
      requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "saadparwaiz1/cmp_luasnip",
        "ray-x/cmp-treesitter",
        {
          "L3MON4D3/LuaSnip",
          -- wants = "friendly-snippets",
          -- config = function()
          --   require("config.luasnip").setup()
          -- end,
        },
        "rafamadriz/friendly-snippets",
      },
      disable = false,
    }

    -- Better icons
    use {
      "kyazdani42/nvim-web-devicons",
      module = "nvim-web-devicons",
      config = function()
        require("nvim-web-devicons").setup { default = true }
      end,
    }


    ------------------------- THEMES ------------------------------

    -- Catppuccin
    -- use {
    --   "catppuccin/nvim",
    --   as = "catppuccin",
    --   config = function()
    --     vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
    --     require("config.catp").setup()
    --     vim.cmd [[colorscheme catppuccin]]
    --   end,
    -- }

    use {
      'rose-pine/neovim',
      as = 'rose-pine',
      config = function()
        require('rose-pine').setup({
          dark_variant = 'moon'
        })
        vim.cmd('colorscheme rose-pine')
      end
    }

  end

  local packer = require "packer"
  packer.init(conf)
  packer.startup(plugins)
end

return M
