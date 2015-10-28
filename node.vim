call neobundle#append()
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
NeoBundle 'digitaltoad/vim-jade'
NeoBundleLazy 'marijnh/tern_for_vim', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'moll/vim-node', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'maksimr/vim-jsbeautify', {'autoload':{'filetypes':['javascript', 'html', 'css']}}
call neobundle#end()

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'

filetype plugin indent on