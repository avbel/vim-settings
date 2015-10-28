BASE_URL=https://raw.githubusercontent.com/avbel/vim-settings/master

command -v vi >/dev/null 2>&1 || { echo "VIM should be installed.  Aborting." >&2; exit 1; }
command -v ctags >/dev/null 2>&1 || { echo "ctags should be installed.  Aborting." >&2; exit 1; }

[ -f ~/.vimrc ] && exit 0

mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/plugin
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
wget "$BASE_URL/.vimrc" -O ~/.vimrc -q
if command -v tmux >/dev/null 2>&1; then
  wget "$BASE_URL/tmux.vim" -O ~/.vim/plugin/tmux.vim
fi

echo "Installing vim plugins ..."
sh -c "vi +NeoBundleInstall +x" >/dev/null 2>/dev/null

echo "Changing plugins settings..."
wget "$BASE_URL/current-theme.vim" -O ~/.vim/plugin/current-theme.vim -q
wget "$BASE_URL/promptline.vim" -O ~/.vim/plugin/promptline.vim -q

echo "Configuring shell..."
sh -c 'vi +"PromptlineSnapshot ~/.shell_prompt.sh airline" +x' >/dev/null 2>/dev/null
echo ". $HOME/.shell_prompt.sh" >> ~/.profile

echo "Done"


