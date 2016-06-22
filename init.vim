call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'eagletmt/neco-ghc'
Plug 'junegunn/vim-easy-align'
Plug 'morhetz/gruvbox'
Plug 'lervag/vimtex'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'landaire/deoplete-d'
Plug 'itchyny/lightline.vim'
Plug 'JuliaLang/julia-vim'
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'benekastah/neomake'
" Add plugins to &runtimepath
call plug#end()
" Use deoplete.
set history=10000
set cpoptions+=J
set tags=tags;~,.tags;~
set path=.,**
set nrformats-=octal
set fileformat=unix
set wildignore=*.o
set wildignore+=*~
set wildignore+=*.pyc
set wildignore+=.git/*
set wildignore+=.hg/*
set wildignore+=.svn/*
set wildignore+=*.DS_Store
set wildignore+=CVS/*
set wildignore+=*.mod
set diffopt=filler,foldcolumn:0,context:4
" -------------------------------------------------------------------------------
" Backup, swap and undofile
" -------------------------------------------------------------------------------
set noswapfile
set nobackup
set undofile
set undolevels=1000
set undoreload=10000
set undodir=$HOME/.vim/undofiles

if !isdirectory(&undodir)
  call mkdir(&undodir)
endif

" -------------------------------------------------------------------------------
" Behaviour
" -------------------------------------------------------------------------------
set autochdir
set autoread
set lazyredraw
set confirm
set hidden
set backspace=indent,eol,start
set shortmess=aoOtT
silent! set shortmess+=cI
set textwidth=79
set nowrap
set linebreak
set comments=n:>
set formatoptions+=ronl1j
set formatlistpat=^\\s*[-*]\\s\\+
set formatlistpat+=\\\|^\\s*(\\(\\d\\+\\\|[a-z]\\))\\s\\+
set formatlistpat+=\\\|^\\s*\\(\\d\\+\\\|[a-z]\\)[:).]\\s\\+
set winaltkeys=no
set mouse=

" -------------------------------------------------------------------------------
" Completion
" -------------------------------------------------------------------------------
set wildmenu
set wildmode=longest:full,full
set wildcharm=<c-z>
set complete+=U,s,k,kspell,d,]
set completeopt=longest,menu,preview

" -------------------------------------------------------------------------------
" Presentation
" -------------------------------------------------------------------------------
set list
set listchars=tab:▸\ ,nbsp:%,trail:\ ,extends:,precedes:
set fillchars=vert:│,fold:\ ,diff:⣿
set matchtime=2
set matchpairs+=<:>
set cursorline
set scrolloff=10
set splitbelow
set splitright
set previewheight=20
set noshowmode
set laststatus=2

if !has('gui_running')
  set visualbell
  set t_vb=
endif

" -------------------------------------------------------------------------------
" Folding
" -------------------------------------------------------------------------------
if &foldmethod ==# ''
  set foldmethod=syntax
endif
set foldlevel=0
set foldcolumn=0
set foldtext=TxtFoldText()

function! TxtFoldText()
  let level = repeat('-', min([v:foldlevel-1,3])) . '+'
  let title = substitute(getline(v:foldstart), '{\{3}\d\?\s*', '', '')
  let title = substitute(title, '^["#! ]\+', '', '')
  return printf('%-4s %-s', level, title)
endfunction

" -------------------------------------------------------------------------------
" Indentation
" -------------------------------------------------------------------------------
set tabstop=2
set softtabstop=2
set shiftwidth=2

set smarttab
set expandtab

set autoindent
set copyindent
set preserveindent
silent! set breakindent

" -------------------------------------------------------------------------------
" Searching and movement
" -------------------------------------------------------------------------------
set nostartofline
set ignorecase
set smartcase
set infercase
set incsearch
set showmatch

set display=lastline
set virtualedit=block

if executable('ack-grep')
  set grepprg=ack-grep\ --nocolor
endif
"----------------------------------------------------------------------------------
" Gui Setting
"---------------------------------------------------------------------------------      
set guioptions+=c  
set guioptions-=m   
"set guioptions-=T        
set guioptions-=L    
set guioptions-=r      
set guioptions-=b 
"set showtabline=0 
set cursorline    
hi CursorLineNr term=bold ctermfg=Yellow gui=bold guifg=Yellow
set guifont=Ubuntu\ Mono\ 15
colorscheme gruvbox
let g:deoplete#enable_at_startup = 1
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_latexmk_progname = 'nvr'
let g:vimtex_latexmk_continuous = 1
" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
let g:necoghc_enable_detailed_browse = 1
" Neomake
set statusline+=%#warningmsg#
set statusline+=%*
let g:neomake_always_populate_loc_list = 1
let g:neomake_auto_loc_list = 0
let g:neomake_check_on_open = 1
" autocmd! BufWritePost * Neomake
let g:neomake_check_on_wq = 0
let g:neomake_mode_map = { 'passive_filetypes': ['d'] }
let g:neomake_html_tidy_exec = '/usr/local/bin/tidy -config ~/.config/tidy/tidy.conf' " Override for HTML5 tidy
let g:neomake_html_tidy_blocklevel_tags = ['nav']
