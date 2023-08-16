-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local installed = false
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.isdirectory(install_path) == 0 then
	local packer_url = "https://github.com/wbthomason/packer.nvim"

  vim.fn.mkdir(vim.fn.stdpath("config") .. "/undodir", "p")

	print("Downloading packer.nvim to manage plugins...")
	vim.fn.system({"git", "clone", "--depth", "1", packer_url, install_path})

  -- Only required if you have packer configured as `opt`
  vim.cmd.packadd('packer.nvim')

	installed = true
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use('morhetz/gruvbox')
  use('ap/vim-css-color')
  use('phelipetls/vim-hugo')
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('rcarriga/nvim-notify')
  use('thePrimeagen/harpoon')

  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},
      {
        'mattn/emmet-vim',
        setup = function()
          vim.g.user_emmet_leader_key = '<C-S>'
        end
      },

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      -- Snippet Collection (Optional)
      {'rafamadriz/friendly-snippets'},
    }
  }

  if installed then
	  require("packer").sync()
  end
end)
