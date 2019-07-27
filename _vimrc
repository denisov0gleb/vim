"" Last update: 02.09.2017 23:50
":e $MYVIMRC
"" Last update: 27.07.2019 22:52
" Общие настройки VIM
"------------------------------------------------------------------------------------

"Перед сохранением .vimrc обновлять дату последнего изменения
autocmd! bufwritepre $MYVIMRC call setline(3, '"" Last update: '.strftime("%d.%m.%Y %H:%M"))


"------------------------------------------------------------------------------------
" Vundle plugin manager
"------------------------------------------------------------------------------------

set nocompatible              " be iMproved, required
filetype off                  " required

"Kill GUI toolbar
set guioptions-=T 

"Set GUI font:
set guifont=DejaVu_Sans_Mono:h14

" set the runtime path to include Vundle and initialize
set rtp+=~/vimfiles/bundle/Vundle.vim
call vundle#begin('~/vimfiles/bundle')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

Plugin 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plugin 'itchyny/lightline.vim'

"Ctrl + h/j/k/l
Plugin 'matze/vim-move'

"visual mode :Tabular /symbol
Plugin 'godlygeek/tabular'

" :UndotreeToggle
Plugin 'mbbill/undotree'

" :TlistOpen or :TlistToggle
"Plugin 'vim-scripts/taglist.vim'

Plugin 'airblade/vim-gitgutter'

" :Hexmode
Plugin 'fidian/hexmode'

Plugin 'scrooloose/nerdcommenter'

call vundle#end()            " required
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
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'

"Plug 'jlanzarotta/bufexplorer'
"Plug 'vim-scripts/taglist.vim'

"------------------------------------------------------------------------------------
"Clear registers
command! ClearRegisters for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

"Вывод положения в тексте 
set ruler

"Move Ctrl+J/K/H/L
let g:move_key_modifier = 'C'

"Comments
autocmd FileType apache setlocal commentstring=#\ %s

"Подсвечивание
let python_hightlight_all=1
set t_Co=256

set background=light
"Цветовая схема
	"песочные
	"colorscheme PapayaWhip

colorscheme monokai
"colorscheme solarized
"colorscheme wonka-light
"colorscheme wonka-dark
"colorscheme stellarized
"colorscheme PaperColor
	"тёмная
"colorscheme spring-night
	"серая
"colorscheme jay

" Отображение кириллицы в меню
source $VIMRUNTIME/delmenu.vim
set langmenu=ru_RU.UTF-8
source $VIMRUNTIME/menu.vim

"Вывод номеров строк
set number

" Не отображает статусную строку
set noshowmode

"Показывает текущую команду
set showcmd

"Автоматическое сохранение при вводе команд :next и :make
set autowrite

"Позволяет работать мышью
"set mouse=a

"Перенос по словам, а не по буквам
set linebreak

"Подчёркивание текущей строки
set cursorline
set cursorcolumn

"Подсветка выражения, которое ищется в тексте
set hlsearch

"Отключение подсветки найденных выражений
set nohlsearch

"Прекращение создания swap-файлов
set noswapfile

"Перелистывание страницы за 6 строк до конца страницы
set scrolloff=6

"Split page below and right of the page
set splitbelow
set splitright

"Cd to the D disk
"cd D:/Others

"Открытие файлов формата .pdf командой :Rpdf
command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -
command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78

"Автодополнение
"abbr imp import
"abbr #i #include
"abbr #d #define
"abbr dou double
"abbr fl float
"abbr pr print
"abbr raw raw_input(
"abbr \i \item
"abbr \b \begin{
"abbr \e \end{
"abbr \u \underline{\hspace{2cm}}
"abbr \s {\slash}

"Ограничение длины строки
set textwidth=100

"использовать диалоги вместо сообщений об ошибках
set confirm

"Включение подсветки
set list

"Во избежание лишней путаницы использовать системный буфер обмена вместо буфера Vi
set clipboard=unnamed

"Подсвечивает все слова, которые совпадают со словом под курсором.
"autocmd CursorMoved * silent! exe printf("match Search /\\<%s\\>/", expand('<cword>'))

"Ширина табуляции
set tabstop=2
set softtabstop=0
set shiftwidth=2
"set expandtab " Замена в режиме Вставки табов на пробелы

"Автоотступ
set autoindent

"Выделение слова под курсором с возможностью его поиска
set hlsearch


"Распознавание типов файлов
filetype on
filetype plugin on
syntax on

"Fold programs
"setlocal foldmethod=syntax
"Remember folding after closing
augroup AutoSaveFolds
	autocmd BufWinEnter *.* silent! loadview
augroup END

"Автодополнение скобок"
ino " ""<left>
ino ' ''<left>
ino ( ()<left>
ino [ []<left>
ino { {}<left>
ino {<CR> {<CR>}<ESC>O
ino {;<CR> {<CR>};<ESC>O

"Отключение резервных копий
set nobackup
set nowritebackup

"Открытие новых вкладок по Ctrl-T
" nmap <C-t> :tabnew<CR>
"imap <C-t> <Esc>:tabnew<CR>a

" Умный отступ: как у предыдущего + добавление/убирание для блоков
set smartindent

"Кодировка терминала
set termencoding=utf-8
set encoding=utf-8
scriptencoding utf-8

" Вырубаем черточки на табах
"set showtabline=0

" Колоночка, чтобы показывать плюсики для скрытия блоков кода:
"set foldcolumn=1

"Автоматическое приведение исполняемости, если есть первая строка
function MakeExecutableFunc()
	if getline(1) =~ "^#!"
		if getline(1) =~ "bin/"
			silent !chmod a+x <afile>
		endif
	endif
endfunction

au BufWritePost * call MakeExecutableFunc()

" Указание скрытых символов
set listchars=eol:~,tab:▸\ ,trail:■,extends:>,precedes:<,eol:¶,


"Включение Backspace
set backspace=indent,eol,start

" Не переводить пробелы в табуляции
set noexpandtab
set copyindent
set preserveindent
retab!


" Отображение лишних пробелов, переносов и табуляций
highlight ExtraWhitespace ctermbg=yellow guibg=yellow
" Show trailing whitespace:
match ExtraWhitespace /\s\+$/
" Show trailing whitespace and spaces before a tab:
match ExtraWhitespace /\s\+$\| \+\ze\t/
" Show tabs that are not at the start of a line:
match ExtraWhitespace /[^\t]\zs\t\+/
" Show spaces used for indenting (so you use only tabs for indenting).
"match ExtraWhitespace /^\t*\zs \+/

" Ввод команд в русской раскладке
set langmap=!\\"№\\;%?*ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;!@#$%&*`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

" Проверка орфографии
set spell spelllang=ru,en
set spellfile=~/vimfiles/my-spelling.add

set selection=inclusive

set laststatus=2
"------------------------------------------------------------------------------------
"####################################################################################
"------------------------------------------------------------------------------------


"------------------------------------------------------------------------------------
" Help files for different types
"------------------------------------------------------------------------------------
"Open help file for Vim
"nmap <silent> <C-h> :40vs $HOME/vimfiles/help/vimhelp.txt<cr>
nmap <C-h> :call MyHelpFiles()<CR>

function MyHelpVim()
	:40vs $HOME/vimfiles/help/vimhelp.vim
endfunction

function MyHelpFiles()
	if (&ft == 'tex')
		:40vs $HOME/vimfiles/help/texhelp.tex
	elseif (&ft == 'vim')
		:40vs $HOME/vimfiles/help/vimhelp.vim
	elseif (&ft == 'c')
		:40vs $HOME/vimfiles/help/chelp.c
	endif
endfunction

"------------------------------------------------------------------------------------
" Шаблоны для файлов и их настройка
"------------------------------------------------------------------------------------

au BufNewFile *.tex 0r $HOME/vimfiles/templates/template.tex
au BufNewFile *.py 0r $HOME/vimfiles/templates/template.py
au BufNewFile *.c 0r $HOME/vimfiles/templates/template.c

"au BufNewFile *.tex r ~/.vim/skeleton.tex
"au BufNewFile *.py silent! r ~/.vim/skeleton.py
"au BufNewFile *.java silent! r ~/.vim/skeleton.java


"Перед сохранением вырезаем пробелы на концах (только в .py, .tex файлах)
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
"Перед сохранением вырезаем пробелы в начале
autocmd BufWritePre *.py, normal m`:%s/^\s\+ ``

"В .py файлах включаем умные отступы после ключевых слов
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
"------------------------------------------------------------------------------------


"------------------------------------------------------------------------------------
" Умное дополнение кода
"------------------------------------------------------------------------------------

function! SuperCleverTab()
	if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
		return "\<C-p>"
	else
		return "\<C-p>"
	endif
endfunction
"inoremap <C-Right> <C-R>=SuperCleverTab()<cr>
inoremap <C-Space> <C-R>=SuperCleverTab()<cr>
"------------------------------------------------------------------------------------


"------------------------------------------------------------------------------------
" Nerd Tree
"------------------------------------------------------------------------------------

"Открытие/закрытие файлового дерева NERD_Tree (Ctrl-N)
nmap <C-N> :NERDTree<cr>
vmap <C-N> <esc>:NERDTree<cr>i
imap <C-N> <esc>:NERDTree<cr>i

nmap <C-N>q :NERDTreeClose<cr>
vmap <C-N>q <esc>:NERDTreeClose<cr>i
imap <C-N>q <esc>:NERDTreeClose<cr>i

"Установление курсора по центру. не работает ???
let g:NERDTreeAutoCenter=1

"Не отображать бинарные файлы Питона
let NERDTreeIgnore=['\.pyc$']

"Открывать его справа с шириной = 
let g:NERDTreeWinPos="right"
let g:NERDTreeWinSize=36

"Автоматически открывать NERD с курсором на основном окне
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p

"Автоматическое закрытие NERD. если это последнее окно
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"------------------------------------------------------------------------------------
" Внутренние команды для компиляции
"------------------------------------------------------------------------------------

command LaTeX execute "write | !pdflatex %"
"command Java execute "write | !javac %"

"LÖVE
nmap <C-L> :!start "C:\Program Files\LOVE-11.2\love.exe" "%:p:h"<cr>
command LOVECONSOLE  execute ':w' '!start "C:\Program Files\LOVE-11.2\love.exe" "%:p:h" --console'

command LOVECONSOLE10  execute ':w' '!start "C:\Program Files\LOVE-10.2\love.exe" "%:p:h" --console'

command HELP call MyHelpVim()

command BUILDOPENCV execute '!start cmd /c "C:/Users/Pavlov/vimfiles/compiler/buildOpenCV.bat" % & pause'

command BUILD execute '!start cmd /c "C:/Users/Pavlov/vimfiles/compiler/buildC.bat" % & pause'

command BUILDARDUINO execute '!start cmd /c "C:/Users/Pavlov/vimfiles/compiler/buildArduino.bat" % & pause'

command EXE execute '!start cmd /c %:r.exe & pause'


"------------------------------------------------------------------------------------
" Taglist Plugin
"------------------------------------------------------------------------------------
let Tlist_Auto_Open           = 1
let Tlist_Auto_Highlight_Tag  = 1
let Tlist_Process_File_Always = 1
let Tlist_Use_Right_Window    = 1 "Vertical spliting
let Tlist_WinWidth            = 80
let Tlist_Compact_Format      = 1 "Reduce empty lines
let Tlist_Show_Menu           = 1
