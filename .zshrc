source ~/.zprezto/runcoms/zshrc

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir rbenv virtualenv vcs)
# cyan reads better
POWERLEVEL9K_DIR_BACKGROUND='cyan'
# enable the vcs segment in general
POWERLEVEL9K_SHOW_CHANGESET=true
# just show the 6 first characters of changeset
POWERLEVEL9K_CHANGESET_HASH_LENGTH=6

export TERM='xterm-256color'

# canonical way for emacs to start server mode
export ALTERNATE_EDITOR=""
export EDITOR="emacsclient -t"
export VISUAL="emacsclient -t"
if [ -n "$INSIDE_EMACS" ]; then
 chpwd() { print -P "\033AnSiTc %d" }
 print -P "\033AnSiTu %n"
 print -P "\033AnSiTc %d"
fi

alias ke="emacsclient -e '(kill-emacs)'"
source $(brew --prefix nvm)/nvm.sh

[ -f $HOME/.zshrc_tokens ] && source ~/.zshrc_tokens
