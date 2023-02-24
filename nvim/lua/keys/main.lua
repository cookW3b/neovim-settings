require('keys/alias')
require('keys/telescope_keymap')

nm('<C-w>', ':NvimTreeToggle<cr>')
nm('<C-y>', ':SidebarNvimToggle<cr>')
nm('<F5>', ':UndotreeToggle<cr>')
nm('<F6>', ':UndotreeFocus<cr>')
nm('<F1>', ':BufferLinePickClose<cr>')
nm('<F2>', ':BufferLineCyclePrev<cr>')
nm('<F3>', ':BufferLineCycleNext<cr>')
nm('<F4>', ':TablineToggleShowAllBuffers<cr>')

nm('<leader>]', ":.,s/'/`/g<cr>")
nm('<leader>[', ':.,s/"/`/g<cr>')
