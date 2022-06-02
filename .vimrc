set nocompatible
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'kien/ctrlp.vim'
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'jiangmiao/auto-pairs'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'

call plug#end()

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-prettier',
  \ 'coc-json',
  \ ]

" coc make selection
" Use <c-space> to trigger completion.
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nmap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeGitStatusWithFlags = 1

colorscheme gruvbox
set background=dark

" Show line numbers
set number

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

imap kj <Esc>
set re=0

set clipboard=unnamed
