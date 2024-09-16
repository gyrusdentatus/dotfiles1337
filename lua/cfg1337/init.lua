-- Import modules
require("cfg1337.remap")
require("cfg1337.set")

-- Set the Python 3 provider to the correct path
vim.g.python3_host_prog = '/Users/hans/.venv/neovim/bin/python'

-- Install Packer plugin manager
vim.cmd [[packadd packer.nvim]]

-- Packer startup function for managing plugins
require('packer').startup(function(use)
  -- Packer manages itself
  use 'wbthomason/packer.nvim'

  -- Nvim-Tree for file exploration
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'  -- Optional: For file icons

  -- Add nvim-treesitter plugin
  use 'nvim-treesitter/nvim-treesitter'

  -- Telescope for enhanced searching
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- vim-dispatch for asynchronous command execution
  use 'tpope/vim-dispatch'
end)  -- Close the packer startup function here

-- Neovim general settings
vim.o.timeoutlen = 300 -- Set delay for key mappings
vim.o.termguicolors = true -- Enable true color support
vim.o.clipboard = 'unnamedplus' -- Use system clipboard
vim.o.number = true -- Show line numbers
vim.o.relativenumber = true -- Show relative line numbers
vim.o.expandtab = true -- Convert tabs to spaces
vim.o.shiftwidth = 4 -- Number of spaces for each indent
vim.o.tabstop = 4 -- Number of spaces that a <Tab> counts for

-- Nvim-Tree configuration with updated key mappings
local function my_on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return {
      desc = 'nvim-tree: ' .. desc,
      buffer = bufnr,
      noremap = true,
      silent = true,
      nowait = true
    }
  end

  -- Set up your key mappings here
  vim.keymap.set('n', 'l',     api.node.open.edit,             opts('Edit'))
  vim.keymap.set('n', '<CR>',  api.node.open.edit,             opts('Edit'))
  vim.keymap.set('n', 'o',     api.node.open.edit,             opts('Edit'))
  vim.keymap.set('n', 'h',     api.node.navigate.parent_close, opts('Close Directory'))
  vim.keymap.set('n', 'v',     api.node.open.vertical,         opts('Open: Vertical Split'))
end

require('nvim-tree').setup {
  on_attach = my_on_attach,
  view = {
    width = 30,
    side = 'left',
  },
  -- Include other options if necessary
}

-- Rest of your configuration follows...
