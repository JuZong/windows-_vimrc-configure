source $VIMRUNTIME/vimrc_example.vim

set enc=utf-8    "创建文件时的默认编码
set fencs=utf-8,gbk,big5,cp936,gb18030,gb2312,utf-16   "就是用来在打开文件的时候进行解码的猜测列表。文件编码没有百分百正确的判断方法，所以vim只能猜测文件编码。
set fenc=utf-8 "当前文件的编码也就是说，一个在vim里面已经正确显示了的文件(前提是你的系统环境跟你的enc设置匹配)，你可以通过改变 fenc后再w来将此文件存成不同的编码
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction


syn on "语法高亮 
set helplang=cn     "使用中文帮助文档
set backspace=2
set tabstop=4 "制表符的宽度
set softtabstop=4
set shiftwidth=4 "缩进的空格
set autoindent     "自动缩进
set cindent "C 插件
set number "设置行号
set ignorecase "忽略大小写 （查找字符串时）
set nohlsearch "高亮显示 （查找字符串是，找到后高亮显示）
set mouse=a "使用鼠标
set ruler     "在右下角显示光标位置
set showcmd     "显示未敲完的命令
set cmdheight=1 "设定命令行的行数为 1
set laststatus=2 "显示状态栏 (默认值为 1, 无法显示状态栏)
set incsearch "在输入搜索的字符串同时就开始搜索已经输入的部分
set nowrap "一行就一行，别弄到第二行去
set sidescroll=10     "屏幕放不下时，按一次屏幕移动一个字符    
set whichwrap=b,s,<,>,[,]     "跨行移动
set fileformats=unix,dos
set cursorline "突出显示当前行
set showmatch "插入括号时，短暂地跳转到匹配的对应括号
set matchtime=2 "短暂跳转到匹配括号的时间
set smartindent "开启新行时使用智能自动缩进
filetype plugin indent on "自动识别文件类型，用文件类型plugin脚本，使用缩进定义文件
"set autochdir

set noundofile "不加no的话 可以让你在关闭文件后再次打开时还可以撤销上次的更改，但是有了git之类的工具，这个功能实在有点多余
set nobackup   "备份文件
set noswapfile

