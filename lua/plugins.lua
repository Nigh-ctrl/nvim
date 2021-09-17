return require('packer').startup(function()
    use{"wbthomason/packer.nvim"}
    use{"nvim-lua/plenary.nvim"} 
    use{"nvim-lua/popup.nvim"} 
    -- text and icons
    use{
      "nvim-treesitter/nvim-treesitter",
      branch = "0.5-compat",
  }
    use{"lukas-reineke/indent-blankline.nvim"}
    use{"norcalli/nvim-colorizer.lua"}
    use{"windwp/nvim-autopairs"}
    use{"sbdchd/neoformat"}
    use{"onsails/lspkind-nvim"}
    use{"kyazdani42/nvim-web-devicons"} 
    use{"L3MON4D3/LuaSnip"}
    use{"terrortylor/nvim-comment"}
    --git 
    use{"lewis6991/gitsigns.nvim"}
    -- lsp
    use{"neovim/nvim-lspconfig"}
    use{"glepnir/lspsaga.nvim"}
    use{"hrsh7th/nvim-cmp"}
    use{"saadparwaiz1/cmp_luasnip"}
    use{"hrsh7th/cmp-nvim-lua"}
    use{"hrsh7th/cmp-nvim-lsp"}
    use{"hrsh7th/cmp-buffer"}
    -- workflow 
    use{"kyazdani42/nvim-tree.lua"}
    use{"nvim-telescope/telescope.nvim"}
    use{"Pocco81/TrueZen.nvim"}
    use{"akinsho/toggleterm.nvim"}
    -- theme
    use{"shaunsingh/nord.nvim"}
end)
