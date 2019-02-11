# dotfiles

## Steps

1. Clone this repo and `cd dotfiles`.
1. macOS only: uninstall shiftit, iterm, any other cask apps listed in the casks of macos.yml.
1. macOS only: sign into app store and update xcode. Then, open xcode and accept the license. Then run `xcode-select --install`. You'll need to do this for some inexplicable reason to use the C compiler. Remind me again why macOS is so developer-friendly?
1. Ensure your SSH key is loaded via `ssh-add -l`
1. `./run.sh`

## Mac post-install steps

1. Open flycut, shifit. Ensure they start on startup.
1. Open System Preferences > Keyboard > Shortcuts > Input Sources > untick "Select the previous input source" (or whatever is stealing ctrl+space from our tmux config). This start off unticked anyway, but will become ticked as soon as you add another input source (e.g. US layout)!
1. Speed up key repeat: Open System Preferences > Keyboard and set Key Repeat and Delay Until Repeat to max.
1. Make iTerm append Esc to Alt key. Open iTerm -> Preferences -> Profiles -> Keys and change the Left and Right Alt key settings from Normal to Esc+. This restores alt+f, alt+backspace etc.
1. `vim-update`. Not all plugins install unless the shell is interactive, for some reason.
1. Reload tmux and shell.
1. Install TPM plugins (in `tmux` press `ctrl+space` then `shift+i`).
1. Enable `bash-it` plugins and completions. This used to be automated, but they have since merged a change which means [bash-it cannot be run interactively](https://github.com/Bash-it/bash-it/pull/1325/commits/83c44fac646ef92e70694f1528d63a6f66b99cfd). Until we find another way around this, run:
```sh
   source ~/.bash_profile
   bash-it enable plugin base chruby-auto chruby fzf git
   bash-it enable completion bash-it git system
```

## Linux post-install steps

1. `vim-update`. Not all plugins install unless the shell is interactive, for some reason.
1. `bash-it enable completion git` and anything else you want. This should be automated but must be run in a shell that probably has bash-it loaded. You'll have to jump through a small hoop to make ansible do this, but it's totally possible. We're just lazy for now.
1. Reload tmux and shell.
1. Install TPM plugins (in `tmux` press `ctrl+space` then `shift+i`).

# Troubleshooting

* Can't find cask

	```
	failed: [localhost] (item=docker) => {"failed": true, "item": "docker", "msg": "Error: Cask 'gitx-rowanj' is unavailable: No Cask with this name exists."}
	```
	
	Similar errors to this probably means your homebrew has a cask that is no longer available. In this case, make sure you don't
	have gitx installed, and manually remove its cask folder from `/usr/local/Caskroom`.
