#!/bin/bash

alias tattach='tmux attach -t m-rcd'
alias nmux='tmux new-session -s m-rcd'

function lsgrok {
url=$(curl http://localhost:4040/api/tunnels 2>/dev/null | jq -r .tunnels[0].public_url)

if [ "$url" == "" ] || [ "$url" == "null" ]; then
  echo No tunnels running?
else
  host=$(echo "$url" | cut -d / -f 3 | cut -d : -f 1)
  port=$(echo "$url" | cut -d / -f 3 | cut -d : -f 2)

  echo ssh -p "$port" $(whoami)@"$host"
fi
}

function fix-ssh {
  eval "$(ssh-agent -s)"
}


function ginit {
  tmux new-session -s ngrok -d
  tmux send -t ngrok "ngrok tcp --region=eu 22" ENTER
}

