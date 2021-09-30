# This is https://github.com/eladeyal-intel/profile/blob/master/home/.bash_aliases

# Disable CONTROL-S CONTROL-Q for flow control
stty -ixon

export MANPATH=$HOME/bin:

export VISUAL=vim

export PAGER=less
export LESS=-RF
less --help | grep -q mouse && export LESS="$LESS --mouse"
alias ip='ip --color'
[ "$(command -v cf.exe)" ] && alias cf=cf.exe

[ ! "$(command -v bat)" ] && [ "$(command -v batcat)" ] && alias bat=batcat # https://github.com/sharkdp/bat

if command -v realpath > /dev/null ; then
    cd() {
        # cd without parameters will also try $WORKSPACE_ROOT
        # for example, set this in VS Code settings.json
        # "terminal.integrated.env.linux": { "WORKSPACE_ROOT": "${workspaceRoot}" }
        if [[ -z "$*" && $(realpath $PWD) == $(realpath ~) ]]; then
            command cd "$WORKSPACE_ROOT"
        else
            command cd "$@"
        fi
    }
fi

if [[ -x $HOME/bin/lnav ]]; then
    journalctl() {
        command journalctl --no-pager "$@" | $HOME/bin/lnav -q
    }
elif command -v lnav > /dev/null; then
    journalctl() {
        command journalctl --no-pager "$@" | command lnav -q
    }
fi

abbrev() { 
    a='[0-9a-fA-F]' b=$a$a c=$b$b; sed "s/$b-$c-$c-$c-$c$c$c//g"; 
}

export BLOCKSIZE=h # human format for df

case "$TERM" in
    xterm-color|*-256color|screen) color_prompt=yes;;
esac
if [ "$color_prompt" = yes ]; then
    PS1='\A $(code=${?##0};echo ${code:+\[\e[0;31m\] ${code}\\ })${debian_chroot:+($debian_chroot)}\[\e[32m\]\u@\h\[\e[00m\]\[\e[34;7m\]\w\[\e[27m\]\[\e[00m\] '
    HISTTIMEFORMAT=`echo -e "\033[0;34m%T \033[0m "`
else
    PS1='\A ${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    HISTTIMEFORMAT="%T "
fi

dcl() {
    docker-compose logs --tail=1000 --follow | lnav -q -c ':goto -5'
}

myprep() {
    curl -sSL https://raw.githubusercontent.com/eladeyal-intel/profile/master/prep.sh? | bash
    source ~/.bash_aliases
}

__24bitcolor() {
    curl -s https://raw.githubusercontent.com/JohnMorales/dotfiles/master/colors/24-bit-color.sh | bash
}

# Inside VS CODE, prefer ack which has clickable links to line.
if [ "$TERM_PROGRAM" == "vscode" ]; then
    ack() {
        if [[ -z "$*" ]]; then
            command ack
        else
            command ack --nogroup "$@"
        fi
    }
fi
