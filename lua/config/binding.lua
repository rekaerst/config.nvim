local u = require('utils')

u.lmap('ww', ':w<CR>')
u.lmap('wa', ':wa<CR>')

u.lmap('ve',
				':if &ve == "all" | echo "disable venn " | set ve= | else | set ve=all | echo "enable venn" | endif | :lua Toggle_venn() <cr>')

u.lmap('id', ':IndentGuidesToggle<CR>')

u.imap('<C-a>', '<C-o>^')
u.imap('<C-e>', '<C-o>$')
