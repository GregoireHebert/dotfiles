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

    use {
        'folke/noice.nvim',
        requires = {
            {'MunifTanjim/nui.nvim'},
            {'rcarriga/nvim-notify'},
            {'VonHeikemen/fine-cmdline.nvim'},
        },
        config = function()
            require("noice").setup {
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                    },
                },
                -- you can enable a preset for easier configuration
                presets = {
                    bottom_search = true, -- use a classic bottom cmdline for search
                    command_palette = true, -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false, -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = false, -- add a border to hover docs and signature help
                },    
            }
        end
    }

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use("nvim-treesitter/nvim-treesitter-context");
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use("laytan/cloak.nvim")
    use('tpope/vim-fugitive')
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use('lewis6991/gitsigns.nvim')

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

    use({
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    })
end)
