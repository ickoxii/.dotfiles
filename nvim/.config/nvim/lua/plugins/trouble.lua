-- Pretty list for showing diagnostics, references, telescope results,
-- quickfix, and location lists
--
-- https://github.com/folke/trouble.nvim

return {
  'folke/trouble.nvim',
  opts = {},
  cmd = 'Trouble',
  keys = {
    {
      '<leader>tt',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = 'Trouble: [T]oggle [T]rouble Current Buffer',
    },
    {
      '<leader>tp',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Trouble: [T]oggle Trouble [P]roject Wide',
    },
    {
      '<leader>tl',
      '<cmd>Trouble loclist toggle<cr>',
      desc = 'Trouble: [T]oggle [L]ocation List',
    },
    {
      '<leader>td',
      '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
      desc = 'Trouble: [T]oggle LSP [D]efinitions / references / ...',
    },
    {
      '<leader>tq',
      '<cmd>Trouble qflist toggle<cr>',
      desc = 'Trouble: [T]oggle [Q]uickfix List',
    },
  },
}
