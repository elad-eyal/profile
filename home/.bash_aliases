# This is https://github.com/eladeyal-intel/profile/blob/master/home/.bash_aliases

alias less='less -R'
alias ip='ip --color'

 history() {
     if [[ "$*" == "" ]]; then
          command history 10
      else
        command history $*
    fi
}

journalctl() {
    command journalctl --no-pager $* | $HOME/bin/lnav -q
}

export BLOCKSIZE=h # human format for df

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac
if [ "$color_prompt" = yes ]; then
    PS1='\A $(code=${?##0};echo ${code:+\[\e[0;31m\] ${code}\\ })${debian_chroot:+($debian_chroot)}\[\e[32m\]\u@\h\[\e[00m\]\[\e[34;7m\]\w\[\e[27m\]\[\e[00m\] '
    HISTTIMEFORMAT=`echo -e "\033[0;34m%T \033[0m "`
else
    PS1='\A ${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    HISTTIMEFORMAT="%T "
fi
