cd ~/workspace " ����Ĭ�ϵĹ���Ŀ¼

xnoremap p pgvy  "  ճ��ʱ���û��������塱
set autochdir "Automatically change the current directory"
" ============================= encoding ==============================
set encoding=utf8
"set langmenu=zh_CN.UTF-8
"language message zh_CN.UTF-8
"set guifont=Consolas:h13
set guifont=JetBrainsMono_Nerd_Font:h15
set fileencodings=utf-8,ucs-bom,cp936,gb18030,big5,euc-jp,euc-kr,latin1 
"set termencoding=utf-8 "ֻ���ն�Ӱ��(Ĭ��
"set ffs=unix,dos,mac "use UNIX as the standard file type

" ========================== Color & syntax & Theme =================================
"syntax on
"filetype plugin indent on
set number
set nowrap "������
set showcmd "��״̬����ʾ�������������
set laststatus=2 "������ʾ״̬��
"colorscheme jellybeans
" ==========================  Search & Replace =================================
set ignorecase "������ʱ���Сд������

" ========================== The width of Tap ======================================
set tabstop=4 "���� tab ���Ϊ4
set shiftwidth=4  "���˸��ʱ����һ��ɾ��4���ո�
set softtabstop=4 "�����Զ�����ո���
set expandtab " �༭��ʱ�����е� tab ����Ϊ�ո�(expandtab)
set smartindent 
set smarttab

" ========================== key mapping ======================================
let mapleader = ","
nmap <c-k> <C-w><Up>
nmap <c-j> <C-w><Down>
nmap <c-l> <C-w><Right>
nmap <c-h> <C-w><Left>
nmap <leader>jj <C-w>10+        "��Ļ����
nmap <leader>kk <C-w>10-        "��Ļ����
nmap <leader>hh <C-w><10
nmap <leader>ll <C-w>>10
nmap <leader>n :NERDTreeToggle<CR>
"map <leader>r :NERDTree %:p:h<CR>    "ˢ�� NERDTree ����ǰĿ¼
" ========================== VimPlug ======================================
call plug#begin('~/.vim/plugged')
Plug 'bling/vim-airline'
Plug 'preservim/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin' "����ͨ��echo errmsg �鿴
" let g:NERDTreeGitStatusUseNerdFonts = 1
Plug 'kien/ctrlp.vim'
Plug 'ryanoasis/vim-devicons' "���ӷ��ű�ʶ
Plug 'preservim/tagbar' "����tags����Ҫ������װ
Plug 'Yggdroot/indentLine' "������ʾ
Plug 'sjl/gundo.vim' "�˴��ı��༭��¼
Plug 'dyng/ctrlsf.vim' "����ack
Plug 'tpope/vim-fugitive'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim' 
Plug 'flazz/vim-colorschemes'

" Plug 'scrooloose/syntastic'
" Plug 'scrooloose/nerdcommenter'
" Plug 'majutsushi/tagbar'
" Plug 'marijnh/tern_for_vim'  "==��������·�������⣬����Python2�Ĳ�֧�֣������޷�����urllib2
" Plug 'mileszs/ack.vim'       "==����Ack ֻ֧�� *uix
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
"  au GUIEnter * simalt ~x " ��������ʱ�Զ���󻯣�ֻ��windows��Ч
"set guioptions-=m " ���ز˵��� 
"set guioptions-=T " ���ع����� 
set guioptions-=L " ������������ 
set guioptions-=r " �����Ҳ������ 
set guioptions-=b " ���صײ������� 
"set showtabline=0 " ����Tab�� 
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
let g:vim_markdown_folding_disabled = 1 "�����϶��ʱ���۵��ᵼ���������뿨�������Ҫ�ر�vim-markdown���۵�����
let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1
let g:vim_markdown_conceal_code_blocks = 0
autocmd vimenter * NERDTree  "NERDTree ����ʱ����
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "NERDTree �����һ�����ڹر�
let NERDTreeWinPos="right" "NERDTree ���Ҳ���ʾ
let NERDTreeShowHidden=1 " show hidden file
let NERDTreeDirArrows=1 "Show Node model
let NERDTreeShowLineNumbers=1 "Show line number
let NERDTreeHighlightCursorline=1
let g:indentLine_enabled = 1
