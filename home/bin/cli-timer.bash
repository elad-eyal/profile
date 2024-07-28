# bash snippets which prints how long every
# command you executed took (if more than 5s)

start_cli_timer()
{
    if ! (( $cli_timer )); then
        export cli_timer=$SECONDS
    fi
}

end_cli_timer()
{
    elapsed=$((SECONDS - cli_timer))
    if ! (( $elapsed )); then
        :
    elif [ "$elapsed" -ge 120 ]; then
        echo -n "[ 🕒 $((elapsed / 60))min $((elapsed % 60))s ] $(date +%H:%M)"
    elif [ "$elapsed" -ge 5 ]; then
        echo -n "[ 🕒 $((elapsed))s ] "
    fi
    export cli_timer=0
}


trap start_cli_timer DEBUG
PROMPT_COMMAND=end_cli_timer


