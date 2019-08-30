syntax enable
set shiftwidth=4  "autoindent's length
set softtabstop=4 "change the length of the tab by this 
set tabstop=4    "set the length of tab
set autoindent	 "autoindent
"set textwidth=79 "the characters showed in one line
set fileformat=unix
set showmatch	 "highlight matching parentheses
set incsearch	 "show the result of search inmediately
set hlsearch	 "highlight the result
set encoding=utf-8  "setting for YCM
set foldmethod=syntax	"set the fold function method to fold by syntax of
" Always draw the signcolumn.
set signcolumn=yes
set pastetoggle=

"keymap settings
"differences between map,nnoremap,inoremap,vnoremap
"good explain:http://haoxiang.org/2011/09/vim-modes-and-mappin/
" Alias leader settings
let mapleader="m"
"nnoremap <leader>y "*y
nnoremap <leader>v :vsplit	
"represent :vertically split
nnoremap <leader>h :sp	
"split horizontally
nnoremap <leader>w :w<CR>
"stop highlighting
nnoremap <leader>H :nohl<CR>
"tab settings
nnoremap <leader>1 :1gt
nnoremap <leader>2 :2gt
nnoremap <leader>3 :3gt
nnoremap <leader>c zc
nnoremap <leader>o zo
"settings for singleCompile
nmap <F9> :SCCompile<cr>
nmap <F10> :SCCompileRun<cr>
nmap <leader>/ <Plug>DashSearch
nmap <leader>g <Plug>DashGlobalSearch

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nnoremap go <c-o>

"nmap <leader>r :call coc#refresh()<CR>

let g:JavaComplete_JavaCompiler="/Library/Java/JavaVirtualMachines/jdk-11.0.1.jdk/Contents/Home"

let g:LanguageClient_serverCommands = {
    \ 'cpp': ['cquery', '--log-file=/tmp/cq.log'],
    \ 'c': ['cquery', '--log-file=/tmp/cq.log'],
    \ }

let g:rustfmt_autosave = 1

let g:LanguageClient_loadSettings = 1 " Use an absolute configuration path if you want system-wide settings
let g:LanguageClient_settingsPath = '~/.config/nvim/settings.json'
set completefunc=LanguageClient#complete
set formatexpr=LanguageClient_textDocument_rangeFormatting()
nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> gs :call LanguageClient#textDocument_documentSymbol()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" map to <Leader>k in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>k :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>k :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

"some basic configure
set nocompatible        " close compatible mode
filetype plugin on      " load filetype-specific plugin
filetype indent on      " load filetype-specific indent files
set relativenumber      " show relative line number
set number
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.

"ctrlp settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|pyc)$' 

"tagbar settings
nmap <F8> :TagbarToggle<CR>

"nerdTree settings
let g:nerdtree_tabs_open_on_console_startup=1	"nerdTree start when vim is used
map <leader>t :NERDTreeToggle<CR>	"start or hide tree
let NERDTreeShowLineNumbers=1	"show the number of the line
let NERDTreeAutoCenter=1	"used with the one above
let NERDTreeShowHidden=1	"show hidden files
let NERDTreeWinSize=40		"set the width of the tree
"nerdTree git settings
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

"lightline settings
set laststatus=2	"used to configure lightline
set noshowmode		"hide the mode because lightline has included it

"enable rainbow
let g:rainbow_active = 1

"java complete settings"
autocmd FileType java setlocal omnifunc=javacomplete#Complete

"vim-racer
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

"Above is customized by Karl-Han
filetype off                  " required

call plug#begin('~/.vim/bundle')

" The following are examples of different formats supported.
" Keep Plug commands between vundle#begin/end.

" plugin on GitHub repo
Plug 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plug 'L9'
" Git plugin not hosted on GitHub
Plug 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plug 'file:///home/gmarik/path/to/plugin'
"
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plug 'ascenator/L9', {'name': 'newL9'}
"
"Plug added by Karl-Han
Plug 'rust-lang/rust.vim'
"Plug ctrlp
Plug 'ctrlpvim/ctrlp.vim'
"Plug lightline
"https://github.com/itchyny/lightline.vim
Plug 'itchyny/lightline.vim'
"Plug nerdtree
"https://github.com/scrooloose/nerdtree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug corporate with nerdTree
Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug Tagbar
"https://github.com/majutsushi/tagbar
Plug 'majutsushi/tagbar'
"Plug YCM
""https://github.com/Valloric/YouCompleteMe
"Plug 'Valloric/YouCompleteMe'
"Plug tern_for_vim
Plug 'ternjs/tern_for_vim'
"Plug pair branket
"Plug 'file:///home/karlh/.vim/bundle/auto-pair'
"Plug 'jiangmiao/auto-pair'
"Plug vim-startify
Plug 'mhinz/vim-startify'
"Plug 'artur-shaik/vim-javacomplete2'
Plug 'artur-shaik/vim-javacomplete2'
"Plug 'xuhdev/SingleCompile'
Plug 'xuhdev/SingleCompile'
"Plug 'othree/xml.vim'
Plug 'othree/xml.vim'
"delimit
Plug 'Raimondi/delimitMate'
"Plug 'luochen1990/rainbow'
"indent line
Plug 'Yggdroot/indentLine'
"Dash for vim
Plug 'rizzatti/dash.vim'
" coc.vim
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" Assembly indent
Plug 'philj56/vim-asm-indent'
Plug 'racer-rust/vim-racer'
Plug 'shirk/vim-gas'
Plug 'wakatime/vim-wakatime'
Plug 'christoomey/vim-tmux-navigator'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" (Optional) Multi-entry selection UI.
"Plug 'junegunn/fzf'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Add maktaba and bazel to the runtimepath.
" (The latter must be installed before it can be used.)
Plug 'google/vim-maktaba'
Plug 'bazelbuild/vim-bazel'

" Integrate clang-format
Plug 'kana/vim-operator-user'
Plug 'rhysd/vim-clang-format'

" All of your Plugs must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"Auto pair parentheses and other things
function! AutoPair(open, close)
        let line = getline('.')
        if col('.') > strlen(line) || line[col('.') - 1] == ' '
                return a:open.a:close."\<ESC>i"
        else
                return a:open
        endif
endf

function! ClosePair(char)
        if getline('.')[col('.') - 1] == a:char
                return "\<Right>"
        else
                return a:char
        endif
endf

function! SamePair(char)
        let line = getline('.')
        if col('.') > strlen(line) || line[col('.') - 1] == ' '
                return a:char.a:char."\<ESC>i"
        elseif line[col('.') - 1] == a:char
                return "\<Right>"
        else
                return a:char
        endif
endf

" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

"let g:coc_snippet_next = "<tab>"
"let g:coc_snippet_prev = "<C-j>"
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
"
" " Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
"
" " Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
"
" " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
"
" " Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" Auto compile
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!java %<"
	elseif &filetype == 'sh'
		:!./%
	elseif &filetype == 'py'
		exec "!python %"
		exec "!python %<"
	endif
endfunction
function SetLSPShortcuts()
  nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
  nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
  nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
  nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
  nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
  nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
  nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
  nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
  nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
  nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
endfunction()
" Go to def in a split
call LanguageClient#textDocument_definition({'gotoCmd': 'split'})

augroup LSP
  autocmd!
  autocmd FileType cpp,c call SetLSPShortcuts()
augroup END
