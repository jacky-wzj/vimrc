cd ~/workspace " 设置默认的工作目录

xnoremap p pgvy  "  粘贴时不置换“剪贴板”
set autochdir "Automatically change the current directory"
" ============================= encoding ==============================
set encoding=utf8
"set langmenu=zh_CN.UTF-8
"language message zh_CN.UTF-8
"set guifont=Consolas:h13
set guifont=JetBrainsMono_Nerd_Font:h15
set fileencodings=utf-8,ucs-bom,cp936,gb18030,big5,euc-jp,euc-kr,latin1 
"set termencoding=utf-8 "只对终端影响(默认
"set ffs=unix,dos,mac "use UNIX as the standard file type

" ========================== Color & syntax & Theme =================================
"syntax on
"filetype plugin indent on
set number
set nowrap "不折行
set showcmd "在状态栏显示正在输入的命令
set laststatus=2 "总是显示状态栏
"colorscheme jellybeans
" ==========================  Search & Replace =================================
set ignorecase "搜索的时候大小写不敏感

" ========================== The width of Tap ======================================
set tabstop=4 "设置 tab 宽度为4
set shiftwidth=4  "按退格键时可以一次删除4个空格
set softtabstop=4 "设置自动对齐空格数
set expandtab " 编辑的时候将所有的 tab 设置为空格(expandtab)
set smartindent 
set smarttab

" ========================== key mapping ======================================
let mapleader = ","
nmap <c-k> <C-w><Up>
nmap <c-j> <C-w><Down>
nmap <c-l> <C-w><Right>
nmap <c-h> <C-w><Left>
nmap <leader>jj <C-w>10+        "屏幕下移
nmap <leader>kk <C-w>10-        "屏幕上移
nmap <leader>hh <C-w><10
nmap <leader>ll <C-w>>10
nmap <leader>n :NERDTreeToggle<CR>
"map <leader>r :NERDTree %:p:h<CR>    "刷新 NERDTree 到当前目录
" ========================== VimPlug ======================================
call plug#begin('~/.vim/plugged')
Plug 'bling/vim-airline'
Plug 'preservim/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin' "报错，通过echo errmsg 查看
" let g:NERDTreeGitStatusUseNerdFonts = 1
Plug 'kien/ctrlp.vim'
Plug 'ryanoasis/vim-devicons' "增加符号标识
Plug 'preservim/tagbar' "依赖tags，需要单独安装
Plug 'Yggdroot/indentLine' "缩进显示
Plug 'sjl/gundo.vim' "此次文本编辑记录
Plug 'dyng/ctrlsf.vim' "依赖ack
Plug 'tpope/vim-fugitive'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim' 
Plug 'flazz/vim-colorschemes'

" Plug 'scrooloose/syntastic'
" Plug 'scrooloose/nerdcommenter'
" Plug 'majutsushi/tagbar'
" Plug 'marijnh/tern_for_vim'  "==由于中文路径的问题，导致Python2的不支持，进而无法加载urllib2
" Plug 'mileszs/ack.vim'       "==由于Ack 只支持 *uix
" Plug 'godlygeek/tabular'
" Plug 'ervandew/supertab'
" Plug 'msanders/snipmate.vim'
" plug on GitHub repo
" plug from http://vim-scripts.org/vim/scripts.html
" Plug 'L9'
" Plug 'git://git.wincent.com/command-t.git'
" Plug 'file:///home/gmarik/path/to/plugin'
" Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" Plug 'user/L9', {'name': 'newL9'}
call plug#end()

" =================================== Default ===============================
" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
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

" ==================== Toggle Menu and Toolbar =====================
if has("gui_running") 
"  au GUIEnter * simalt ~x " 窗口启动时自动最大化，只对windows有效
"set guioptions-=m " 隐藏菜单栏 
"set guioptions-=T " 隐藏工具栏 
set guioptions-=L " 隐藏左侧滚动条 
set guioptions-=r " 隐藏右侧滚动条 
set guioptions-=b " 隐藏底部滚动条 
"set showtabline=0 " 隐藏Tab栏 
endif 
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>

" ==================== Vim swap files =====================
" swap files (.swp) in a common location
" // means use the file's full path
"set dir=~/vimfiles/_swap//

" backup files (~) in a common location if possible
set backup
set backupdir=~/vimfiles/_backup/,~/tmp,.

" turn on undo files, put them in a common location
set undofile
set undodir=~/vimfiles/_undo/

" =====================color scheme =============
colorscheme molokai
" =====================Tagbar ==============
nmap <leader>tt :TagbarToggle<CR>
nmap <F8> :TagbarToggle<CR>
nmap <leader>gg :GundoToggle<CR>
let g:airline_powerline_fonts = 1
let g:tagbar_position = 'left'
let g:vim_markdown_folding_disabled = 1 "行数较多的时候折叠会导致中文输入卡，因此需要关闭vim-markdown的折叠功能
let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1
let g:vim_markdown_conceal_code_blocks = 0
autocmd vimenter * NERDTree  "NERDTree 启动时开启
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "NERDTree 随最后一个窗口关闭
let NERDTreeWinPos="right" "NERDTree 在右侧显示
let NERDTreeShowHidden=1 " show hidden file
let NERDTreeDirArrows=1 "Show Node model
let NERDTreeShowLineNumbers=1 "Show line number
let NERDTreeHighlightCursorline=1
let g:indentLine_enabled = 1
