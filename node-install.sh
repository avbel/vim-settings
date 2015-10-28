BASE_URL=https://raw.githubusercontent.com/avbel/vim-settings/master

command -v npm >/dev/null 2>&1 || { echo "npm should be installed.  Aborting." >&2; exit 1; }
command -v vi >/dev/null 2>&1 || { echo "vim should be installed.  Aborting." >&2; exit 1; }

[ -d ~/.vim/plugin ] || mkdir -p ~/.vim/plugin

echo "Installing vim plugins for NodeJS ..."
wget "$BASE_URL/node.vim" -O ~/.vim/plugin/node.vim -q
(vi +NeoBundleInstall +x >/dev/null 2>/dev/null)
echo "Installing some required tools for NodeJS"
npm install eslint eslint_d >/dev/null 2>/dev/null
(cd ~/.vim/bundle/tern_for_vim && npm install >/dev/null 2>/dev/null)
echo "Done"
