require('plugins/treesitter_setup')
require('plugins/webdev_icons')
require('plugins/coc-keysmap')
require('plugins/sidepanel-setup')
require('plugins/rose-theme-setup')
require('plugins/lualine-setup')
require('plugins/tabline-setup')
vim.cmd [[packadd packer.nvim]]

require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		width = 30,
		mappings = {
			list = {
				{ key = { '<C>', 'e' }, action = "NvimTreeToggle" },
			},
		},
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
})

return require('packer').startup(function()
	use 'junegunn/fzf.vim'
	use 'jose-elias-alvarez/null-ls.nvim'
	use "MunifTanjim/eslint.nvim"
	use "folke/neodev.nvim"
	use 'mbbill/undotree'
	--LSP SETUP--
	use {
		'junnplus/lsp-setup.nvim',
		requires = {
			'neovim/nvim-lspconfig',
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
		}
	}
	use { 'neoclide/coc.nvim', branch = 'release' }
	--Telescope--
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	-- THeme --
	use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
        require("rose-pine").setup()
        vim.cmd('colorscheme rose-pine')
    end
	})
	-- Tree sitter --
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}
	--Files Icons--
	use "kyazdani42/nvim-web-devicons"
	-- Nvim tree --
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}

	-- Добавляем Packer в список, чтобы он обновлял сам себя
	use 'wbthomason/packer.nvim'

	-- LSP сервер
	use 'neovim/nvim-lspconfig'

	-- Иконки для автодополнения
	use {
		'onsails/lspkind-nvim',
		config = function()
			require('plugins/lspkind')
		end
	}
	-- SideBar Panel --
	use('sidebar-nvim/sidebar.nvim')

	-- Инсталлер для серверов LSP
	use {
		'williamboman/nvim-lsp-installer',
		config = function()
			require('plugins/lsp-installer')
		end
	}

	-- Удобное меню для обозрения проблем LSP
	use {
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup {}
		end,
	}
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
end)
