set nocompatible
call plug#begin('~/.local/share/nvim/site/autoload')

Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'jiangmiao/auto-pairs'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter'

Plug 'alvan/vim-closetag'
Plug 'AndrewRadev/tagalong.vim'
Plug 'KabbAmine/vCoolor.vim'

Plug 'rust-lang/rust.vim'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

call plug#end()

"packer
lua require("plugins")

" lsp
lua require("lsp")

" Telescope shortcuts
nnoremap <silent>ff :Telescope find_files<CR>
nnoremap <silent>fg :Telescope live_grep<CR>
nnoremap <silent>fb :Telescope buffers<CR>

nmap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeGitStatusWithFlags = 1
let NERDTreeShowHidden=1

colorscheme gruvbox
set background=dark

" Show line numbers
set nu
set relativenumber

" Status bar
set laststatus=2

" Auto wrap
set wrap

set hlsearch "Highlights search terms"
set incsearch "Highlights search terms as you type them"
set showmatch "Highlights matching parentheses"
set ignorecase "Ignores case when searching"
set smartcase "Unless you put some caps in your search term"

set encoding=UTF-8
set guifont=Fira_Code:h16

imap kj <Esc>
set re=0

" Horizontal bar
if exists("&colorcolumn")
  set colorcolumn=80
endif

" Misc
set nohlsearch
set noerrorbells

" map leader to space
let mapleader = " "

set splitbelow
set mouse=a
set clipboard=unnamed