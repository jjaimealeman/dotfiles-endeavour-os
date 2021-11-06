# The following lines were added by compinstall

zstyle ':completion:*' completer _list _oldlist _expand _complete _ignored _match _correct _approximate _prefix
zstyle ':completion:*' format '%d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' max-errors 10 numeric
zstyle :compinstall filename '/home/jaime/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep extendedglob nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install
#
#
# Thu Nov  4 09:15:28 PM MDT 2021
eval "$(starship init zsh)"

alias vi="nvim"
alias vim="nvim"
alias ll="exa -la -F --icons --git --group-directories-first"
alias ld="exa -lD --icons --sort name --git"
alias neo="clear && neofetch"
alias neot="clear && neofetch && tuptime"
alias hist="history | grep --color"
alias count="find . -type f | wc -l"
alias trash="mv --force -t ~/.local/share/Trash "
# CD into top lever of git project.
alias cdg="cd `git rev-parse --show-toplevel`"

alias myip="curl http://ipecho.net/plain; echo"

alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# Wed Nov  3 05:38:04 AM MDT 2021
# PUT THIS HERE FOR DIFF-SO-FANCY
# PATH="$PATH:~/bin"
PATH="$PATH:$HOME/bin"


# Changed the location path for NPM global
# http://npm.github.io/installation-setup-docs/installing/a-note-on-permissions.html
export PATH=~/.npm-global/bin:$PATH


# Thu Nov  4 10:52:10 AM MDT 2021
eval "$(zoxide init bash)"



