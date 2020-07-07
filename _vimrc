" Last update: 21.06.2020 21:05
"------------------------------------------------------------------------------------

" Update the modification date on VIMRC before it is closed
autocmd! bufwritepre $MYVIMRC call setline(1, '" Last update: '.strftime("%d.%m.%Y %H:%M"))"

"------------------------------------------------------------------------------------
" Vundle plugin manager
"------------------------------------------------------------------------------------

set nocompatible							" be iMproved, required
filetype off									" required

" Kill GUI toolbar
set guioptions-=T
" Kill menu
set guioptions-=m

" set the runtime path to include Vundle and initialize
set rtp+=~/vimfiles/bundle/Vundle.vim
call vundle#begin('~/vimfiles/bundle')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'itchyny/lightline.vim'

"------------------------------------------------------------------------------------
"Ctrl + h/j/k/l
Plugin 'matze/vim-move'
"------------------------------------------------------------------------------------

"Move lines with	Ctrl+J/K/H/L
let g:move_key_modifier = 'C'
"------------------------------------------------------------------------------------

"------------------------------------------------------------------------------------
"visual mode :Tabular /symbol
Plugin 'godlygeek/tabular'
"------------------------------------------------------------------------------------

"------------------------------------------------------------------------------------

" Shows the diff for git
Plugin 'airblade/vim-gitgutter'

" Always show the colums for git changes
set signcolumn=yes

let g:gitgutter_sign_added = '✔'
let g:gitgutter_sign_modified = 'µ' "Ctrl-v + u00b5
let g:gitgutter_sign_removed = '✖'
let g:gitgutter_sign_removed_first_line = 'Ƒ' "Ctrl-v + u0191
let g:gitgutter_sign_modified_removed = 'Ø' "Ctrl-v + u00d8

highlight GitGutterAdd		guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

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
"							* simple \t
"							* Tab_Or_Complete function
"							* snippets from UltiSnips
"------------------------------------------------------------------------------------
let g:SuperTabLongestEnhanced = 1 " For multiple long completes
let g:SuperTabCrMapping = 1 " To use <Enter> to end complete
let g:SuperTabCompleteCase = 'ignore' " To ignore match cases

set completeopt=menu,longest    " Use the popup menu by default; only insert the longest common text of the completion matches; don't automatically show extra information in the preview window.
let g:SuperTabDefaultCompletionType = "context"

function MyTagContext()
	if filereadable(expand('%:p:h') . '/tags')
		return '"\<c-x>\<c-]>"
	endif
	" no return will result in the evaluation of the next
	" configured context
endfunction
let g:SuperTabCompletionContexts =
			\ ['MyTagContext', 's:ContextText', 's:ContextDiscover']

"------------------------------------------------------------------------------------
" Track the engine.
Plugin 'SirVer/ultisnips'
"------------------------------------------------------------------------------------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<TAB>"
let g:UltiSnipsListSnippets="<C-S-TAB>"
" let g:UltiSnipsJumpForwardTrigger="<C-TAB>"
" let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="normal" " was vertical

let g:UltiSnipsSnippetDirectories=["mysnippets"]
"------------------------------------------------------------------------------------

"------------------------------------------------------------------------------------
" Rainbow parenthesises
Plugin 'luochen1990/rainbow'
let g:rainbow_active = 1

" Markdown autogenerating Table of Content
Plugin 'mzlogin/vim-markdown-toc'

" Generate table of contents in GFM link style.
" :GenTocGFM

" Generate table of contents in GitLab link style.
" :GenTocGitLab
" :UpdateToc
" :RemoveToc

let g:vmt_auto_update_on_save = 1
let g:vmt_dont_insert_fence = 0 " Don't add additional info
let g:vmt_cycle_list_item_markers = 1 " Use different markers (*, -, +)
let g:vmt_include_headings_before = 0 " Don't read headers before the table of content

"------------------------------------------------------------------------------------
Plugin 'yegappan/taglist'
" :TlistToggle -- open/close taglist
" :TlistAddFiles ./
" :TlistAddFilesRecursive ./ *.c
let g:Tlist_Use_Right_Window = 1
let g:Tlist_WinWidth = 50
let g:Tlist_Exit_OnlyWindow = 1
let g:Tlist_File_Fold_Auto_Close = 1

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

" Commented 21.06.20 for VimCompletesMe
" inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
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

" Prevent 'Press Enter' message after most commands
set cmdheight=2

" Working with a mouse
"set mouse=a

"Перенос по словам, а не по буквам
set linebreak

" Underline current line
set cursorline
set cursorcolumn

" Turn on/off the cursorline and column with '\c'
nnoremap <Leader>l :set cursorline! cursorcolumn!<CR>

" Highlight the line with '\l'
nnoremap <silent> <Leader>h ml:execute 'match Search /\%'.line('.').'l/'<CR>


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

" Turn off the sound in Windows
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

set laststatus=2

" '# \o' to add blank lines below
nnoremap <silent> <Leader>o :<C-u>put =repeat(nr2char(10),v:count)<Bar>execute "'[-1"<CR>\

" '# \O' to add blank lines above
nnoremap <silent> <Leader>O :<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute "']+1"<CR>
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

" I prefer \t instead of \s !!!
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

set list

"------------------------------------------------------------------------------------
" Non-printable symbols
"------------------------------------------------------------------------------------
set showbreak=↪
set listchars=tab:▸\ ,trail:✖,precedes:←,extends:→,eol:↲,nbsp:✖,
" set listchars=tab:▸\ ,trail:␣,precedes:←,extends:→,eol:↲,nbsp:␣,
" set listchars=eol:~,tab:▸\ ,trail:■,extends:>,precedes:<,eol:¶,

set selection=inclusive

"------------------------------------------------------------------------------------
" Window navigation
"------------------------------------------------------------------------------------
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
function MyHelp(FileType)
	execute ":60vs +/HELP:\\ ".a:FileType " $HOME/vimfiles/help/help.md"
endfunction


function HELP(...)
	if a:0 < 1
		let FileType = &ft
	else
		let FileType = a:1
	endif

	echo "Filetype =" FileType
	call MyHelp(FileType)

endfunction

command! -nargs=* HELP call HELP(<f-args>)

au BufReadPost,BufNewFile help.txt set ft=help
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

command EXPLORER :Lex! 40

command EDITVIMRC execute ":vs $HOME/_vimrc"

command COPYVIMRC execute ':!copy '.$HOME.'\_vimrc '.$HOME.'\vimfiles\_vimrc'


"------------------------------------------------------------------------------------
" Something new and testing
"------------------------------------------------------------------------------------

" [ modeline ] {{{
" set modeline		 " =/* vim: set ai ft=config: */
" set modelines=5  " the number of lines that is checked for set commands.
" set columns=80
" set colorcolumn=+1 " 80 columns: highlight column after 'textwidth', a red line.
" set cc=+1,+2,+3  " highlight three columns after 'textwidth'
" set colorcolumn=4,+1
		" add bellowing to colorscheme file.
		"hi ColorColumn			ctermfg=None ctermbg=233
" }}}

" [ popup menu ]
set pumheight=20 " popup menu height. 0: long

set tags=./tags;
