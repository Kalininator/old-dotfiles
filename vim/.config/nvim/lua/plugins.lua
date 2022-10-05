local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap =
    fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

return require("packer").startup(
  function(use)
    use "wbthomason/packer.nvim"

    use "neovim/nvim-lspconfig"
    use {"nvim-lua/lsp_extensions.nvim"}
    use {"nvim-lua/completion-nvim"}
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use "nvim-treesitter/nvim-treesitter-context"
    use { "terrortylor/nvim-comment" }
    require('nvim_comment').setup()

    use "findango/vim-mdx"

    -- telescope
    use "nvim-telescope/telescope.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
    use "kyazdani42/nvim-web-devicons" 

    -- interface
    -- use "millermedeiros/vim-statline"
    use {
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons", opt = true }
    }

    -- window management
    use {
      "beauwilliams/focus.nvim",
      config = function()
        require("focus").setup()
      end
    }

    -- completion
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "f3fora/cmp-spell"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-vsnip"
    use "hrsh7th/vim-vsnip"
    use "hrsh7th/vim-vsnip-integ"
    use "rafamadriz/friendly-snippets"

    use {"simrat39/rust-tools.nvim"}

    -- linting
    use "mhartington/formatter.nvim"

    use "tpope/vim-fugitive"
    use "tpope/vim-rhubarb"
    use "tpope/vim-surround"
    use "tpope/vim-repeat"
    use { "ellisonleao/gruvbox.nvim" }
    use "EdenEast/nightfox.nvim"

    use {
      "kyazdani42/nvim-tree.lua",
      requires = {
        "kyazdani42/nvim-web-devicons" -- optional, for file icon
      },
      config = function()
        require "nvim-tree".setup {}
      end
    }

    use {
      "alexghergh/nvim-tmux-navigation",
      config = function()
        require "nvim-tmux-navigation".setup {
          disable_when_zoomed = true -- defaults to false
        }
      end
    }

    -- use {
    --   "dgrbrady/nvim-docker",
    --   requires = {"nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim"},
    --   rocks = "4O4/reactivex" -- ReactiveX Lua implementation
    -- }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require("packer").sync()
    end
  end
)
