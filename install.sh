BASE_URL=https://raw.githubusercontent.com/avbel/vim-settings/master

command -v vim >/dev/null 2>&1 || { echo "VIM should be installed.  Aborting." >&2; exit 1; }

[ -f ~/.vimrc ] && exit 0

mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/plugin
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim -q
wget "$BASE_URL/.vimrc" -O ~/.vimrc -q

echo "Installing vim plugins ..."


vim +NeoBundleInstall +x  >/dev/null 2>/dev/null

echo "Changing plugins settings..."
wget "$BASE_URL/current-theme.vim" -O ~/.vim/plugin/current-theme.vim -q
wget "$BASE_URL/shell.vim" -O ~/.vim/plugin/shell.vim -q

[ -f ~/.shell_prompt.sh ] && exit 0

echo "Configuring shell..."

vim +"PromptlineSnapshot ~/.shell_prompt.sh airline" +x  >/dev/null 2>/dev/null
echo ". $HOME/.shell_prompt.sh" >> ~/.profile
