## Everything related to environment variable goes here.

export HISTTIMEFORMAT="%F %T "

export EDITOR=nvim

export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

export PATH=$HOME/bin:$PATH

export PATH=$PATH:/usr/local/go/bin

# export GITHUB_TOKEN=$(lpass show 73408709150794196 --notes | tr -d '\n')

export LPASS_DISABLE_PINENTRY=1

export LPASS_AGENT_TIMEOUT=14400

# Get rid of useless bash_it clock emoji
export THEME_SHOW_CLOCK_CHAR=false

# Get rid of the annoying bash replacement message in MacOS Catalina
export BASH_SILENCE_DEPRECATION_WARNING=1
