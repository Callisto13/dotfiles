eval "$(fasd --init auto)"
eval "$(direnv hook bash)"

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

alias pbcopy="reattach-to-user-namespace pbcopy"
alias pbpaste="reattach-to-user-namespace pbpaste"
