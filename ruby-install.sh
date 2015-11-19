BASE_URL=https://raw.githubusercontent.com/avbel/vim-settings/master

command -v ruby >/dev/null 2>&1 || { echo "ruby should be installed.  Aborting." >&2; exit 1; }
command -v vim >/dev/null 2>&1 || { echo "vim should be installed.  Aborting." >&2; exit 1; }

[ -d ~/.vim/plugin ] || mkdir -p ~/.vim/plugin

echo "Installing vim plugins for Ruby ..."
wget "$BASE_URL/ruby.vim" -O ~/.vim/plugin/ruby.vim -q
vim +NeoBundleInstall +x </dev/tty >/dev/null 2>/dev/null
echo "Done"
