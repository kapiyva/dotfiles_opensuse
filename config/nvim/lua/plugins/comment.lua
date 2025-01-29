require("Comment").setup({
  toggler = {
      ---Line-comment toggle keymap
      line = 'ccc',
      ---Block-comment toggle keymap
      block = 'ccb',
  },
  opleader = {
      ---Line-comment keymap
      line = 'cc',
      ---Block-comment keymap
      block = 'cb',
  },
  extra = {
      ---Add comment on the line above
      above = 'ccO',
      ---Add comment on the line below
      below = 'cco',
      ---Add comment at the end of line
      eol = 'ccA',
  },
})

vim.keymap.set('n', 'gc', "<Nop>", {})
vim.keymap.set('n', 'gcc', "<Nop>", {})
vim.keymap.set('v', 'gc', "<Nop>", {})

