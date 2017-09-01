"" Last update: 01.09.2017 17:03
":e $MYVIMRC
"------------------------------------------------------------------------------------
" Общие настройки VIM
"------------------------------------------------------------------------------------

"Перед сохранением .vimrc обновлять дату последнего изменения
autocmd! bufwritepre $MYVIMRC call setline(1, '"" Last update: '.strftime("%d.%m.%Y %H:%M"))

"Вывод положения в тексте 
set ruler

"Подсвечивание
let python_hightlight_all=1
set t_Co=256

"Цветовая схема
	"песочные
colorscheme PapayaWhip
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
"set showcmd

"Автоматическое сохранение при вводе команд :next и :make
set autowrite

"Позволяет работать мышью
"set mouse=a

"Перенос по словам, а не по буквам
set linebreak

"Подчёркивание текущей строки
set cursorline

"Подсветка выражения, которое ищется в тексте
set hlsearch

"Отключение подсветки найденных выражений
set nohlsearch

"Прекращение создания swap-файлов
set noswapfile

"Открытие файлов формата .pdf командой :Rpdf
command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -
command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78

"Автодополнение
abbr imp import
abbr #i #include
abbr #d #define
abbr dou double
abbr fl float
abbr pr print
abbr raw raw_input(
abbr \i \item
abbr \b \begin{
abbr \e \end{
abbr \u \underline{\hspace{2cm}}
abbr \s {\slash}

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
set softtabstop=2
"set expandtab " Замена в режиме Вставки табов на пробелы

"Автоотступ
set autoindent

"Выделение слова под курсором с возможностью его поиска
set hlsearch

"Number of spaces to use for auto indent
set shiftwidth=2


"Распознавание типов файлов
filetype on
filetype plugin on
syntax on

"Отключение резервных копий
set nobackup
set nowritebackup

"Открытие новых вкладок по Ctrl-T
" nmap <C-t> :tabnew<CR>
"imap <C-t> <Esc>:tabnew<CR>a

" Умный отступ: как у предыдущего + добавление/убирание для блоков
"set smartindent

"Кодировка терминала
set termencoding=utf-8
set encoding=utf-8
scriptencoding utf-8 

" Вырубаем черточки на табах
"set showtabline=0

" Колоночка, чтобы показывать плюсики для скрытия блоков кода:
"set foldcolumn=1


" Указание скрытых символов
"set listchars=tab:▸\ ,precedes:«,extends:»,trail:■ ",eol:¶,
"set listchars=eol:~,tab:>.,trail:~,extends:>,precedes:<,space:_
set listchars=eol:~,tab:>>,trail:~,extends:>,precedes:<,eol:¶,


"Включение Backspace
set backspace=indent,eol,start

" Не переводить пробелы в табуляции
set noexpandtab
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
match ExtraWhitespace /^\t*\zs \+/


"------------------------------------------------------------------------------------
"####################################################################################
"------------------------------------------------------------------------------------



"------------------------------------------------------------------------------------
" Шаблоны для файлов и их настройка
"------------------------------------------------------------------------------------

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
		return "\<Tab>"
	else
		return "\<C-p>"
	endif
endfunction

inoremap <C-Right> <C-R>=SuperCleverTab()<cr>
"------------------------------------------------------------------------------------


"------------------------------------------------------------------------------------
" Nerd Tree and Comment
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
" Умное комментирование NERD-commenter
" Add spaces after comment delimiters by default
"let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
"let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
"let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
"let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
"autocmd FileType C let g:NERDCustomDelimiters = { 'c': { 'left': '/*','right': '*/' } }

"autocmd FileType python let g:NERDCustomDelimiters = { 'c': { 'left': '#', 'right': '' } }

"autocmd FileType tex let g:NERDCustomDelimiters = { 'c': { 'left': '%', 'right': '' } }
"------------------------------------------------------------------------------------

"------------------------------------------------------------------------------------
" Syntastic
"------------------------------------------------------------------------------------
"
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_enable_signs=1
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_quiet_messages = { 'regex': 'W191' }


"------------------------------------------------------------------------------------
" Внутренние команды для компиляции
"------------------------------------------------------------------------------------

"command LaTeX execute "write | !pdflatex %"
"command Java execute "write | !javac %"
command Python execute "!python.exe %"
nmap <C-P> :Python<cr>
"------------------------------------------------------------------------------------

set nocompatible							" be iMproved, required
filetype off									" required

"------------------------------------------------------------------------------------
" Vim-Airline
"------------------------------------------------------------------------------------

set laststatus=2
let g:airline_detect_paste=1
let g:airline_theme='dark'

let g:airline_left_sep = '>'
let g:airline_right_sep = '>'


"Vundle plugin installer
" set the runtime path to include Vundle and initialize
set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
call vundle#begin('$HOME/vimfiles/bundle/')
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()						 " required
filetype plugin indent on