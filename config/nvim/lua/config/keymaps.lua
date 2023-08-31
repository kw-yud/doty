local funcs = require('doty.utils.functions')
local nmap = funcs.nmap

-- Remap command key
nmap('<leader><leader>', ':')
nmap('<C-p>', ':', {})

-- window
nmap('<C-q>', '<cmd>qall<cr>')
nmap('<C-S>', '<cmd>w<cr>')
nmap('<C-x>', '<cmd>x<cr>')

-- buffer navigation
-- nmap('<leader>bp', ':bprev<cr>', { desc = 'Prev buffer' })
-- nmap('<leader>bn', ':bnext<cr>', { desc = 'Next buffer' })
-- nmap('<leader>bd', ':bdelete<cr>', { desc = 'Delete buffer' })

-- tab navigation
-- nmap('<leader>tp', ':tabprevious<cr>', { desc = 'Prev tab' })
-- nmap('<leader>tn', ':tabnext<cr>', { desc = 'Next tab' })
-- nmap('<leader>td', ':tabclose<cr>', { desc = 'Close tab' })
