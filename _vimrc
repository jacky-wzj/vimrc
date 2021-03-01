cd ~/workspace " 设置默认的工作目录

xnoremap p pgvy  "  粘贴时不置换“剪贴板”
set autochdir "Automatically change the current directory"
" ============================= encoding ==============================
set encoding=UTF-8 "设置默认编码方式
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
"set guifont=Consolas:h13
set guifont=Monaco:h14 noanti
set fileencodings=utf-8,ucs-bom,cp936,gb18030,big5,euc-jp,euc-kr,latin1 
"set termencoding=utf-8 "只对终端影响(默认
set ffs=unix,dos,mac "use UNIX as the standard file type

" ========================== Color & syntax & Theme =================================
syntax on
filetype plugin indent on
set number
set nowrap "不折行
set showcmd "在状态栏显示正在输入的命令
set laststatus=2 "总是显示状态栏
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
map <c-k> <C-w><Up>
map <c-j> <C-w><Down>
map <c-l> <C-w><Right>
map <c-h> <C-w><Left>
map <leader>jj <C-w>10+        "屏幕下移
map <leader>kk <C-w>10-        "屏幕上移
map <leader>n :NERDTreeToggle<CR>
map <leader>r :NERDTree %:p:h<CR>    "刷新 NERDTree 到当前目录
" ========================== Vundle ======================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"set rtp+=~/vimfiles/bundle/Vundle.vim/
set rtp+=~/.vim/bundle/Vundle.vim
"let path='~/vimfiles/bundle'
"call vundle#begin(path)
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" 安装nerd-fonts 以显示文本图形ryanoasis/nerd-fonts
Plugin 'bling/vim-airline'
let g:airline_powerline_fonts = 1
Plugin 'preservim/nerdtree'
Plugin 'kien/ctrlp.vim'
" Plugin 'nanotech/jellybeans.vim' "使用的时候需要在.vim下新建 color目录并将 jellybeans.vim copy过去
" Plugin 'Xuyuanp/nerdtree-git-plugin' "macvim 下报错，查看错误echo errmsg
" let g:NERDTreeGitStatusUseNerdFonts = 1
Plugin 'ryanoasis/vim-devicons'
autocmd vimenter * NERDTree  "NERDTree 启动时开启
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "NERDTree 随最后一个窗口关闭
let NERDTreeWinPos="right" "NERDTree 在右侧显示
let NERDTreeShowHidden=1 " show hidden file
let NERDTreeDirArrows=1 "Show Node model
let NERDTreeShowLineNumbers=1 "Show line number
let NERDTreeHighlightCursorline=1
" ========================== Vundle - syntastic ======================================
" Plugin 'scrooloose/syntastic'
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" let g:syntastic_javascript_checkers = ['jshint']
" ========================== Vundle - syntastic ======================================

" Plugin 'scrooloose/nerdcommenter'
" Plugin 'majutsushi/tagbar'
"Plugin 'marijnh/tern_for_vim'  "==由于中文路径的问题，导致Python2的不支持，进而无法加载urllib2
"Plugin 'mileszs/ack.vim'       "==由于Ack 只支持 *uix
" Plugin 'godlygeek/tabular'
" Plugin 'ervandew/supertab'
" Plugin 'msanders/snipmate.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'iamcco/markdown-preview.nvim'  
Plugin 'flazz/vim-colorschemes'
let g:vim_markdown_folding_disabled = 1 "行数较多的时候折叠会导致中文输入卡，因此需要关闭vim-markdown的折叠功能

" All of your Plugins must be added before the following line
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

" ==================color scheme=================
colorscheme molokai
"colorscheme jellybeans
