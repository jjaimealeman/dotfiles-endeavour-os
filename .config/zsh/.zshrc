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
zsh_add_plugin "petervanderdoes/git-flow-completion"
# zsh_add_plugin "jeffreytse/zsh-vi-mode"

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
## export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --ignore-vcs -g '!{node_modules,.git,**/node_modules,**/.git}'"
export FZF_DEFAULT_COMMAND="rg --files --hidden -g '!{node_modules,node_modules/,.git}'"
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
# feh --bg-fill --randomize /home/jaime/Pictures/EOS/*
# feh --bg-fill --randomize /home/jaime/AllPictures/DatsunZ/*
feh --bg-fill --randomize /home/jaime/AllPictures/VIP/*
# feh --bg-scale --randomize /home/jaime/AllPictures/Instander/zar4fussion/*
# Sept 01 2022 // added to crontab -e

#########################################################################################

# Monday, March 21, 2022 @ 09:14:38 AM
# https://github.com/webfansplz/vite-plugin-vue-inspector
export VUE_EDITOR=nvim

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
# export PATH="$PATH:/home/$USER/.local/bin"


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

# October 16 2022
# Install Fly.ignore-vcsexport FLYCTL_INSTALL="/home/jaime/.fly"
  export FLYCTL_INSTALL="/home/jaime/.fly"
  export PATH="$FLYCTL_INSTALL/bin:$PATH"

# for use in neovim 'neoai' plugin, and chatgpt script.
  export OPENAI_API_KEY=******************



# CHAT_GPT_API_KEY='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'
# alias c='f() {
# curl --silent https://api.openai.com/v1/chat/completions \
#  -H "Authorization: Bearer $CHAT_GPT_API_KEY" \
#  -H "Content-Type: application/json" \
#  -d "{ \"model\": \"gpt-3.5-turbo\", \"messages\": [{\"role\": \"user\", \"content\": \"$@\"}]}" \
#  | jq -r ".choices[0].message.content" \
#  | tee ~/.config/zsh/chat/latest-prompt.md \
#  | glow \
# }; \
# printf "\n"; \
# printf "  +++++++++++++++++++++++++++\n"; \
# printf "  + ChatGPT is thinking ... +\n"; \
# printf "  +++++++++++++++++++++++++++\n"; \
# ;f'

# curl http://example.com & while ps -p $! > /dev/null; do for c in / - \\ \|; do echo -n "\r$c"; sleep 0.1; done; done

# alias cc='glow ~/.config/zsh/chat/latest-prompt.md | xclip -selection clipboard'
# alias cc='glow ~/.config/zsh/chat/latest-prompt.md | xclip -selection clipboard'
# alias cp='gtts-cli -f ~/.config/zsh/chat/latest-prompt.md -o ~/.config/zsh/chat/latest-prompt.mp3 && pw-play ~/.config/zsh/chat/latest-prompt.mp3'


# printf "Process running... \n" && while true; do for i in / - \\ \|; do printf "\r$i"; sleep 0.1; done; done \

# animation="-\|/"
# i=0
# while true; do
# printf "\rRunning process... %s" "${animation:$i:1}"
# i=$(( (i+1) % ${#animation} ))
# sleep 0.1




# Tue 02 May 2023
# add path for ~/chat.sh
export PATH="/home/jaime/www/_ghgists/chat.sh:$PATH"

#
# Thu 18 May 2023
# Turso
export PATH="/home/jaime/.turso:$PATH"


# Sun 28 May 2023
# set nvim to be the default editor for crontab
export VISUAL=nvim


# Sun 02 Jul 2023
# set default browser so it stops opening in regular Firefox or Brave
export BROWSER=/usr/bin/firefox-developer-edition

