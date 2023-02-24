vim.api.nvim_command('set number')
vim.opt.splitright = true
vim.api.nvim_command('set showtabline=2')
vim.api.nvim_command('set lsp=3')
vim.api.nvim_command('set lcs=tab:·· list')
vim.opt.splitbelow = true
vim.api.nvim_command('set spell')
vim.api.nvim_command('set spelllang=en_us')
vim.opt.clipboard = 'unnamedplus'
vim.opt.fixeol = false

vim.opt.completeopt = 'menuone,noselect'
vim.cmd [[autocmd BufEnter * set fo-=c fo-=r fo-=o]]
