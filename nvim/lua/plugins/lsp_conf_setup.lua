local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config
local null_ls = require('null-ls')

lspconfig.lua_ls.setup({})
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

lsp_defaults.capabilities = vim.tbl_deep_extend(
	'force',
	lsp_defaults.capabilities,
	require('cmp_nvim_lsp').default_capabilities()
)

require('lsp-setup').setup({
	servers = {
		lua_ls = require('neodev').setup({
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						format = {
							enable = true,
						}
					}
				}
			}),
		}),
		eslint = require('eslint').setup({
			bin = 'eslint', -- or `eslint_d`
			code_actions = {
				enable = true,
				apply_on_save = {
					enable = true,
					types = { "directive", "problem", "suggestion", "layout" },
				},
				disable_rule_comment = {
					enable = true,
					location = "separate_line", -- or `same_line`
				},
			},
			diagnostics = {
				enable = true,
				report_unused_disable_directives = false,
				run_on = "type", -- or `save`
			},
		}),
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.diagnostics.eslint,
				null_ls.builtins.completion.spell,
			},
		}),
	},
})
