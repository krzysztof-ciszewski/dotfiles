#!/usr/bin/env zsh
## vim:syntax=zsh
## vim:filetype=zsh
source ~/.profile
fpath=($ZDOTDIR/completions $fpath)

unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu         # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end
setopt hist_ignore_all_dups
#setopt correct_all
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data
setopt GLOB_COMPLETE
setopt NO_CASE_GLOB

source "$ZDOTDIR/.zplugin/bin/zplugin.zsh"

autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zmodload zsh/complist
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
    compinit;
else
    compinit -C;
fi;
_comp_options+=(globdots)

compdef _pash pash-git

bindkey '^U' backward-kill-line
bindkey -v '^?' backward-delete-char
bindkey '^[[1;5C' forward-word    # [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5D' backward-word   # [Ctrl-LeftArrow] - move backward one word
bindkey "^[[P" delete-char
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line
bindkey '^R' history-incremental-search-backward
bindkey '^K' kill-line

source $ZDOTDIR/.aliases

fasd_cache="${ZSH_CACHE_DIR}/fasd-init-cache"
if [ ! -s "$fasd_cache" ]; then
    fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

# Pugins
PURE_PROMPT_SYMBOL=">"
PURE_PROMPT_VICMD_SYMBOL="<"
zplugin ice pick"async.zsh" src"pure.zsh"
zplugin light sindresorhus/pure
zplugin light zdharma/fast-syntax-highlighting
zplugin load MichaelAquilina/zsh-you-should-use
ZSH_AUTOSUGGEST_STRATEGY="history"
zplugin load zsh-users/zsh-autosuggestions
bindkey '^ ' autosuggest-accept
zplugin load zsh-users/zsh-completions

eval `ssh-agent -s` >/dev/null  2>&1
ssh-add >/dev/null 2>&1
