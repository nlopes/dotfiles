# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export WORKON_HOME="~/Projects/Environments"
source /usr/local/share/python/virtualenvwrapper.sh
