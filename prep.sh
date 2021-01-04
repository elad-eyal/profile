#!bash

curl -sSL https://codeload.github.com/eladeyal-intel/profile/tar.gz/master? | tar xz --strip=2 -C ~

mkdir -p ~/.vim && curl -sSL https://www.vim.org/scripts/download_script.php?src_id=26208 | tar zx --strip=1 -C ~/.vim vim-sahara-0.4.0/colors
git clone --depth=1 https://tpope.io/vim/fugitive.git ~/.vim/pack/tpope/start/fugitive && rm -fr ~/.vim/pack/tpope/start/fugitive/.git
git clone --depth=1 https://github.com/vim-airline/vim-airline ~/.vim/pack/dist/start/vim-airline && rm -fr ~/.vim/pack/dist/start/vim-airline/.git
#git clone --depth=1 https://github.com/vim-airline/vim-airline-themes ~/.vim/pack/dist/start/vim-airline-themes && rm -fr ~/.vim/pack/dist/start/vim-airline-themes/.git
curl -sSL https://www.vim.org/scripts/download_script.php?src_id=14498 | gunzip -f > /tmp/AnsiEsc.vba && vim --not-a-term -c ":so /tmp/AnsiEsc.vba" -c q && rm /tmp/AnsiEsc.vba
vim --not-a-term -u NONE -c "helptags ~/.vim/pack/tpope/start/fugitive/doc" -c "helptags ~/.vim/pack/dist/start/vim-airline/doc" -c q

chmod -f og-w ~
chmod -f 700 ~/.ssh
chmod -f 600 ~/.ssh/id_*
chmod -f 644 ~/.ssh/authorized_keys ~/.ssh/known_hosts ~/.ssh/config ~/.ssh/id_*.pub

git config --global log.abbrevCommit 1
#git config --global format.pretty oneline
git config --global format.pretty "format:%Cred%h%Creset %s %C(yellow)%d%Creset %Cgreen(%cr) %C(bold blue)<%al>%Creset"
git config --global alias.lg "log --graph -10" 
git config --global core.editor vim

tmux source-file ~/.tmux.conf || true
source ~/.bash_aliases
