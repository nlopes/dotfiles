source ~/.zprezto/runcoms/zshrc

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir rbenv virtualenv vcs)
# cyan reads better
POWERLEVEL9K_DIR_BACKGROUND='cyan'
# enable the vcs segment in general
POWERLEVEL9K_SHOW_CHANGESET=true
# just show the 6 first characters of changeset
POWERLEVEL9K_CHANGESET_HASH_LENGTH=6

export TERM='xterm-256color'

export GOPATH=$HOME/Repos/Go
export PATH=$GOPATH/bin:/usr/local/opt/go/libexec/bin:/opt/local/bin:/opt/local/sbin:$PATH

export MANPATH=/opt/local/share/man:$MANPATH
# for ncurses from macports
export PKG_CONFIG_PATH=/opt/local/lib/pkgconfig/:$PKG_CONFIG_PATH

# docker
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=$HOME/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

# canonical way for emacs to start server mode
export ALTERNATE_EDITOR=""
export EDITOR="emacsclient -t"
export VISUAL="emacsclient -t"
if [ -n "$INSIDE_EMACS" ]; then
 chpwd() { print -P "\033AnSiTc %d" }
 print -P "\033AnSiTu %n"
 print -P "\033AnSiTc %d"
fi

[ -f $HOME/.zshrc_tokens ] && source ~/.zshrc_tokens
