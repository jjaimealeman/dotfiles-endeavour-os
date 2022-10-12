# The following lines were added by compinstall

zstyle ':completion:*' completer _list _oldlist _expand _complete _ignored _match _correct _approximate _prefix
zstyle ':completion:*' format '%d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' max-errors 10 numeric
zstyle :compinstall filename '/home/jaime/.zshrc'
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

# autoload -Uz compinit
autoload -Uz compinit && compinit -i
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
# HISTFILE=~/.histfile
HISTFILE=$ZDOTDIR/zsh-history
HISTSIZE=10000
SAVEHIST=10000
setopt autocd beep extendedglob nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install

source "$ZDOTDIR/zsh-functions"
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-prompt"


## PLUGINS!!
## AUTO PLUGIN MANAGER
## https://youtu.be/bTLYiNvRIVI?t=1320
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "zsh-users/zsh-completions"
zsh_add_plugin "agkozak/zsh-z"


# Wed Nov  3 05:38:04 AM MDT 2021
# PUT THIS HERE FOR DIFF-SO-FANCY
# PATH="$PATH:~/bin"
PATH="$PATH:$HOME/bin"

# Changed the location path for NPM global
# http://npm.github.io/installation-setup-docs/installing/a-note-on-permissions.html
export PATH=~/.npm-global/bin:$PATH

## When searching with fzf, don't scan .git or node_modules folders
## SOURCE https://dev.to/matrixersp/how-to-use-fzf-with-ripgrep-to-selectively-ignore-vcs-files-4e27
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
## export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --no-ignore-vcs"
## export FZF_DEFAULT_COMMAND="rg --files --hidden --follow -g !.git"
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --ignore-vcs -g '!{node_modules,.git,**/node_modules,**/.git}'"
export FZF_DEFAULT_OPTS="--height 96% --reverse --preview 'bat {}'"

# Thu Nov  4 10:52:10 AM MDT 2021
eval "$(starship init zsh)"
# eval "$(zoxide init bash)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Sat Nov 21 // installed LunarVim but it won't run unless I add this
# export PATH="~/.local/bin"
PATH="$PATH:$HOME/.local/bin"
# NEVERMIND, I aliased vim to sh nvim in zsh-aliases


# Open manpage in nvim
export MANPAGER='nvim +Man!'

# Fri Nov 26
# Completion for nb
# https://github.com/xwmx/nb/tree/master/etc
# fpath=(~/.config/zsh/completion $fpath)


#########################################################################################
# Is now called in /home/jaime/.config/bspwm/bspwmrc
#
# feh --bg-scale ~/Pictures/Wallpapers/endeavouros.jpeg
# feh --bg-fill --randomize ~/Pictures/Wallpapers/*
# feh --bg-fill --randomize /home/jaime/AllPictures/DatsunZ/*
feh --bg-fill --randomize /home/jaime/Pictures/EOS/*
# Sept 01 2022 // added to crontab -e

#########################################################################################

# Monday, March 21, 2022 @ 09:14:38 AM
# https://github.com/webfansplz/vite-plugin-vue-inspector
export VUE_EDITOR=code

# Monday, March 21
# eval $(thefuck --alias)

# Wednesday March 23, 2022
# Ran yarn update.
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Saturday, April 2, 2022 @ 04:19:22 PM
# SyncThing doesn't auto start, so imma fix that.
# syncthing &&

# Tuesday, May 3, 2022 @ 10:03:17 AM
# adding path to funsplash
# export PATH="/home/jaime/_ghgists/funsplash.sh:$PATH"
export PATH="/home/jaime/www/_ghgists/funsplash.sh:$PATH"

# export GOPATH=/home/jaime/Downloads/go
# export GOBIN=/home/jaime/Downloads/go/bin


## 2022-08-27 // installing LunarVim but path is not found. this should fix it.
export PATH="$PATH:/home/$USER/.local/bin"


# pnpm
export PNPM_HOME="/home/jaime/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# Monday, September 5, 2022 @ 10:42:23 PM
# having trouble still getting greenclip to autostart
# let's see if this works
# systemctl start --user greenclip

# IT'S NOT RECOMMENDED!

# systemctl start --user greenclip.service
# systemctl enable --user greenclip.service
# systemctl start --user greenclip
# systemctl enable --user greenclip
# systemctl enable --user --now greenclip.service


# Thursday, September 8, 2022 @ 10:17:48 PM
# VS Code shell integration is not working.
#https://code.visualstudio.com/docs/terminal/shell-integration
# [[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"

# Sept 21 2022
# installed some cargo apps
# https://betterprogramming.pub/5-cli-tools-made-with-rust-to-improve-already-popular-tools-506af07b6d54
PATH="$PATH:$HOME/.cargo/bin"

