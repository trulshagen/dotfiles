" Settings
" ---------

set fileformat=unix     " Always UNIX line endings
set fileencoding=utf-8
set visualbell          " don't make noise
set ttyfast

set hlsearch      " hilight search matches
set incsearch     " find as you type
set ignorecase    " ignore case in search patterns
set smartcase     " ... unless the pattern has capitals

set showmatch     " indicate matching paren in insert mode
set showcmd       " show current uncompleted command
set laststatus=2  " always show status line
set ruler         " Show cursor position
set wildmenu      " Show some autocomplete option in the status bar

set list
set listchars=tab:▸\ ,extends:>,precedes:<,trail:␣

set formatoptions=tcrqn1

set smartindent   " Smarter than autoindent ;)
set tabstop=4     " a tab is four spaces wide
set softtabstop=4 " backspace over softtabs
set shiftwidth=4  " spaces for indent
set expandtab     " spaces, not tabs
set backspace=indent,eol,start

let mapleader=","

" Mappings
" ========

map :W :w
map :Q :q

map :W! :w!
map :Q! :q!


" Sensible regexes
nnoremap / /\v
vnoremap / /\v

" Ctrl-tab to correctly indent line in insert mode
inoremap <C-tab> <C-o>V=
" reformat text
nnoremap Q gqap
vnoremap Q gq
" clear hilighting from search
nnoremap <leader><Space> :nohl<CR>

" Up and down moves through visible lines, not over them.
nnoremap j gj
nnoremap k gk
nnoremap <up> gk
nnoremap <down> gj

nnoremap <F1> <ESC>
inoremap <F1> <ESC>
vnoremap <F1> <ESC>

" clean trailing whitespace
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>

" Run-ninja
map <leader>r :!./%<CR>

" Change tab settings
nnoremap <leader>t2 :setlocal shiftwidth=2 tabstop=2 softtabstop=2
nnoremap <leader>t4 :setlocal shiftwidth=4 tabstop=4 softtabstop=4
nnoremap <leader>t8 :setlocal shiftwidth=8 tabstop=8 softtabstop=8

" Code completion
" ===============

" :help new-omni-completion
" C-x C-o for completion, C-x C-o|n|<Down> for next, C-x C-p|<Up> for prev
" Should have method definitions as well
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python set keywordprg=pydoc
autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby set keywordprg=ri
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS


set pastetoggle=<F9>
