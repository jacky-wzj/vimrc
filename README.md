# vimrc

Jacky's vimrc. vim plugin base on Vim-Plug.  
Windows use Windows Terminal & PowerShell. MacOS see **macOS** branch  

- Encoding  
- Color & syntax  
- Fix Tap  
- Toggle Menu and Toolbar  
- Vim-Plug  
    > Plug 'bling/vim-airline'  
    > Plug 'preservim/nerdtree'  
    > "Plug 'kien/ctrlp.vim'  "已废弃,改用fzf
    > Plug 'ryanoasis/vim-devicons' "增加符号标识,依赖 nerd-fonts  
    > Plug 'preservim/tagbar' "依赖tags，需要单独安装,可以用coc 替代  
    > Plug 'Yggdroot/indentLine' "缩进显示  
    > Plug 'sjl/gundo.vim' "此次文本编辑记录  
    > " Plug 'dyng/ctrlsf.vim' "依赖ack,已废弃,改用fzf
    > Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  
    > Plug 'junegunn/fzf.vim' "依赖rg ,基于rg做模糊搜索  
    > Plug 'tpope/vim-fugitive'  
    > Plug 'godlygeek/tabular'  
    > Plug 'plasticboy/vim-markdown'  
    > Plug 'iamcco/markdown-preview.nvim'   
    > Plug 'flazz/vim-colorschemes'  
    > Plug 'neoclide/coc.nvim', {'branch': 'release'}  
    > Plug 'tomtom/tcomment_vim'  

## Syntastic

- Javascript 的语法检查基于 Jshint , 因此需要先安装 NodeJs & Npm
- Java 语法检查给予COC（LSP）

## MEMO

- Maping Leader to ,

