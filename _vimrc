" Last update: 13.05.2021 16:56
"------------------------------------------------------------------------------------

"------------------------------------------------------------------------------------
" Basic settings
"------------------------------------------------------------------------------------
set autowrite
set backspace=indent,eol,start " Turn backspace on
set cmdheight=2 " Prevent 'Press Enter' message after most commands
set clipboard=unnamed "Use system clipboard
set colorcolumn=100
set complete+=kspell
set completeopt=menuone,longest
set confirm " Use dialogs instead of error messages
set copyindent
set cursorline " Underline current line
set cursorcolumn
set encoding=utf-8
set guioptions-=T " Kill GUI toolbar
set guioptions-=m " Kill menu
set hlsearch " Coloring the searching words
set incsearch
set laststatus=2
set linebreak
set list
set listchars=tab:▸\ ,trail:✖,precedes:←,extends:→,eol:↲,nbsp:✖,
set number
set nobackup
set noerrorbells visualbell t_vb= " Turn off the sound in Windows
set noexpandtab
set noshowmode " Don't show statusline
set noswapfile
set nowrap
set nowritebackup
set preserveindent
set ruler
set scrolloff=6 " Scroll page before 6 lines
set showbreak=↪
set showcmd
set shiftwidth=2
set shortmess+=c
set selection=inclusive
set signcolumn=yes " Always show the colums for git changes
set smartcase
set smartindent
set softtabstop=0
set splitbelow "Split page below and right of the page
set splitright
set tabstop=2
set textwidth=100 " Max line width
set termencoding=utf-8

retab!

"------------------------------------------------------------------------------------
" Plugins
"------------------------------------------------------------------------------------
set nocompatible
filetype off
set rtp+=~/vimfiles/bundle/Vundle.vim
call vundle#begin('~/vimfiles/bundle')
Plugin 'VundleVim/Vundle.vim'

Plugin 'matze/vim-move' " Move lines with Ctrl+J/K/H/L
let g:move_key_modifier = 'C'

Plugin 'godlygeek/tabular' " visual mode :Tabular /symbol

Plugin 'airblade/vim-gitgutter' " Shows the diff for git
let g:gitgutter_sign_added = '✔'
let g:gitgutter_sign_modified = 'µ' "Ctrl-v + u00b5
let g:gitgutter_sign_removed = '✖'
let g:gitgutter_sign_removed_first_line = 'Ƒ' "Ctrl-v + u0191
let g:gitgutter_sign_modified_removed = 'Ø' "Ctrl-v + u00d8
highlight GitGutterAdd		guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

Plugin 'fidian/hexmode' " :Hexmode

Plugin 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default

Plugin 'SirVer/ultisnips' " Track the engine.
let g:UltiSnipsExpandTrigger="<TAB>"
let g:UltiSnipsListSnippets="<C-S-TAB>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="normal" " was vertical
let g:UltiSnipsSnippetDirectories=["mysnippets"]

Plugin 'luochen1990/rainbow' " Rainbow parenthesises
let g:rainbow_active = 1

Plugin 'mzlogin/vim-markdown-toc' " Markdown autogenerating Table of Content :GenTocGFM
let g:vmt_auto_update_on_save = 1
let g:vmt_dont_insert_fence = 0 " Don't add additional info, needed for autoupdate
let g:vmt_list_item_char = '1.'
let g:vmt_cycle_list_item_markers = 0 " Use different markers (*, -, +)
let g:vmt_include_headings_before = 0 " Don't read headers before the table of content

Plugin 'yegappan/taglist'
" :TlistToggle -- open/close taglist
" :TlistAddFiles ./
" :TlistAddFilesRecursive ./ *.c
let g:Tlist_Use_Right_Window = 1
let g:Tlist_WinWidth = 50
let g:Tlist_Exit_OnlyWindow = 1
let g:Tlist_File_Fold_Auto_Close = 1


Plugin 'vim-scripts/AutoComplPop' " Auto popup menu for compete words

"------------------------------------------------------------------------------------
" Colorschemes
"------------------------------------------------------------------------------------
Plugin 'https://github.com/drewtempelmeyer/palenight.vim'
Plugin 'https://github.com/arcticicestudio/nord-vim'
Plugin 'jacoborus/tender.vim'

call vundle#end()
filetype plugin indent on
syntax on

"------------------------------------------------------------------------------------
" Detect file type
"------------------------------------------------------------------------------------
autocmd BufNewFile,BufRead *.gcode set syntax=gcode
autocmd BufNewFile,BufRead *.gcode set syntax=gcode

"------------------------------------------------------------------------------------
" Status line
"------------------------------------------------------------------------------------
" status bar colors
au InsertEnter * hi statusline guifg=black guibg=#d7afff ctermfg=black ctermbg=magenta
au InsertLeave * hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan
hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan

" Status Line Custom
let g:currentmode={
		\ 'n'			 : 'Normal',
		\ 'no'		 : 'Normal·Operator Pending',
		\ 'v'			 : 'Visual',
		\ 'V'			 : 'V·Line',
		\ "\<C-V>" : 'V·Block',
		\ 's'			 : 'Select',
		\ 'S'			 : 'S·Line',
		\ '^S'		 : 'S·Block',
		\ 'i'			 : 'Insert',
		\ 'R'			 : 'Replace',
		\ 'Rv'		 : 'V·Replace',
		\ 'c'			 : 'Command',
		\ 'cv'		 : 'Vim Ex',
		\ 'ce'		 : 'Ex',
		\ 'r'			 : 'Prompt',
		\ 'rm'		 : 'More',
		\ 'r?'		 : 'Confirm',
		\ '!'			 : 'Shell',
		\ 't'			 : 'Terminal'
		\}

set statusline=
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}
set statusline+=%1*\ %m
set statusline+=%1*\ %F
set statusline+=%2*\ Symbol:\ %b\ 0x%B
set statusline+=%2*\ %Y " FileType
set statusline+=%=
set statusline+=%2*\ %{''.(&fenc!=''?&fenc:&enc).''} " Encoding
set statusline+=%2*\ col:\ %02v " Colomn number
set statusline+=%1*\ ln:\ %02l/%L\ [%3p%%] " Line number / total lines, percentage of document

hi User1 ctermfg=007 ctermbg=239 guibg=#4e4e4e guifg=#adadad
hi User2 ctermfg=007 ctermbg=236 guibg=#303030 guifg=#adadad
hi User3 ctermfg=236 ctermbg=236 guibg=#303030 guifg=#303030
hi User4 ctermfg=239 ctermbg=239 guibg=#4e4e4e guifg=#4e4e4e
"------------------------------------------------------------------------------------

"------------------------------------------------------------------------------------
" Cyrillic
"------------------------------------------------------------------------------------
scriptencoding utf-8

source $VIMRUNTIME/delmenu.vim " Delete menu
set langmenu=ru_RU.UTF-8
source $VIMRUNTIME/menu.vim

" Russian keymaps in Normal Mode
set langmap=!\\"№\\;%?*ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;!@#$%&*`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
set spell spelllang=ru,en " Check spelling
"------------------------------------------------------------------------------------

"------------------------------------------------------------------------------------
" Colors and themes
"------------------------------------------------------------------------------------
set guifont=DejaVu_Sans_Mono:h14 "Set GUI font
set t_Co=256
set background=dark

" colorscheme monokai
" colorscheme nord
" colorscheme palenight
colorscheme tender

"------------------------------------------------------------------------------------
" Window navigation
"------------------------------------------------------------------------------------
nnoremap <A-Down> <C-W><C-J>
nnoremap <A-Up> <C-W><C-K>
nnoremap <A-Right> <C-W><C-L>
nnoremap <A-Left> <C-W><C-H>

nnoremap <A-j> <C-W><C-J>
nnoremap <A-k> <C-W><C-K>
nnoremap <A-l> <C-W><C-L>
nnoremap <A-h> <C-W><C-H>

" Add ; to the end of line after <Enter>
inoremap <expr> ;<cr> getline('.')[-1:] == ';' ? '\<Nop>' : '<End>;'

" Toggle highlight the line with '\l'
nnoremap <silent> <Leader>h ml:execute 'match Search /\%'.line('.').'l/'<CR>

" '# \o' to add blank lines below
nnoremap <silent> <Leader>o :<C-u>put =repeat(nr2char(10),v:count)<Bar>execute "'[-1"<CR>\

" '# \O' to add blank lines above
nnoremap <silent> <Leader>O :<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute "']+1"<CR>

highlight ExtraWhitespace ctermbg=gray guibg=gray " Show trailing \s and \t
match ExtraWhitespace /\s\+$/ " Show trailing whitespace:
match ExtraWhitespace /\s\+$\| \+\ze\t/ " Show trailing whitespace and spaces before a tab:
match ExtraWhitespace /^\t*\zs \+/ " Show spaces used for indenting (so you use only tabs for indenting).

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-g>u\<Tab>"

"------------------------------------------------------------------------------------
" Compilations commands
"------------------------------------------------------------------------------------
command! ClearRegisters for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor "Clear registers

command LaTeX execute "write | !pdflatex -interaction=batchmode %"
command LaTeXFULL execute "write | !pdflatex %"
command LCLEAR execute "!del *.aux *.log"


nmap <C-L> :!start "C:\Program Files\LOVE\love.exe" "%:p:h"<cr>
command LOVECONSOLE  execute ':w' '!start "C:\Program Files\LOVE\love.exe" "%:p:h" --console'
command BUILDOPENCV execute '!start cmd /c "$HOME/vimfiles/compiler/buildOpenCV.bat" % & pause'
command BUILD execute '!start cmd /c "$HOME/vimfiles/compiler/buildC.bat" % & pause'
command BUILDARDUINO execute '!start cmd /c "$HOME/vimfiles/compiler/buildArduino.bat" % & pause'
command EXE execute '!start cmd /c %:r.exe & pause'

command VTerminal :vs| :term ++curwin
command EXPLORER :Lex! 40
command EDITVIMRC execute ":e $HOME/_vimrc"
command COPYVIMRC execute ':!copy '.$HOME.'\_vimrc '.$HOME.'\vimfiles\_vimrc'
command READVIMRC :source $MYVIMRC
command ClearTrailingSpaces :%s/\s\+$//e

map <leader>tt :TlistToggle<CR>


" Update the modification date on VIMRC before it is closed
autocmd! bufwritepre $MYVIMRC call setline(1, '" Last update: '.strftime("%d.%m.%Y %H:%M"))"
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
autocmd GUIEnter * set visualbell t_vb=
autocmd BufRead,BufNewFile *.tex set filetype=tex
" autocmd BufWritePre *.py normal m`:%s/^\s\+ `` " Clear spaces at the beginning
