### vim

    - vim配置文件的备份
    - 本次备份Windows/Linux通用


### Neovim

    - neovim 配置文件及插件备份(基本配置、主题配置、插件配置分离)
    - 本次备份适用于Windows：(将文件夹nvim复制到C:/Users/xxx/AppData/Local目录下)
    - 适用于Linux：（将文件夹nvim复制到~/.config/ 目录下）

    + .git
    + nvim
        + autoload
            + plug.vim                  plug-vim插件管理插件
        + colors                        neovim 颜色
            + molokai.vim
            + solarized.vim
        + config    
            + base.vim                  全局配置
            + keymap.vim                按键绑定相关
            + other.vim					其它相关配置
            + plug.vim                  插件相关配置
            + tabsize.vim				缩进相关配置
            + theme.vim                 主题相关配置
        + plugins                       插件保存的位置
        + ctags.exe
        + init.vim                      基础配置文件
        + 创建初始化配置文件方法.txt
