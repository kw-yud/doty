local funcs = require('doty.utils.functions')
local nmap = funcs.nmap
local vmap = funcs.vmap

-- Remap command key
nmap('<leader><leader>', ':')
nmap('<C-p>', ':', {})

-- window
-- This is going to get me cancelled
nmap('<C-x>', '<cmd>x<CR>')
nmap("<C-c>", "<cmd>q!<CR>")
nmap('<C-s>', '<cmd>w<CR>')

vmap("J", ":m '<-2<CR>gv=gv")
vmap("K", ":m '>+2<CR>gv=gv")

-- buffer navigation
-- nmap('<leader>bp', ':bprev<cr>', { desc = 'Prev buffer' })
-- nmap('<leader>bn', ':bnext<cr>', { desc = 'Next buffer' })
-- nmap('<leader>bd', ':bdelete<cr>', { desc = 'Delete buffer' })

-- tab navigation
-- nmap('<leader>tp', ':tabprevious<cr>', { desc = 'Prev tab' })
-- nmap('<leader>tn', ':tabnext<cr>', { desc = 'Next tab' })
-- nmap('<leader>td', ':tabclose<cr>', { desc = 'Close tab' })
