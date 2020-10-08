```bash

curl -L https://codeload.github.com/eladeyal-intel/profile/tar.gz/master | tar xz --strip=2 -C ~

```


For CentOS 7:
```bash
sudo yum install http://mirror.ghettoforge.org/distributions/gf/el/7/plus/x86_64/tmux-2.4-2.gf.el7.x86_64.rpm vim
```


```bash
sudo timedatectl set-timezone Asia/Jerusalem
```



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
chmod 700 ~/.ssh
chmod 644 ~/.ssh/authorized_keys
chmod 644 ~/.ssh/known_hosts
chmod 644 ~/.ssh/config
chmod 600 ~/.ssh/id_*
chmod 644 ~/.ssh/id_*.pub
```
