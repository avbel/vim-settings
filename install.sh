BASE_URL=https://raw.githubusercontent.com/avbel/vim-settings/master

command -v vi >/dev/null 2>&1 || { echo "VIM should be installed.  Aborting." >&2; exit 1; }
command -v ctags >/dev/null 2>&1 || { echo "ctags should be installed.  Aborting." >&2; exit 1; }

[ -f ~/.vimrc ] && exit 0

mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/plugin
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
wget "$BASE_URL/.vimrc" -O ~/.vimrc
if command -v tmux >/dev/null 2>&1; then
  wget "$BASE_URL/tmux.vim" -O ~/.vim/plugin/tmux.vim
fi

sleep 2
echo "Installing vim plugins ..."
vi +NeoBundleInstall +xa
sleep 2

echo "Changing plugins settings..."
wget "$BASE_URL/current-theme.vim" -O ~/.vim/plugin/current-theme.vim
wget "$BASE_URL/promptline.vim" -O ~/.vim/plugin/promptline.vim
sleep 2

echo "Configuring shell..."
vi +"PromptlineSnapshot ~/.shell_prompt.sh airline" +x
echo ". $HOME/.shell_prompt.sh" >> ~/.profile

echo "Done"


