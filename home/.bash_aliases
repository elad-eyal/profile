# This is https://github.com/eladeyal-intel/profile/blob/master/home/.bash_aliases

alias less='less -R'
alias ip='ip --color'

cd() {
    # cd without parameters will also try $WORKSPACE_ROOT
    # for example, set this in VS Code settings.json
    # "terminal.integrated.env.linux": { "WORKSPACE_ROOT": "${workspaceRoot}" }
    if [[ -z "$*" && $(realpath $PWD) == $(realpath ~) ]]; then
        command cd "$WORKSPACE_ROOT"
    else
        command cd $*
    fi
}

journalctl() {
    command journalctl --no-pager $* | $HOME/bin/lnav -q
}

abbrev() { 
    a='[0-9a-fA-F]' b=$a$a c=$b$b; sed "s/$b-$c-$c-$c-$c$c$c//g"; 
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

myprep() {
    curl -sSL https://raw.githubusercontent.com/eladeyal-intel/profile/master/prep.sh? | bash
    source ~/.bash_aliases
}
