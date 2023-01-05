require'FTerm'.setup({
    border = 'double',
    dimensions  = {
        height = 0.9,
        width = 0.9,
    },
    cmd='powershell'
})

-- Example keybindings
vim.keymap.set('n', '<leader>i', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<leader>i', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
