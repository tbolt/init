---------------------------------- Aliases ------------------------------------
local A = {}
A.map = vim.keymap.set
A.opts = {
  n = { noremap = true },
  ns = { noremap = true, silent = true },
}

---------------------------------- Options ------------------------------------
vim.loader.enable()

vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "menuone", "noinsert", "noselect" }
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.inccommand = "nosplit"
vim.opt.lazyredraw = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.pumblend = 15
vim.opt.scrolloff = 10
vim.opt.shiftwidth = 2
vim.opt.showmode = false
vim.opt.sidescrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.softtabstop = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.timeoutlen = 250
vim.opt.updatetime = 100
vim.opt.undofile = true
vim.opt.wildignorecase = true
vim.opt.wildmode = "longest:full,full"
vim.opt.wrap = false
vim.opt.writebackup = false
vim.opt.syntax = on

---------------------------------- Keybinds -----------------------------------
---- readline/emacs keys for i and c modes
vim.g.mapleader = " "
A.map({ 'c', 'i' }, '<C-a>', '<Home>', A.opts.n)
A.map({ 'c', 'i' }, '<C-b>', '<Left>', A.opts.n)
A.map({ 'c', 'i' }, '<C-d>', '<Del>', A.opts.n)
A.map({ 'c', 'i' }, '<C-e>', '<End>', A.opts.n)
A.map({ 'c', 'i' }, '<C-f>', '<Right>', A.opts.n)
A.map({ 'c', 'i' }, '<M-BS>', '<C-w>', A.opts.n)

---- window navigation
A.map('t', '<C-h>', '<C-\\><C-N><C-w>h', A.opts.ns)
A.map('t', '<C-j>', '<C-\\><C-N><C-w>j', A.opts.ns)
A.map('t', '<C-k>', '<C-\\><C-N><C-w>k', A.opts.ns)
A.map('t', '<C-l>', '<C-\\><C-N><C-w>l', A.opts.ns)
A.map('n', '<C-h>', '<C-w>h', A.opts.ns)
A.map('n', '<C-j>', '<C-w>j', A.opts.ns)
A.map('n', '<C-k>', '<C-w>k', A.opts.ns)
A.map('n', '<C-l>', '<C-w>l', A.opts.ns)

---- terminal buffer mappings
A.map('t', '<C-[>', '<C-\\><C-n>', A.opts.ns)
A.map('t', '<C-h>', '<C-\\><C-N><C-w>h', A.opts.ns)
A.map('t', '<C-j>', '<C-\\><C-N><C-w>j', A.opts.ns)
A.map('t', '<C-k>', '<C-\\><C-N><C-w>k', A.opts.ns)
A.map('t', '<C-l>', '<C-\\><C-N><C-w>l', A.opts.ns)
---------------------------------- Plug-Ins -----------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, _ = pcall(require, "lazy")
if not status_ok then
  return
end

require("lazy").setup({
  ---- LSP, Completions, Git, Telescope
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-telescope/telescope.nvim' },
  { 'nvim-telescope/telescope-fzy-native.nvim', run = 'make' }, -- improves sorting performance
  { 'fannheyward/telescope-coc.nvim' },
  { 'neoclide/coc.nvim',                        branch = 'release' },
  -- { 'ahmedkhalf/project.nvim' },
  { 'tpope/vim-fugitive' },

  ---- Theme and Formatting
  { "Mofiqul/adwaita.nvim" },
  { 'nyoom-engineering/oxocarbon.nvim' },
  { 'nvim-lualine/lualine.nvim' },
  { 'glepnir/dashboard-nvim' },
  { 'nvim-treesitter/nvim-treesitter',          run = ':TSUpdate' },
  { 'nvim-tree/nvim-tree.lua' },
  { 'nvim-tree/nvim-web-devicons' },
  { 'lukas-reineke/indent-blankline.nvim' },

  ---- UI Elements
  -- { 'mbbill/undotree' },
  -- { 'akinsho/toggleterm.nvim' },
  -- { 'gbprod/yanky.nvim' },
  -- { 'numToStr/Comment.nvim' },
  -- { 'kylechui/nvim-surround' },
  -- { 'windwp/nvim-autopairs' },

  ---- Tmux-Vim Integration
  -- { 'aserowy/tmux.nvim' }
})

--------------------------------- Dashboard -----------------------------------
require('dashboard').setup({
  theme = 'doom',
  config = {
    center = {
      { icon = '  🧰  ', desc = 'Plugin Manager ', action = 'Lazy' },
      { icon = '  ⚙️   ', desc = 'Config         ', action = 'e ~/.config/nvim/init.lua' },
    },
    header = {
      [[                                                       ]],
      [[                                                       ]],
      [[                                                       ]],
      [[                                                       ]],
      [[                                                       ]],
      [[                                                       ]],
      [[                                                       ]],
      [[                                                       ]],
      [[                                                       ]],
      [[                                                       ]],
      [[                                                       ]],
      [[                                                       ]],
      [[                                                       ]],
      [[                                                       ]],
      [[                                                       ]],
      [[                                                       ]],
      [[                                                       ]],
      [[                                                       ]],
      [[                                                       ]],
      [[                                                       ]],
      [[                                                       ]],
      [[              __ ___.          .__   __                ]],
      [[            _/  |\_ |__   ____ |  |_/  |_              ]],
      [[            \   __\ __ \ /  _ \|  |\   __\             ]],
      [[             |  | | \_\ (  <_> )  |_|  |               ]],
      [[             |__| |___  /\____/|____/__|               ]],
      [[                      \/                               ]],
      [[             🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥               ]],
      [[                                                       ]],
      [[                                                       ]],
      [[                                                       ]],
      [[                                                       ]]
    },
  },
})

--------------------------------- Theme ---------------------------------------
--vim.opt.background = "dark" -- set this to dark or light
--vim.cmd("colorscheme oxocarbon")
vim.g.adwaita_disable_cursorline = true -- to disable cursorline
vim.cmd([[colorscheme adwaita]])

----------------------------- Indentline --------------------------------------
require("indent_blankline").setup({
  char = '▏',
  use_treesitter = true,
  show_first_indent_level = false,
  filetype_exclude = { 'dashboard', 'help', 'undotree' },
  buftype_exclude = { 'nofile', 'terminal' }
})

------------------------------- Lualine ---------------------------------------
local big_screen = function() return vim.fn.winwidth(0) > 90 end
require 'lualine'.setup({
  extensions = { 'quickfix' },
  options = {
    disabled_filetypes = { 'dashboard', 'NvimTree', 'undotree' },
    icons_enabled = false
  },
  sections = {
    lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 1) end } },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = { { 'g:coc_status', cond = big_screen } },
    lualine_y = { { 'progress', cond = big_screen } },
    lualine_z = { { 'location', cond = big_screen } }
  },
})

------------------------------- NvimTree --------------------------------------
A.map('n', '<C-e>', ':NvimTreeToggle<CR>', A.opts.ns)

local function nvim_tree_on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
  vim.keymap.set('n', 'l', api.node.open.replace_tree_buffer, opts('Open: In Place'))
  vim.keymap.set('n', '<BS>', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', '<C-s>', api.node.open.vertical, opts('Open: Vertical Split'))
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))

  vim.keymap.del('n', '<C-e>', { buffer = bufnr })
  vim.keymap.del('n', '<C-x>', { buffer = bufnr })
end

require('nvim-tree').setup({
  actions             = {
    open_file = { quit_on_open = true },
  },
  renderer            = {
    indent_markers = { enable = true }
  },
  respect_buf_cwd     = true,
  on_attach           = nvim_tree_on_attach,
  sync_root_with_cwd  = true,
  update_focused_file = { enable = true, update_root = true },
  view                = {
    side = 'left',
    width = 42,
  },
})

---------------------------- Treesitter ---------------------------------------
require 'nvim-treesitter.configs'.setup({
  ensure_installed = {
    "bash",
    "comment",
    "css",
    "dockerfile",
    "gitignore",
    "go",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "python",
    "regex",
    "rust",
    "scss",
    "sql",
    "toml",
    "tsx",
    "typescript",
    "yaml",
  },
  highlight = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "+",
      node_incremental = "+",
      node_decremental = "_",
    },
  },
  indent = { enable = true }
})

-------------------------------- COC Config -----------------------------------
vim.g.coc_global_extensions = {
  'coc-css',
  'coc-emmet',
  'coc-git',
  'coc-highlight',
  'coc-html',
  'coc-json',
  'coc-lua',
  'coc-marketplace',
  'coc-prettier',
  'coc-pyright',
  'coc-rust-analyzer',
  'coc-tsserver',
}

vim.cmd [[
    function! CheckBackspace() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : CheckBackspace() ? "\<Tab>" : coc#refresh()
    inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
    inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    nnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-d>"
    nnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-u>"
    inoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Del>"
    inoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : ""
]]

A.map('n', 'K', ":call CocActionAsync('doHover')<CR>", A.opts.ns)

A.map('n', 'gd', ':Telescope coc definitions<CR>', A.opts.ns)
A.map('n', 'gi', ':Telescope coc implementations<CR>', A.opts.ns)
A.map('n', 'gr', ':Telescope coc references<CR>', A.opts.ns)
A.map('n', 'gt', ':Telescope coc type_definitions<CR>', A.opts.ns)
A.map('n', '<Leader>rn', '<Plug>(coc-rename)')

A.map('n', '<Leader>la', ':Telescope coc file_code_actions<CR>', A.opts.ns)
A.map('n', '<Leader>ld', ':Telescope coc diagnostics<CR>', A.opts.ns)
A.map('n', '<Leader>ls', ':Telescope treesitter<CR>', A.opts.ns)

A.map('n', '[d', '<Plug>(coc-diagnostic-prev)', A.opts.ns)
A.map('n', ']d', '<Plug>(coc-diagnostic-next)', A.opts.ns)

---- coc-git
A.map('n', '[c', '<Plug>(coc-git-prevchunk)', A.opts.ns)
A.map('n', ']c', '<Plug>(coc-git-nextchunk)', A.opts.ns)
A.map('n', 'gc', ':CocCommand git.chunkInfo<cr>', A.opts.ns)
A.map('n', 'gb', ':CocCommand git.showBlameDoc<cr>', A.opts.ns)

------------------------------ Telescope --------------------------------------
local actions = require('telescope.actions')
require('telescope').setup({
  defaults = {
    entry_prefix = "  ",
    layout_config = {
      horizontal = {
        preview_cutoff = 150,
        preview_width = 0.45,
        prompt_position = "top"
      },
      width = 0.9
    },
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<C-r>"] = actions.delete_buffer,
        ["<C-s>"] = actions.select_horizontal,
        ["<C-t>"] = actions.toggle_selection,
        ["<M-BS>"] = { "<c-s-w>", type = "command" },
      },
      n = {
        ["<C-t>"] = actions.toggle_selection,
      },
    },
    path_display = { shorten = 5 },
    prompt_prefix = "🪄",
    selection_caret = "→",
    sorting_strategy = "ascending",
  },
})
require('telescope').load_extension('coc')
require('telescope').load_extension('fzy_native')
-- require('telescope').load_extension('projects')
-- require('telescope').load_extension('yank_history')

vim.cmd [[command! -nargs=0 Help lua require('telescope.builtin').help_tags()<cr>]]
vim.cmd [[command! -nargs=0 Maps lua require('telescope.builtin').keymaps()<cr>]]

A.map('n', '<Leader>b', ':Telescope buffers<CR>', A.opts.ns)
A.map('n', '<Leader>c', ':Telescope commands<CR>', A.opts.ns)
A.map('n', '<Leader>f', ':Telescope find_files<CR>', A.opts.ns)
A.map('n', '<Leader>g', ':Telescope live_grep<CR>', A.opts.ns)
A.map('n', '<Leader>h', ':Telescope oldfiles<CR>', A.opts.ns)
A.map('n', '<Leader>p', ':Telescope projects<CR>', A.opts.ns)
A.map('n', '<Leader>y', ':Telescope yank_history<CR>', A.opts.ns)
A.map('n', '<Leader>r', ':Telescope registers<CR>', A.opts.ns)

vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 800,
    })
  end,
})
