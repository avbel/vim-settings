call neobundle#append()
 NeoBundle 'edkolev/tmuxline.vim'
call neobundle#end()

let g:tmuxline_preset = {
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W']}

