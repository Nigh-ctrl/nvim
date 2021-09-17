require('settings')
require('plugins')

require('config.utils').autopairs()
require('config.utils').colorizer()

require('config.lspkind')
require('config.icons')
require('config.utils').comments()
require('config.utils').gitsigns()
require('config.lsp-config')
require('config.utils').lspsaga()
require('config.luasnip')
require('config.nvim-cmp')
