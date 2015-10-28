BASE_URL=https://raw.githubusercontent.com/avbel/vim-settings/master

command -v vi >/dev/null 2>&1 || { echo "vim should be installed.  Aborting." >&2; exit 1; }

[ -d ~/.vim/plugin ] || mkdir -p ~/.vim/plugin

echo "Installing vim plugins for Go ..."
wget "$BASE_URL/go.vim" -O ~/.vim/plugin/go.vim -q
(vi +NeoBundleInstall +x >/dev/null 2>/dev/null)
echo "Done"
