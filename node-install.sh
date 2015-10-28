BASE_URL=https://raw.githubusercontent.com/avbel/vim-settings/master

command -v npm >/dev/null 2>&1 || { echo "npm should be installed.  Aborting." >&2; exit 1; }


echo "Installing vim plugins for NodeJS ..."
wget "$BASE_URL/node.vim" -O ~/.vim/plugin/node.vim -q
vi +NeoBundleInstall +x >/dev/null 2>/dev/null
echo "Installing some required tools for NodeJS"
npm install -g tern eslint_d >/dev/null 2>/dev/null
echo "Done"
