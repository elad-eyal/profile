#!/bin/bash

# delete and migrate
rm -f $HOME/.lnav/configs/installed/copy-to-windows-clipboard.json

# start

curl -sSL https://codeload.github.com/elad-eyal/profile/tar.gz/master? | tar xz --strip=2 -C ~

[[ -d $HOME/by_arch___/$HOSTTYPE ]] && cp -r $HOME/by_arch___/$HOSTTYPE/* $HOME/

# if ( uname -a | grep -qi wsl ); then
#    cp -r $HOME/by_arch___/WSL/* $HOME/
#else
#    cp -r $HOME/by_arch___/NOT_WSL/* $HOME/
#fi

rm -fr $HOME/by_arch___

# replace ~/.lnav/stdin-captures with /tmp to save space & performance 
mkdir -p ~/.lnav && [[ ! -L ~/.lnav/stdin-captures ]] && rm -fr ~/.lnav/stdin-captures && ln -s /tmp ~/.lnav/stdin-captures



# Override "lnav save-to-clipboard" with mine
[ "$(command -v lnav)" ] && \
  ~/bin/lnav -n -N -c ":config /tuning/clipboard/impls/tmux/general/write ~/bin/wclip" && \
  ~/bin/lnav -n -N -c ":config /tuning/clipboard/impls/tmux/test true"


mkdir -p ~/.vim && curl -sSL https://www.vim.org/scripts/download_script.php?src_id=26208 | tar zx --strip=1 -C ~/.vim vim-sahara-0.4.0/colors
mkdir -p ~/.vim/pack/tpope/start && curl -sSL https://codeload.github.com/tpope/vim-fugitive/tar.gz/master | tar xz -C ~/.vim/pack/tpope/start
mkdir -p ~/.vim/pack/dist/start && curl -sSL https://codeload.github.com/vim-airline/vim-airline/tar.gz/master | tar zx -C  ~/.vim/pack/dist/start
#git clone --depth=1 https://github.com/vim-airline/vim-airline-themes ~/.vim/pack/dist/start/vim-airline-themes && rm -fr ~/.vim/pack/dist/start/vim-airline-themes/.git
curl -sSL https://www.vim.org/scripts/download_script.php?src_id=14498 | gunzip -f > /tmp/AnsiEsc.vba && vim --not-a-term -u NONE -c ":so /tmp/AnsiEsc.vba" -c q && rm /tmp/AnsiEsc.vba
curl -sSL https://github.com/wsdjeg/vim-fetch/releases/download/v3.0.0/vim-fetch-3.0.0.vmb  | sed -e s/^.Users.*chke.vim-fetch.// > /tmp/vim-fetch.vimball && vim --not-a-term -c "source %" -c q -- /tmp/vim-fetch.vimball # See https://github.com/wsdjeg/vim-fetch/issues/31
vim --not-a-term -u NONE -c "helptags ~/.vim/pack/tpope/start/fugitive/doc" -c "helptags ~/.vim/pack/dist/start/vim-airline/doc" -c q

curl -sSL http://raw.githubusercontent.com/avivey/profile/master/bin/rebase-table -o $HOME/bin/rebase-table && chmod a+x $HOME/bin/rebase-table
curl -sSL http://raw.githubusercontent.com/avivey/profile/master/bin/split-commit-to-files.sh -o $HOME/bin/split-commit-to-files.sh && chmod a+x $HOME/bin/split-commit-to-files.sh


command -v batcat && batcat cache --build || true

git config --global log.abbrevCommit 1 && \
git config --global format.pretty "format:%Cred%h%Creset %s %C(yellow)%d%Creset %Cgreen(%cr) %C(bold blue)<%aN>%Creset" && \
git config --global alias.lg "log --graph -10"  && \
git config --global core.editor vim
#git config --global format.pretty oneline

tmux source-file ~/.tmux.conf || true

source ~/.bash_aliases

chmod og-w ~   || true
chmod 700 ~/.ssh   || true
chmod 600 ~/.ssh/id_*   || true
chmod 644 ~/.ssh/authorized_keys ~/.ssh/known_hosts ~/.ssh/config ~/.ssh/id_*.pub   || true
