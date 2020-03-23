""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 前提变量
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 判断操作系统类型
if(has('win32') || has('win64'))
    let g:isWIN = 1
    let g:isMAC = 0
else
    if system('uname') =~ 'Darwin'
        let g:isWIN = 0
        let g:isMAC = 1
    else
        let g:isWIN = 0
        let g:isMAC = 0
    endif
endif

" 判断是否处于 GUI 界面
if has('gui_running')
    let g:isGUI = 1
else
    let g:isGUI = 0
endif



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 一般设定
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 禁用 vi 兼容模式
set nocompatible

" 设置 Backspacee 键模式
set bs=eol,start,indent
 
" leader 按键
let mapleader=";"

" 备份文件扩展名
set backupext=.bak

" 高亮显示匹配括号
set showmatch

" 开启行数
set nu

" 设置历史记录行数
set history=500

" 配置文件被修改后，自动更新文件
set autoread

" 使用空格代替制表符
set expandtab

" 自动对齐
set autoindent

" 智能对齐
set smartindent
set ai

" 突出显示当前行
set cursorline

" 自动换行
set wrap

" C/C++ 缩进模式
set cindent

" 英文单词不被截断
set linebreak

" 行内替换
set gdefault

" 智能大小写敏感，只要有一个大写，就大小写敏感
set ignorecase smartcase

if has('folding')
    " 允许代码折叠
    set foldenable

    " 代码折叠默认使用缩进
    set fdm=indent

    " 默认打开所有缩进
    set foldlevel=99
endif
" zc 当前位置折叠
" zr 打开折叠
" zR 全部展开
" zM 全部折叠
" Be smart when using tabs

" quickfix跳转会优先复用已有文件的窗口，再复用已有标签，最后没有的话就新建标签
set switchbuf=useopen,usetab,newtab

" 允许 Vim 自带脚本根据文件类型自动设置缩进等
if has ('autocmd')
    filetype plugin indent on
endif

" 语法高亮
if has('syntax')
    syntax enable
    syntax on
endif



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 编码设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 防止windows中文乱码
let $LANG='en'
set langmenu=en
set helplang=cn

" 设置neovim能够识别的编码
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936,big5

" 设置终端编码
set termencoding=utf-8

" 内部工作编码
set encoding=utf-8

" 文件默认编码
set fileencoding=utf-8

" 使用Unix作为标准文件类型
set ffs=unix,dos,mac
