## Everything related to user profile goes here.

# Alias
alias vim='GOOS=linux CGO_ENABLED=0 nvim'
alias ctr-dev="sudo ctr --address=/run/containerd-dev/containerd.sock"
unalias k
alias k='kubectl'
alias debugpod='kubectl run -i --tty --rm debug --image=busybox --restart=Never -- /bin/bash'
alias kgetall='kubectl get $(kubectl api-resources --verbs=list -o name | paste -sd, -) --ignore-not-found --show-kind -o wide $NS'

function decode_kubernetes_secret {
  kubectl get secret "$@" -o json | jq '.data | map_values(@base64d)'
}
alias ds="decode_kubernetes_secret"
