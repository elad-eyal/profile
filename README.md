```bash

curl -sSL https://raw.githubusercontent.com/eladeyal-intel/profile/master/prep.sh? | bash

```


For CentOS 7:
```bash
sudo yum install http://galaxy4.net/repo/galaxy4-release-7-current.noarch.rpm && sudo yum install tmux vim
```


```bash
sudo timedatectl set-timezone Asia/Jerusalem
```

Yesterdays's font: `LigaSauceCodePro NF` [link](https://github.com/Bo-Fone/Liga-Sauce-Code-Pro-Nerd-Font/tree/master/OTF/Liga-Sauce-Code-Pro-Nerd-Font-Complete-Windows-Compatible)

Today's font: `FiraCode Nerd Font` [link](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip) weight=Light


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
