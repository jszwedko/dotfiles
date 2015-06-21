fpath=(~/.zsh/completion $fpath)

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git)

source $ZSH/oh-my-zsh.sh

if [ -e $HOME/.rbenv ]; then
  eval "$(rbenv init -)"
fi

if [ -e $HOME/.goenv ]; then
  eval "$(goenv init -)"
fi

source ~/.zshenv
source ~/.aliases

if [[ -f ~/.gpg-agent-info ]] ; then
  source ~/.gpg-agent-info
  export GPG_AGENT_INFO
  export SSH_AUTH_SOCK
fi

if [[ -f ~/.ssh/agent.out ]] ; then
  source ~/.ssh/agent.out
fi

if which hub > /dev/null ; then
  eval "$(hub alias -s)"
fi

# added by travis gem
[ -f /home/jesse/.travis/travis.sh ] && source /home/jesse/.travis/travis.sh
