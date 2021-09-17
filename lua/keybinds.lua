local cmd = vim.cmd
local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true}
local M = {}

local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local l = require("luasnip.extras").lambda
local r = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions")

M.lspsaga = function()
  return {
    --code action
    map('n', '<leader>aa', ":Lspsaga code_action<CR>", opt),
    map('v', '<leader>a', ":Lspsaga range_code_action<CR>", opt),
    -- hover dock
    map('n', '<leader>d', "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opt),
    --scroll in gover dock
    map('n', ';', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>",{}),
    map('n', ',', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>",{}),
    --signature help
    map('n', '<leader>s', "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", opt),
    --rename
    map('n', 'r', "<cmd>lua require('lspsaga.rename').rename()<CR>", opt), --preview definition map('n', 'sd', "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", opt), }
  } 
end

M.luasnip = function()
  local function prequire(...)
local status, lib = pcall(require, ...)
if (status) then return lib end
    return nil
end

local luasnip = prequire('luasnip')

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end
local check_back_space = function()
    local col = vim.fn.col('.') - 1 if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then return true else
        return false
    end
end

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif luasnip and luasnip.expand_or_jumpable() then
        return t "<Plug>luasnip-expand-or-jump"
    elseif check_back_space() then
        return t "<Tab>"
    else
        return vim.fn['compe#complete']()
    end
end
_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
    elseif luasnip and luasnip.jumpable(-1) then
        return t "<Plug>luasnip-jump-prev"
    else
        return t "<S-Tab>"
    end
end

vim.api.nvim_set_keymap("i", "<Tab>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<S-Tab>", "<Plug>luasnip-next-choice", {})
end

local cmp = require'cmp'

M.nvimcmp = function()
  return {
['<Tab>'] = cmp.mapping.select_next_item(),
['<S-Tab>'] = cmp.mapping.select_prev_item(),
['<Space>'] = cmp.mapping.confirm({select=true}),
  }
end
return M

