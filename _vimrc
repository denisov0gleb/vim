" Last update: 12.05.2020 15:08
"------------------------------------------------------------------------------------

" Update the modification date on VIMRC before it is closed
autocmd! bufwritepre $MYVIMRC call setline(1, '" Last update: '.strftime("%d.%m.%Y %H:%M"))"

"------------------------------------------------------------------------------------
" Vundle plugin manager
"------------------------------------------------------------------------------------

set nocompatible							" be iMproved, required
filetype off									" required

"Kill GUI toolbar
set guioptions-=T 

" set the runtime path to include Vundle and initialize
set rtp+=~/vimfiles/bundle/Vundle.vim
call vundle#begin('~/vimfiles/bundle')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


"------------------------------------------------------------------------------------
" Nerd Tree
Plugin 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"------------------------------------------------------------------------------------

" Open/close NERDTree window by Ctrl-N
nmap <C-N> :NERDTree<cr>
vmap <C-N> <esc>:NERDTree<cr>i
imap <C-N> <esc>:NERDTree<cr>i

nmap <C-N>q :NERDTreeClose<cr>
vmap <C-N>q <esc>:NERDTreeClose<cr>i
imap <C-N>q <esc>:NERDTreeClose<cr>i

" Set cursor at center
let g:NERDTreeAutoCenter=1

" Don't show binary files
let NERDTreeIgnore=['\.pyc$']

" Open NERDTree on the right side 
let g:NERDTreeWinPos="right"
let g:NERDTreeWinSize=40

" Automatically open NERDTree with leaved cursor
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p

" Automatically closes NERDTree if it was the last one window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"------------------------------------------------------------------------------------


Plugin 'itchyny/lightline.vim'


"------------------------------------------------------------------------------------
"Ctrl + h/j/k/l
Plugin 'matze/vim-move'
"------------------------------------------------------------------------------------

"Move Ctrl+J/K/H/L
let g:move_key_modifier = 'C'
"------------------------------------------------------------------------------------


"------------------------------------------------------------------------------------
"visual mode :Tabular /symbol
Plugin 'godlygeek/tabular'
"------------------------------------------------------------------------------------

"------------------------------------------------------------------------------------
" :UndotreeToggle
Plugin 'mbbill/undotree'
"------------------------------------------------------------------------------------

" :TlistOpen or :TlistToggle
"Plugin 'vim-scripts/taglist.vim'

Plugin 'airblade/vim-gitgutter'

"------------------------------------------------------------------------------------
" :Hexmode
Plugin 'fidian/hexmode'
"------------------------------------------------------------------------------------

Plugin 'scrooloose/nerdcommenter'

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

"------------------------------------------------------------------------------------
Plugin 'ervandew/supertab'
"------------------------------------------------------------------------------------
"
" Union of:
" 						* simple \t
" 						* Tab_Or_Complete function
" 						* snippets from UltiSnips
"------------------------------------------------------------------------------------


"------------------------------------------------------------------------------------
" Track the engine.
Plugin 'SirVer/ultisnips'
"------------------------------------------------------------------------------------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<TAB>"
let g:UltiSnipsListSnippets="<C-S-TAB>"
let g:UltiSnipsJumpForwardTrigger="<C-TAB>"
let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"
" let g:UltiSnipsJumpForwardTrigger="<c-f>"
" let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsSnippetDirectories=["mysnippets"]
"------------------------------------------------------------------------------------


"------------------------------------------------------------------------------------
" Show git status
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/gv.vim'

" Rainbow parenthesises
Plugin 'luochen1990/rainbow'
let g:rainbow_active = 1

"------------------------------------------------------------------------------------

call vundle#end()						 " required
filetype plugin indent on		 " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList				- lists configured plugins
" :PluginInstall		- installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean			- confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'

"Plug 'jlanzarotta/bufexplorer'
"Plug 'vim-scripts/taglist.vim'


"------------------------------------------------------------------------------------
" Smart code autocompete
" Used it earlier
"------------------------------------------------------------------------------------

function! SuperCleverTab()
	if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
		return "\<C-p>"
	else
		return "\<C-p>"
	endif
endfunction
"inoremap <C-Right> <C-R>=SuperCleverTab()<cr> " Совсем старое
"inoremap <C-Space> <C-R>=SuperCleverTab()<cr>
"------------------------------------------------------------------------------------

"------------------------------------------------------------------------------------
" Smart code autocompete
"------------------------------------------------------------------------------------
function! Tab_Or_Complete()
	if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
		return "\<C-N>"
	else
		return "\<Tab>"
	endif
endfunction

inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
"------------------------------------------------------------------------------------


"------------------------------------------------------------------------------------
"Clear registers
command! ClearRegisters for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor


"------------------------------------------------------------------------------------
" Show VIM status
"------------------------------------------------------------------------------------
" Position
set ruler

" Line numbers
set number

" Don't show statusline
set noshowmode

" Shows current command
set showcmd

" Working with a mouse
"set mouse=a

"Перенос по словам, а не по буквам
set linebreak

" Underline current line
set cursorline
set cursorcolumn

" Coloring the searching words
set hlsearch

" Turn off previous listed search words
set nohlsearch

" Scroll page before 6 lines
set scrolloff=6

"Split page below and right of the page
set splitbelow
set splitright

" Max line width
set textwidth=100

" Use dialogs instead of error messages
set confirm

" Don't run to next search word
nnoremap * *N
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

set laststatus=2
"------------------------------------------------------------------------------------



"------------------------------------------------------------------------------------
" Indents and filetypes
"------------------------------------------------------------------------------------
set tabstop=2
set softtabstop=0
set shiftwidth=2

" set autoindent

filetype on
filetype plugin on
syntax on

set smartindent

" I use \t instead of \s !!!
set noexpandtab
set copyindent
set preserveindent
retab!


" Turn backspace on
set backspace=indent,eol,start


" Show trailing \s and \t
highlight ExtraWhitespace ctermbg=gray guibg=gray
" Show trailing whitespace:
match ExtraWhitespace /\s\+$/
" Show trailing whitespace and spaces before a tab:
match ExtraWhitespace /\s\+$\| \+\ze\t/
" Show tabs that are not at the start of a line:
"match ExtraWhitespace /[^\t]\zs\t\+/
" Show spaces used for indenting (so you use only tabs for indenting).
match ExtraWhitespace /^\t*\zs \+/
"------------------------------------------------------------------------------------


"------------------------------------------------------------------------------------
" Cyrillic
"------------------------------------------------------------------------------------
set termencoding=utf-8
set encoding=utf-8
scriptencoding utf-8

"Menu
source $VIMRUNTIME/delmenu.vim
set langmenu=ru_RU.UTF-8
source $VIMRUNTIME/menu.vim


" Russian keymaps in Normal Mode
set langmap=!\\"№\\;%?*ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;!@#$%&*`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
" Check spelling
set spell spelllang=ru,en
set spellfile=~/vimfiles/my-spelling.add
"------------------------------------------------------------------------------------


"------------------------------------------------------------------------------------
" Colors and themes
"------------------------------------------------------------------------------------
"Set GUI font:
set guifont=DejaVu_Sans_Mono:h14

let python_hightlight_all=1
set t_Co=256

set background=light
colorscheme monokai
"colorscheme PapayaWhip
"colorscheme solarized
"colorscheme wonka-light
"colorscheme wonka-dark
"colorscheme stellarized
"colorscheme PaperColor
"
	"тёмная
"colorscheme spring-night
	"серая
"colorscheme jay

set list

" Non-printing symbols
set showbreak=↪
set listchars=tab:▸\ ,trail:␣,precedes:←,extends:→,eol:↲,nbsp:␣,
"set listchars=eol:~,tab:▸\ ,trail:■,extends:>,precedes:<,eol:¶,

set selection=inclusive

nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-Left> <C-W><C-H>
"------------------------------------------------------------------------------------


"------------------------------------------------------------------------------------
" Files
"------------------------------------------------------------------------------------
" Autowrite after :make and :next
set autowrite

set noswapfile

set nobackup
set nowritebackup

" Set executable on Unix
function MakeExecutableFunc()
	if getline(1) =~ "^#!"
		if getline(1) =~ "bin/"
			silent !chmod a+x <afile>
		endif
	endif
endfunction

au BufWritePost * call MakeExecutableFunc()

"Use system clipboard
set clipboard=unnamed
"------------------------------------------------------------------------------------


"------------------------------------------------------------------------------------
" Auto
"------------------------------------------------------------------------------------

" Parenthesis
" ino \" \""<left>
" ino ' ''<left>
" ino ( ()<left>
" ino [ []<left>
" ino { {}<left>
" ino {<CR> {<CR>}<ESC>O
" ino {;<CR> {<CR>};<ESC>O

" abbr imp import
" abbr #i #include
" abbr #d #define
" abbr dou double
" abbr fl float
" abbr pr print
" abbr raw raw_input(
" abbr \i \item
" abbr \b \begin{
" abbr \e \end{
" abbr \u \underline{\hspace{2cm}}
" abbr \s {\slash}


" Add ; to the end of line after <Enter>
inoremap <expr> ;<cr> getline('.')[-1:] == ';' ? '\<Nop>' : '<End>;'
"------------------------------------------------------------------------------------


"------------------------------------------------------------------------------------
" Good not used ideas
"------------------------------------------------------------------------------------

"Cd to the D disk
"cd D:/Others

" Open .pdf with :Rpdf command
"command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -
"command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78

" Turn color for all words matches the cursor word
"autocmd CursorMoved * silent! exe printf("match Search /\\<%s\\>/", expand('<cword>'))
"------------------------------------------------------------------------------------


"------------------------------------------------------------------------------------
" Tabs
"------------------------------------------------------------------------------------
" nmap <C-t> :tabnew<CR>
"imap <C-t> <Esc>:tabnew<CR>a
"------------------------------------------------------------------------------------


"------------------------------------------------------------------------------------
" Foldings
"------------------------------------------------------------------------------------
" Column for + symbols
"set foldcolumn=1

"Fold programs
"setlocal foldmethod=syntax
"Remember folding after closing
augroup AutoSaveFolds
	autocmd BufWinEnter *.* silent! loadview
augroup END
"------------------------------------------------------------------------------------



"------------------------------------------------------------------------------------
"####################################################################################
"------------------------------------------------------------------------------------


"------------------------------------------------------------------------------------
" Help files for different types
"------------------------------------------------------------------------------------
"Open help file for Vim
function MyHelpFiles(FileType)
	if (a:FileType == 'tex')
		:60vs $HOME/vimfiles/help/texhelp.tex
	elseif (a:FileType == 'vim')
		:60vs $HOME/vimfiles/help/vimhelp.vim
	elseif (a:FileType == 'c')
		:60vs $HOME/vimfiles/help/chelp.c
	elseif (a:FileType == 'vb')
		:60vs $HOME/vimfiles/help/vbhelp.vbs
	endif
endfunction

function HELP(...)
	if a:0 < 1
		let FileType = &ft
	else
		let FileType = a:1
	endif

	echo "Filetype =" FileType
	call MyHelpFiles(FileType)

endfunction

command! -nargs=* HELP call HELP(<f-args>)
"------------------------------------------------------------------------------------


"------------------------------------------------------------------------------------
" File schemes
"------------------------------------------------------------------------------------
autocmd BufRead,BufNewFile *.tex set filetype=tex

" au BufNewFile *.tex 0r $HOME/vimfiles/templates/template.tex
" au BufNewFile *.py 0r $HOME/vimfiles/templates/template.py
" au BufNewFile *.c 0r $HOME/vimfiles/templates/template.c

"au BufNewFile *.tex r ~/.vim/skeleton.tex
"au BufNewFile *.py silent! r ~/.vim/skeleton.py
"au BufNewFile *.java silent! r ~/.vim/skeleton.java


" Cut \s in the line end
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
autocmd BufWritePre *.c normal m`:%s/\s\+$//e ``
autocmd BufWritePre *.tex normal m`:%s/\s\+$//e ``

" Cut \s in the line beggining
autocmd BufWritePre *.py normal m`:%s/^\s\+ ``
autocmd BufWritePre *.c normal m`:%s/^\s\+ ``
autocmd BufWritePre *.tex normal m`:%s/^\s\+ ``

"autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
"------------------------------------------------------------------------------------


"------------------------------------------------------------------------------------
" Compilations commands
"------------------------------------------------------------------------------------

command LaTeX execute "write | !pdflatex -interaction=batchmode %"
command LCLEAR execute "!del *.aux *.log"

"command Java execute "write | !javac %"

"LÖVE
nmap <C-L> :!start "C:\Program Files\LOVE\love.exe" "%:p:h"<cr>
command LOVECONSOLE  execute ':w' '!start "C:\Program Files\LOVE\love.exe" "%:p:h" --console'

command BUILDOPENCV execute '!start cmd /c "$HOME/vimfiles/compiler/buildOpenCV.bat" % & pause'

command BUILD execute '!start cmd /c "$HOME/vimfiles/compiler/buildC.bat" % & pause'

command BUILDARDUINO execute '!start cmd /c "$HOME/vimfiles/compiler/buildArduino.bat" % & pause'

command EXE execute '!start cmd /c %:r.exe & pause'
"------------------------------------------------------------------------------------


command VTerminal :vs| :term ++curwin
