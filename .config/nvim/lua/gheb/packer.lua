vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.4',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use { 
      'catppuccin/nvim', 
      as = 'catppuccin',

	  config = function()
		vim.cmd('colorscheme catppuccin-macchiato')
	  end
  }

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('nvim-tree/nvim-tree.lua')
  use('nvim-tree/nvim-web-devicons')
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use('lewis6991/gitsigns.nvim')
  use {
    'goolord/alpha-nvim',
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- Set header
        dashboard.section.header.val = {
            "                                                     ",
            "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
            "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
            "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
            "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
            "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
            "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚══  ╚═╝╚═╝     ╚═╝ ",
            "                                                     ",
        }

        -- Set menu
        dashboard.section.buttons.val = {
            dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
            dashboard.button( "f", "  > Find file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
            dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
            dashboard.button( "s", "  > Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
            dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
        }

        -- Send config to alpha
        alpha.setup(dashboard.opts)

        -- Disable folding on alpha buffer
        vim.cmd([[
            autocmd FileType alpha setlocal nofoldenable
        ]])
    end,
 }

  use {
	  'vonheikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  --- uncomment these if you want to manage lsp servers from neovim
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- lsp support
		  {'neovim/nvim-lspconfig'},
		  
		  -- autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'l3mon4d3/luasnip'},
	  }
  }
end)
