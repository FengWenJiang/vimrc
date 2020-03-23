""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" => 插件设定
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/AppData/Local/nvim/config/plugins')

" ************************************************************
Plug 'jiangmiao/auto-pairs'
"
" 设置要自动配对的符号
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"'}
" 添加要自动配对的符号<>
let g:AutoPairs['<']='>'
" 设置插件打开/关闭的快捷键，默认为ALT+p
let g:AutoPairsShortcutToggle = '<M-p>'



" ************************************************************
" 文件树插件
if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
"
" 更新pip
" python -m pip install --upgrade pip

" 下载pynvim (defx.vim 需要)
" pip3 install --user --upgrade pynvim





" **************************************************************
" 在启动窗口中显示最近打开的文件
Plug 'mhinz/vim-startify'
"
let g:startify_files_number = 5
let g:startify_list_order = [
      \ ['   My most recently used files in the current directory:'],
      \ 'dir',
      \ ['   My most recently used files:'],
      \ 'files',
      \ ['   These are my sessions:'],
      \ 'sessions',
      \ ['   These are my bookmarks:'],
      \ 'bookmarks',
      \ ]

let g:startify_custom_header_quotes = [
      \ ['tabris is handsome!','','Come on!tabris!'],
      \ ['I do not know what I can write here!'],
      \ ]

" **************************************************************
Plug 'kristijanhusak/defx-git'
"
let g:defx_git#indicators = {
  \ 'Modified'  : '✹',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ }
let g:defx_git#column_length = 1
let g:defx_git#raw_mode = 1
hi def link Defx_filename_directory NERDTreeDirSlash
hi def link Defx_git_Modified Special
hi def link Defx_git_Staged Function
hi def link Defx_git_Renamed Title
hi def link Defx_git_Unmerged Label
hi def link Defx_git_Untracked Tag
hi def link Defx_git_Ignored Comment



" **************************************************************
Plug 'kristijanhusak/defx-icons'



" **************************************************************
Plug 'skywind3000/vim-terminal-help'



" **************************************************************
Plug 'majutsushi/tagbar'
nmap  <F8>：TagbarToggle <CR>

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" ctags程序的路径
let g:tabar_ctags_bin='ctags'
" 窗口宽度设置
let g:tabar_width=35
" 在窗口左侧显示
let g:tagbar_RIGHT=1
" 开启自动预览(随着光标在标签上的移动，顶部会出现一个实时的预览窗口)
" let g:tagbar_autopreview=1
" 关闭排序，即按标签本身在文件中的位置排序
let g:tagbar_sort=0



" **************************************************************
" 补全代码插件
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"
" 语言插件
" Rust          ==>     coc-rls
" GOLang        ==>     
" JAVA          ==>     coc-java
" Python        ==>     coc-python 
" javascript    ==>     coc-tsserver
" xml           ==>     coc-xml 
" html          ==>     coc-html 
" php           ==>     coc-phpls
" json          ==>     coc-json 
" ruby          ==>     coc-solargraph
"
" 安装
" CocInstall coc-marketplace
"
" 列出所有可用的扩展名
" CocList marketplace
"
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" <Tab> <S-Tab> 键上下切换
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" <cr> 确认补全
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"



" **************************************************************
" 语法检测
Plug 'w0rp/ale'
"
" 显示状态栏
let g:ale_sign_column_always = 1
" 不高亮行
let g:ale_set_highlights = 0
" 自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
" 显示Linter名称，出错和警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" 在状态栏中显示错误或警告 
let g:airline#extensions#ale#enabled = 1
" 使用quickfix列表而非loclist
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
" 有错误或警告时显示loclist或quickfix项目的窗口
let g:ale_open_list = 1
" 保存时修复
let g:ale_fix_on_save = 1
" 文件保存时，显示警告
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
" 普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
" <Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>

"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
\   'rust': ['rustfmt', 'cargo'],
\   'cpp': ['clang','gcc'],
\   'c': ['clang','gcc'],
\   'go': ['gofmt'],
\   'java': ['javac'],
\   'python': ['autopep8', 'pylint'],
\   'fortran': ['gcc'],
\	'javascript': ['eslint'],
\   'yaml': ['yamllint'],
\}

" ale显示错误的列表高度
let g:ale_list_window_size = 5
let g:ale_c_clang_options = '--target=i86_64-w64-mingw -std=c11 -Wall'

" JAVA 在中文系统上，错误和警告信息都会乱码：
let g:ale_java_javac_options = '-encoding UTF-8  -J-Duser.language=en'

" 安装语言工具
" autopep8
" pip install autopep8    （Windows \ Mac)    
" pip3 install autopep8   （Linux）
" npm install eslint –g   （eslint javascript）


" 查看当前代码文件中的变量和函数列表的插件，
" 可以切换和跳转到代码中对应的变量和函数的位置
" 大纲式导航, Go 需要 https://github.com/jstemmer/gotags 支持



" **************************************************************
" 比ctrlp 强大的模糊搜索工具
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
"
" 搜索当前目录下的文件
" :LeaderfFile
" <leader>f
" 搜索当前的 Buffer

" :LeaderfBuffer 
" <leader>b
" 搜索最近使用过的文件,就是Mru

" :LeaderfMru
" 搜索当前文件的函数
" :LeaderfFunction

" 搜索当前文件中的某个单词
" LeaderfLine

" CTRL+p 打开文件模糊匹配
let g:Lf_ShortcutF = '<c-p>'

" ALT+n 打开 buffer 模糊匹配
let g:Lf_ShortcutB = '<m-n>'



" **************************************************************
" 版本控制插件，支持git、svn
Plug 'mhinz/vim-signify'



" **************************************************************
" 显示缩进指示线的插件
Plug 'Yggdroot/indentLine'
"
" 开启/关闭 indentLine 插件
let g:indentLine_enable = 1
" 设置 indentLine 显示的缩进线
let g:indentLine_char_list = ['¦']



" **************************************************************
" 快速注释
Plug 'scrooloose/nerdcommenter'
"
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1



" **************************************************************
" 快速对齐插件
Plug 'junegunn/vim-easy-align'
"
" Start interactive EasyAlign in visual mode (e.g. vipga)
" 以可视模式启动交互式EasyAlign（例如vipga）
xmap ga <Plug>(EasyAlign)
"
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
" 启动交互式EasyAlign以获取动画/文本对象（例如gaip）
nmap ga <Plug>(EasyAlign)



" **************************************************************
" Solarized 主题（亮/暗）
Plug 'altercation/vim-colors-solarized'
"
let g:solarized_termcolors=256



" **************************************************************
" molokai 主题
Plug 'tomasr/molokai'



" **************************************************************
" Vim状态栏插件，包括显示行号，列号，文件类型，文件名，以及Git状态
Plug 'vim-airline/vim-airline'
"
let g:airline_powerline_fonts = 0
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0

" to use fancy symbols for airline, uncomment the following lines and use a
" patched font (more info on the README.rst)
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif

let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#left_sep = '⮀'
let g:airline#extensions#tabline#left_alt_sep = '⮁'
let g:airline#extensions#tabline#right_sep = '⮂'
let g:airline#extensions#tabline#right_alt_sep = '⮃'
"let g:airline_theme='solarized'  " murmur配色也不错
"let g:airline_solarized_bg='dark'


" **************************************************************
" 状态栏主题
Plug 'vim-airline/vim-airline-themes'



" **************************************************************
Plug 'enricobacis/vim-airline-clock'



" **************************************************************
" 彩虹括号
Plug 'luochen1990/rainbow'
"
let g:rainbow_active = 1



" 所有插件都必须写在plg#begin和end之间 (All of your Plugins must be added before the following line)
call plug#end()

" 用法：
" 	PlugStatus		检查状态
" 	PlugInstall		安装插件
" 	PlugUpdate		更新插件
" 	PlugDiff		查看更新后的更改  X回滚之间更新
" 	PlugClean		删除插件
" 	PlugUpgrade		更新vim-plug插件自身
