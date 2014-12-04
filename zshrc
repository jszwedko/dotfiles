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
plugins=(git)

source $ZSH/oh-my-zsh.sh

eval "$(rbenv init -)"
eval "$(goenv init -)"

if [[ -f ~/.gpg-agent-info ]] ; then
  source ~/.gpg-agent-info
fi
if gpg-agent 2>&1 | grep -q 'no gpg-agent running' ; then
  gpg-agent -q --daemon --enable-ssh-support \
    --write-env-file "${HOME}/.gpg-agent-info" 2>&1 > /dev/null
  source ~/.gpg-agent-info
fi
export GPG_AGENT_INFO
export SSH_AUTH_SOCK

source ~/.zshenv
source ~/.aliases

if [[ -f ~/.ssh/agent.out ]] ; then
  source ~/.ssh/agent.out
fi

if ssh-add -l 2>&1 | grep -q 'Could not open' ; then
  ssh-agent > ~/.ssh/agent.out

  source ~/.ssh/agent.out
fi

eval "$(hub alias -s)"
