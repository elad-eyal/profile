#!bash

curl -sSL https://codeload.github.com/eladeyal-intel/profile/tar.gz/master? | tar xz --strip=2 -C ~

# replace ~/.lnav/stdin-captures with /tmp to save space & performance 
mkdir -p ~/.lnav && [[ ! -L ~/.lnav/stdin-captures ]] && rm -fr ~/.lnav/stdin-captures && ln -s /tmp ~/.lnav/stdin-captures

mkdir -p ~/.vim && curl -sSL https://www.vim.org/scripts/download_script.php?src_id=26208 | tar zx --strip=1 -C ~/.vim vim-sahara-0.4.0/colors
mkdir -p ~/.vim/pack/tpope/start && curl -sSL https://codeload.github.com/tpope/vim-fugitive/tar.gz/master | tar xz -C ~/.vim/pack/tpope/start
mkdir -p ~/.vim/pack/dist/start && curl -sSL https://codeload.github.com/vim-airline/vim-airline/tar.gz/master | tar zx -C  ~/.vim/pack/dist/start
#git clone --depth=1 https://github.com/vim-airline/vim-airline-themes ~/.vim/pack/dist/start/vim-airline-themes && rm -fr ~/.vim/pack/dist/start/vim-airline-themes/.git
curl -sSL https://www.vim.org/scripts/download_script.php?src_id=14498 | gunzip -f > /tmp/AnsiEsc.vba && vim --not-a-term -c ":so /tmp/AnsiEsc.vba" -c q && rm /tmp/AnsiEsc.vba
vim --not-a-term -u NONE -c "helptags ~/.vim/pack/tpope/start/fugitive/doc" -c "helptags ~/.vim/pack/dist/start/vim-airline/doc" -c q

chmod -f og-w ~
chmod -f 700 ~/.ssh
chmod -f 600 ~/.ssh/id_*
chmod -f 644 ~/.ssh/authorized_keys ~/.ssh/known_hosts ~/.ssh/config ~/.ssh/id_*.pub

git config --global log.abbrevCommit 1 && \
git config --global format.pretty "format:%Cred%h%Creset %s %C(yellow)%d%Creset %Cgreen(%cr) %C(bold blue)<%aN>%Creset" && \
git config --global alias.lg "log --graph -10"  && \
git config --global core.editor vim
#git config --global format.pretty oneline

tmux source-file ~/.tmux.conf || true

source ~/.bash_aliases
