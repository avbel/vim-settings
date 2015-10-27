 " Not: Skip initialization for vim-tiny or vim-small.
 if 0 | endif

 if has('vim_starting')
   if &compatible
     set nocompatible               " Be iMproved
   endif

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'
 " My Bundles here:
 
 NeoBundle 'editorconfig/editorconfig-vim'
 NeoBundle 'scrooloose/nerdtree'
 NeoBundle 'scrooloose/nerdcommenter'
 NeoBundle 'tpope/vim-fugitive'
 NeoBundle 'airblade/vim-gitgutter'
 NeoBundle 'scrooloose/syntastic'
 NeoBundle 'w0ng/vim-hybrid'
 NeoBundle 'dkprice/vim-easygrep'
 NeoBundle 'kien/ctrlp.vim'
 NeoBundle 'troydm/easybuffer.vim'
 NeoBundle 'Shougo/neocomplete.vim'
 NeoBundle 'bling/vim-airline'
 NeoBundle 'majutsushi/tagbar'
 NeoBundle 'edkolev/promptline.vim'
 call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck




syntax on
set incsearch
set smartcase
set fileencodings=utf8,cp1251
set encoding=utf8
set pastetoggle=<F12>

silent! nmap <C-n> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>
silent! imap <F3> <C-o>:NERDTreeFind<CR>

let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1


" This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 4
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'



inoremap <F2> <C-O>update<CR>
nnoremap <F2> :update<CR>
noremap <C-F2> :wa<CR>
inoremap <C-F2> <C-O>:wa<CR>
nmap <C-N><C-N> :set invnumber<CR>
inoremap <C-D><C-D> <C-O>:g/debugger;/d<CR>
nmap <F8> :TagbarToggle<CR>

" nerd tree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <c-f> :call JsBeautify()<cr>

" trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction
autocmd BufWritePre  jade,javascript,text,markdown,html,json,yaml :call TrimWhiteSpace()
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
autocmd User Node
  \ if &filetype == "javascript" |
  \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
  \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
  \ endif
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w{3,}'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  " return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
