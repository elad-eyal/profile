#!bash

curl -sSL https://codeload.github.com/eladeyal-intel/profile/tar.gz/master | tar xz --strip=2 -C ~

mkdir -p ~/.vim && curl -sSL https://www.vim.org/scripts/download_script.php?src_id=26208 | tar zx --strip=1 -C ~/.vim vim-sahara-0.4.0/colors
git clone --depth=1 https://tpope.io/vim/fugitive.git ~/.vim/pack/tpope/start/fugitive && rm -fr ~/.vim/pack/tpope/start/fugitive/.git
git clone --depth=1 https://github.com/vim-airline/vim-airline ~/.vim/pack/dist/start/vim-airline && rm -fr ~/.vim/pack/dist/start/vim-airline/.git
#git clone --depth=1 https://github.com/vim-airline/vim-airline-themes ~/.vim/pack/dist/start/vim-airline-themes && rm -fr ~/.vim/pack/dist/start/vim-airline-themes/.git
curl -sSL https://www.vim.org/scripts/download_script.php?src_id=14498 | gunzip -f > /tmp/AnsiEsc.vba && vim --not-a-term -c ":so /tmp/AnsiEsc.vba" -c q && rm /tmp/AnsiEsc.vba
vim --not-a-term -u NONE -c "helptags ~/.vim/pack/tpope/start/fugitive/doc" -c "helptags ~/.vim/pack/dist/start/vim-airline/doc" -c q

tmux source-file ~/.tmux.conf || true

chmod og-w ~
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_*
chmod 644 ~/.ssh/authorized_keys ~/.ssh/known_hosts ~/.ssh/config ~/.ssh/id_*.pub

git config --global log.abbrevCommit 1
git config --global format.pretty oneline
