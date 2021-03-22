"cd d:\workspace\ " 设置默认的工作目录

xnoremap p pgvy  "  粘贴时不置换“剪贴板”
set cursorline
set cursorcolumn
" set autochdir "Automatically change the current directory"
" set shell=wsl.exe "速度真快,可惜不能替换builtin-term导致plugin不能完整工作
" set shellpipe=|
" set shellredir=>
" set shellcmdflag=
" ============================= encoding ==============================
set encoding=UTF-8
set langmenu=UTF-8
set guifont=JetBrainsMono\ NF:h10
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8 "只对终端影响(默认
set ffs=unix,dos,mac "use UNIX as the standard file type

" ========================== Color & syntax & Theme =================================
"syntax on
"filetype plugin indent on
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
map <silent><c-k> <C-w><Up>
map <silent><c-j> <C-w><Down>
map <silent><c-l> <C-w><Right>
map <silent><c-h> <C-w><Left>
map <silent><leader>jj <C-w>10+        "屏幕下移
map <silent><leader>kk <C-w>10-        "屏幕上移
map <silent><leader>hh <C-w>30<
map <silent><leader>ll <C-w>30>
map <silent><leader>n :NERDTreeToggle<CR>
" map <silent><leader>rr :NERDTree %:p:h<CR>    "刷新 NERDTree 到当前目录
nmap <silent><leader>t :TagbarToggle<CR> 
" nmap <F8> :TagbarToggle<CR>
nmap <silent><leader>gu :GundoToggle<CR>
nnoremap <silent><leader>nh :nohl<CR>
nmap <silent><c-p> :Files!<CR>
nmap <silent><leader>/b :BLines!<CR>
nmap <silent><leader>// :Lines!<CR>
nmap <silent><leader>gc :Commits!<CR>
nmap <silent><leader>gb :BCommits!<CR>
nmap <silent><leader>/rg :Rg<CR>
" ========================== VimPlug ======================================
call plug#begin('~/.vim/plugged')
Plug 'bling/vim-airline'
Plug 'preservim/nerdtree' 
"Plug 'kien/ctrlp.vim'
Plug 'ryanoasis/vim-devicons' "增加符号标识,依赖 nerd-fonts
Plug 'preservim/tagbar' "依赖tags，需要单独安装,可以用coc 替代
Plug 'Yggdroot/indentLine' "缩进显示
Plug 'sjl/gundo.vim' "此次文本编辑记录, 依赖 python
"Plug 'dyng/ctrlsf.vim' "依赖ack
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' "依赖rg. fzf.vim的preview.sh脚本在windows下会有换行语法错误. 查看命令为:set ff , 修复命令为:set ff=unix
Plug 'tpope/vim-fugitive' "依赖git
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" markdown-preview 可能会安装失败,需要手动触发一次安装
" :source %
" :PluginInstall
" :call mkdp#util#install()
Plug 'flazz/vim-colorschemes'
Plug 'neoclide/coc.nvim', {'branch': 'release'} "依赖nodejs
Plug 'tomtom/tcomment_vim'
" Plug 'mg979/vim-visual-multi'
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
  au GUIEnter * simalt ~x " 窗口启动时自动最大化 
set guioptions-=m " 隐藏菜单栏 
set guioptions-=T " 隐藏工具栏 
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
set dir=~/vimfiles/_swap//

" backup files (~) in a common location if possible
set backup
set backupdir=~/vimfiles/_backup/,~/tmp,.

" turn on undo files, put them in a common location
set undofile
set undodir=~/vimfiles/_undo/


" =====================color scheme =============
colorscheme molokai
" =====================Customize ==============
let g:airline_powerline_fonts = 1
let g:tagbar_position = 'left'
let g:vim_markdown_folding_disabled = 1 "行数较多的时候折叠会导致中文输入卡，因此需要关闭vim-markdown的折叠功能
let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1
let g:vim_markdown_conceal_code_blocks = 0
" autocmd vimenter * NERDTree  "NERDTree 启动时开启
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "NERDTree 随最后一个窗口关闭
let NERDTreeWinPos="right" "NERDTree 在右侧显示
let NERDTreeShowHidden=1 " show hidden file
let NERDTreeDirArrows=1 "Show Node model
let NERDTreeShowLineNumbers=1 "Show line number
let NERDTreeHighlightCursorline=1
" let g:indentLine_setConceal = 0 "indentLine 会隐藏json文件的冒号,使用起来非常不便
let g:indentLine_fileTypeExclude = ['json'] "上面的配置会导致indentline功能丧失,先暂时过滤掉json文件吧
hi Cursor          guifg=#FF0000 guibg=#F8F8F0 "高亮光标所在位置,避免搜索高亮的冲突
"keep cursor in the middle all the time :)
nnoremap k kzz
nnoremap j jzz
nnoremap p pzz
nnoremap P Pzz
nnoremap G Gzz
nnoremap x xzz
inoremap <ESC> <ESC>zz
nnoremap <ENTER> <ENTER>zz
inoremap <ENTER> <ENTER><ESC>zzi
nnoremap o o<ESC>zza
nnoremap O O<ESC>zza
nnoremap a a<ESC>zza
" ====================== coc =====================
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" airline show coc status
let g:airline#extensions#coc#enabled = 1
" add coc extensions
 let g:coc_global_extensions = ['coc-json', 'coc-java','coc-markdownlint','coc-sql','coc-highlight','coc-spell-checker','coc-pairs']
"====================== fzf ====================
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - Popup window
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" - down / up / left / right
let g:fzf_layout = { 'down': '40%' }

" - Window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10new' }

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'
"======================= TComments ======================
let g:tcomment_maps = 0 "注释掉自带的映射,原映射搞的太多了
nmap <leader>;c <Plug>TComment_<c-_><c-_>
vmap <leader>;c <Plug>TComment_<c-_><c-_>
nmap <leader>;b <Plug>TComment_<c-_>b
xmap <leader>;b <Plug>TComment_<c-_>b
