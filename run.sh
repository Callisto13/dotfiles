#!/bin/bash

set -euo pipefail

log() {
  echo
  echo "----------------------------------------------------------------------"
  echo "$1"
  echo "----------------------------------------------------------------------"
  echo
}

install_ansible_mac() {
  if ! command -v ansible-playbook > /dev/null 2>&1 ; then
    log "ansible-playbook not found on \$PATH, installing"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install ansible
  fi
}

install_ansible_linux() {
	sudo apt-get update
	sudo apt install ansible -y
	# sudo apt-get install -y python python3.8 libssl-dev
	# curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	# python get-pip.py --user
	# pip install --user ansible
	# rm get-pip.py
}

run_it() {
  log "Configuring machine for $tag"
  (
    cd "$(dirname "$0")"
    cmd="ansible-playbook -i localhost, --tags $tag --con local playbook.yml"
    $cmd
  )

  #shellcheck disable=SC1091
  source "$HOME/.bashrc"

  log "Don't forget to read the post install steps for your section in README.md."
}

user="$*"
case $user in
  m)
    tag="mac"
    install_ansible_mac
    ;;
  l)
    tag="linux"
    install_ansible_linux
    ;;
  *)
    log "Usage: ./run.sh <m|l>"
    exit 0
    ;;
esac

run_it

