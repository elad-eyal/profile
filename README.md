```bash

curl -L https://codeload.github.com/eladeyal-intel/profile/tar.gz/master | tar xz --strip=2 -C ~

git clone --depth=1 https://tpope.io/vim/fugitive.git ~/.vim/pack/tpope/start/fugitive && rm -fr ~/.vim/pack/tpope/start/fugitive/.git
git clone --depth=1 https://github.com/vim-airline/vim-airline ~/.vim/pack/dist/start/vim-airline && rm -fr ~/.vim/pack/dist/start/vim-airline/.git
#git clone --depth=1 https://github.com/vim-airline/vim-airline-themes ~/.vim/pack/dist/start/vim-airline-themes && rm -fr ~/.vim/pack/dist/start/vim-airline-themes/.git
vim -u NONE -c "helptags ~/.vim/pack/tpope/start/fugitive/doc" -c "helptags ~/.vim/pack/dist/start/vim-airline/doc" -c q

tmux source-file ~/.tmux.conf

```


For CentOS 7:
```bash
sudo yum install http://mirror.ghettoforge.org/distributions/gf/el/7/plus/x86_64/tmux-2.4-2.gf.el7.x86_64.rpm vim
```


```bash
sudo timedatectl set-timezone Asia/Jerusalem
```

Today's font: `SauceCodePro Nerd Font` [link](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/SourceCodePro.zip)


Newer 'less' have mouse support
```
export SYSTEMD_LESS="FRSXM --mouse"
export LESS="FRSXM --mouse"
```


PuTTY colors
- http://ciembor.github.io/4bit/
- https://github.com/cowsay/PuTTY-Color-Schemes (https://putty.org.ru/themes/)
- https://putty.org.ru/themes/index.html
- https://gist.github.com/gdvalle/4187089


.ssh permissions
```
chmod og-w ~
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_*
chmod 644 ~/.ssh/authorized_keys ~/.ssh/known_hosts ~/.ssh/config ~/.ssh/id_*.pub
```
