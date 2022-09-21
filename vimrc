echo " "
echo "Started reading ~/.vimrc from top"
echo ""

set nocompatible
set background=dark
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set shiftwidth=4

"Line Numbers
set relativenumber
set number
set ruler

filetype plugin indent on

"Goyo 
let g:goyo_width = 75
let g:goyo_margin_top = 0
let g:goyo_margin_bottom = 0
let g:goyo_height = '100%'
"(default: 85%)
let g:goyo_linenr = 0 
" (default: 0)

"Limelight
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
" Default: 0.5
let g:limelight_default_coefficient = 0.7
" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 0
" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
"let g:limelight_bop = '^\s'
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'
" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

"Pencil
"autocmd! User Pencil Limelight
"autocmd! User Pencil Limelight!

"Pathogen
filetype off " Pathogen needs to run before plugin indent on
call pathogen#infect()
call pathogen#helptags()
filetype on

"NERDTree
"autocmd vimenter * NERDTree
"runtime ~/.vim/bundle/nerdtree/autoload/nerd_tree.vim

"Colors
colorscheme murphy 

"Mappings
inoremap ii <Esc>`^
nnoremap mm :!open -a marked\ 2.app % <CR> <CR>:set columns=100<CR>

"Markdown
let vim_markdown_preview_toggle=1

" vimwiki
let wiki_1 = {}
let wiki_1.path = '/Users/userdoug/Dropbox/wiki/'
let wiki_1.path_html = '/Users/userdoug/Dropbox/wiki_html/'
let wiki_2 = {}
let wiki_2.path = '/Users/userdoug/Dropbox/wiki2/'
let wiki_2.path_html = '/Users/userdoug/Dropbox/wiki2_html/'
let g:vimwiki_list = [wiki_1, wiki_2]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

"Syntax Hilighting - has to appear in this order
syntax on
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
highlight CursorLineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
" format JSON
map <Leader>j :%!python -m json.tool<CR>

" For wordprocessing mode
func! WordProcessorMode() 
  :Goyo
  setlocal formatoptions=1 
  colorscheme iawriter
  setlocal noexpandtab 
  map j gj 
  map k gk
  setlocal spell spelllang=en_us 
  "set thesaurus+=/Users/sbrown/.vim/thesaurus/mthesaur.txt
  set complete+=s
  set formatprg=par
  setlocal wrap 
  setlocal linebreak 
endfu 
com! WP call WordProcessorMode()

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
   filetype plugin indent on
endif
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
" if filereadable("/etc/vim/vimrc.local")
"   source /etc/vim/vimrc.local
" endif
echo " "
echo "End of ~/.vimrc reached"
echo " "
echo " "
