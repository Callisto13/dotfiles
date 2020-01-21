## First-time usage

### All
1. Clone this repo.
1. Ensure your SSH key is loaded via `ssh-add -l`

### Mac
1. Uninstall Shiftit, iTerm, any other cask apps listed in the casks of `common.yml` and `callisto.yml` OR `m-rcd.yml`.
1. Sign into app store and update xcode. Then, open xcode and accept the license. Then run `xcode-select --install`. You'll need to do this for some inexplicable reason to use the C compiler. Remind me again why macOS is so developer-friendly?

## Usage
1. `./run.sh <m|c|l>`

## Currently-required manual steps

1. If you do not have Admin permissions, ensure `brew` has been installed first by an administrator.

## callisto post-install

1. Open Flycut and Shiftit. Ensure they start on startup.
1. Open Keyboard preferences > Shortcuts > Input Sources > untick "Select the previous input source" (or whatever is stealing ctrl+space from our tmux config). This starts off unticked anyway, but will become ticked as soon as you add another input source (e.g. US layout)!
1. Open Keyboard preferences > Shortcuts > Mission Control > untick all Mission Control things using `^`
1. Make iTerm append Esc to Alt key. Open iTerm -> Preferences -> Profiles -> Keys and change the Left and Right Alt key settings from Normal to Esc+. This restores `alt+f`, `alt+backspace` etc.
1. Hide the dock.
1. Reload tmux and shell.
1. Install TPM plugins (in tmux press prefix+I).
1. `ruby-install` yourself a Ruby version.
1. Enable `bash-it` plugins and completions. This used to be automated, but they have since merged a change which means [bash-it cannot be run interactively](https://github.com/Bash-it/bash-it/pull/1325/commits/83c44fac646ef92e70694f1528d63a6f66b99cfd). Until we find another way around this, run:
   ```sh
   source ~/.bash_profile
   bash-it enable plugin base chruby-auto chruby fzf git kubectl
   bash-it enable completion bash-it git system kubectl
   bash-it enable alias kubectl
   ```
1. Do the things in common mac post-install below.

## m-rcd post-install

1. Download Flycut and Shiftit from a non-Mac store. Expand the zip, and drag the app into Applications.
1. Open Flycut and Shiftit. Ensure they start on startup.
1. Do the things in common mac post-install below.

## Common mac post-install

1. Speed up key repeat. (System Preferences > Keyboard > set "Delay Until Repeat" to Short)
1. Turn on Tap to click. (System Preferences > Trackpad > Point & Click > set "Tap to click")
1. Make sure you set a Nerd Font as your non-ascii font in iTerm -> Preferences -> Profiles -> Text -> Non-ASCII Font (Inconsolata Mono Nerd Font comes with dotfiles)
1. Open vim and run `:PlugInstall`. Not all plugins install unless the shell is interactive, for some reason.

## Linux post-install

## Adding configuration

All config files are symlinked to this repo. To add new things, eg. a new alias, edit the corresponding file in this repo
and commit the changes.

## TODO

1. linux setup
1. git autocomplete in bash
1. Unify tmux configs? It looks like that TPM plugin is cross-platform.
1. automate installation of Ruby in `callisto.yml` based on `.ruby-version`.
1. macOS key repeat (this is a bit of a pain to automate as valid defaults vales changed between el capitan and sierra. Might not even be worth automating)

# Troubleshooting

* Can't find cask

	```
	failed: [localhost] (item=docker) => {"failed": true, "item": "docker", "msg": "Error: Cask 'gitx-rowanj' is unavailable: No Cask with this name exists."}
	```

	Similar errors to this probably means your homebrew has a cask that is no longer available. In this case, make sure you don't
	have gitx installed, and manually remove its cask folder from `/usr/local/Caskroom`.

* Need admin permissions

   Try and find another way to install, add instructions to either playbook or post-install.

* Vim warnings.

   Brew uninstall then reinstall `python`, `python3`, `pip`, `pip3`. Re-run `vim-update`.
