""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 按键设定
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 快速保存
nmap <leader>w :w!<cr>

" 快速退出
nmap <leader>q :q<cr>

" Ctrl + s 保存文件
map <C-s> :w<cr>

" 按 <leader>k 向上移动半屏
nnoremap <leader>k <c-u>

" 按 <leader>j 向下移动半屏
nnoremap <leader>j <c-d>

" 分屏窗口移动
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>h <C-w>h
map <leader>l <C-w>l


map <left> :bp!<cr>
map <right> :bn!<cr>
map <up> :tabp<cr>
map <down> :tabn<cr>



" --------------------------------
" INSERT 模式下使用 EMACS 键位
" --------------------------------
inoremap <c-a> <home>
inoremap <c-e> <end>
inoremap <c-d> <del>
inoremap <c-_> <c-k>


" --------------------------------
" 设置Ctrl+hjkl 移动光标
" --------------------------------
nnoremap <C-h> <left>
nnoremap <C-j> <down>
nnoremap <C-k> <up>
nnoremap <C-l> <right>
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>


" --------------------------------
" 命令模式的快速移动
" --------------------------------
cnoremap <C-h> <left>
cnoremap <C-j> <down>
cnoremap <C-k> <up>
cnoremap <C-l> <right>
cnoremap <C-a> <home>
cnoremap <C-e> <end>
cnoremap <C-f> <c-d>
cnoremap <C-d> <del>
cnoremap <C-_> <c-k>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 插件按键
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ---------------------------
" Defx.vim插件
" ---------------------------
" 快捷键<F2>快速打开/关闭Defx
nmap <silent><F2> :Defx <cr>

" 这是我的配置. 参考文档种的配置做的修改.  还需完善
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
    setl nonumber
    setl norelativenumber
    setl listchars=

    " defx 没有提供默认的键盘映射,所以需要自己进行设置
    " Define mappings
    nnoremap <silent><buffer><expr> <CR>
    \ defx#do_action('open')

    nnoremap <silent><buffer><expr> c
    \ defx#do_action('copy')

    nnoremap <silent><buffer><expr> m
    \ defx#do_action('move')

    nnoremap <silent><buffer><expr> p
    \ defx#do_action('paste')

    nnoremap <silent><buffer><expr> l
    \ defx#do_action('open')

    nnoremap <silent><buffer><expr> E
    \ defx#do_action('open', 'vsplit')

    nnoremap <silent><buffer><expr> P
    \ defx#do_action('open', 'pedit')

    nnoremap <silent><buffer><expr> o
    \ defx#do_action('open_or_close_tree')

    nnoremap <silent><buffer><expr> K
    \ defx#do_action('new_directory')

    nnoremap <silent><buffer><expr> N
    \ defx#do_action('new_file')

    nnoremap <silent><buffer><expr> M
    \ defx#do_action('new_multiple_files')

    nnoremap <silent><buffer><expr> C
    \ defx#do_action('toggle_columns',
    \                'mark:indent:icon:filename:type:size:time')

    nnoremap <silent><buffer><expr> S
    \ defx#do_action('toggle_sort', 'time')

    nnoremap <silent><buffer><expr> d
    \ defx#do_action('remove')

    nnoremap <silent><buffer><expr> r
    \ defx#do_action('rename')

    nnoremap <silent><buffer><expr> !
    \ defx#do_action('execute_command')

    nnoremap <silent><buffer><expr> x
    \ defx#do_action('execute_system')

    nnoremap <silent><buffer><expr> yy
    \ defx#do_action('yank_path')

    nnoremap <silent><buffer><expr> .
    \ defx#do_action('toggle_ignored_files')

    nnoremap <silent><buffer><expr> ;
    \ defx#do_action('repeat')

    nnoremap <silent><buffer><expr> h
    \ defx#do_action('cd', ['..'])

    nnoremap <silent><buffer><expr> ~
    \ defx#do_action('cd')

    nnoremap <silent><buffer><expr> q
    \ defx#do_action('quit')

    nnoremap <silent><buffer><expr> <Space>
    \ defx#do_action('toggle_select') . 'j'

    nnoremap <silent><buffer><expr> *
    \ defx#do_action('toggle_select_all')

    nnoremap <silent><buffer><expr> j
    \ line('.') == line('$') ? 'gg' : 'j'

    nnoremap <silent><buffer><expr> k
    \ line('.') == 1 ? 'G' : 'k'

    nnoremap <silent><buffer><expr> <C-l>
    \ defx#do_action('redraw')

    nnoremap <silent><buffer><expr> <C-g>
    \ defx#do_action('print')

    nnoremap <silent><buffer><expr> cd
    \ defx#do_action('change_vim_cwd')
endfunction

" Defx.vim操作帮助


" ---------------------------
" => LeaderF 按键配置
" ---------------------------
" CTRL+n 打开最近使用的文件 MRU，进行模糊匹配
noremap <c-n> :LeaderfMru<cr>

" ALT+p 打开函数列表，按 i 进入模糊匹配，ESC 退出
noremap <m-p> :LeaderfFunction!<cr>

" ALT+SHIFT+p 打开 tag 列表，i 进入模糊匹配，ESC退出
noremap <m-P> :LeaderfBufTag!<cr>

" ALT+n 打开 buffer 列表进行模糊匹配
noremap <m-n> :LeaderfBuffer<cr>

" ALT+m 全局 tags 模糊匹配
noremap <m-m> :LeaderfTag<cr>



" ---------------------------
" vista.vim插件
" ---------------------------
