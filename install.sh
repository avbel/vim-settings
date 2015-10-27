BASE_URL=https://raw.githubusercontent.com/avbel/vim-settings/master

command -v vi >/dev/null 2>&1 || { echo "VIM should be installed.  Aborting." >&2; exit 1; }

mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/plugin
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
wget "$BASE_URL/.vimrc" -O ~/.vimrc
if command -v tmux >/dev/null 2>&1; then
  wget "$BASE_URL/tmux.vim" -O ~/.vim/plugin/tmux.vim
fi
vi +NeoBundleInstall +x
wget "$BASE_URL/current-theme.vim" -O ~/.vim/plugin/current-theme.vim
vi +PromptlineSnapshot ~/.shell_prompt.sh airline +x
echo "source ~/.shell_prompt.sh" >> ~/.profile
source ~/.shell_prompt.sh


