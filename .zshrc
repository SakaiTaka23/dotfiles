### split zsh
ZSHHOME="${HOME}/dotfiles/.zsh.d"

if [ -d $ZSHHOME -a -r $ZSHHOME -a \
    -x $ZSHHOME ]; then

    zinit_zsh="$ZSHHOME/zinit.zsh"
    if [ -f "$zinit_zsh" -o -h "$zinit_zsh" ] && [ -r "$zinit_zsh" ]; then
        . "$zinit_zsh"
    fi

    for i in $ZSHHOME/*; do
        if [ "$i" != "$zinit_zsh" ]; then
            [[ ${i##*/} = *.zsh ]] && [ \( -f $i -o -h $i \) -a -r $i ] && . $i
        fi
    done
fi

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
    eval "$(oh-my-posh init zsh --config ~/.omp.toml)"
fi
