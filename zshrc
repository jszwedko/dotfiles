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

source ~/.zshenv
source ~/.aliases

if [[ -f ~/.gpg-agent-info ]] ; then
  source ~/.gpg-agent-info
  export GPG_AGENT_INFO
fi

if test "$SSH_AUTH_SOCK" ; then
  ln -sf $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock
fi

if which hub > /dev/null ; then
  eval "$(hub alias -s)"
fi

# golang
source $HOME/.gvm/scripts/gvm

# Use zsh packaged completions, but our binary is named differently
compdef todo-txt=todo.sh

# added by travis gem
[ -f /home/jesse/.travis/travis.sh ] && source /home/jesse/.travis/travis.sh

export TODOTXT_SORT_COMMAND='env LC_COLLATE=C sort -k 2,2 -k 1,1n'

export NVM_DIR="/home/jesse/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

ix() {
            local opts
            local OPTIND
            [ -f "$HOME/.netrc" ] && opts='-n'
            while getopts ":hd:i:n:" x; do
                case $x in
                    h) echo "ix [-d ID] [-i ID] [-n N] [opts]"; return;;
                    d) $echo curl $opts -X DELETE ix.io/$OPTARG; return;;
                    i) opts="$opts -X PUT"; local id="$OPTARG";;
                    n) opts="$opts -F read:1=$OPTARG";;
                esac
            done
            shift $(($OPTIND - 1))
            [ -t 0 ] && {
                local filename="$1"
                shift
                [ "$filename" ] && {
                    curl $opts -F f:1=@"$filename" $* ix.io/$id
                    return
                }
                echo "^C to cancel, ^D to send."
            }
            curl $opts -F f:1='<-' $* ix.io/$id
        }

[[ -s "/home/jesse/.gvm/scripts/gvm" ]] && source "/home/jesse/.gvm/scripts/gvm"

[[ -s $HOME/.asdf/asdf.sh ]] && source $HOME/.asdf/asdf.sh

case "$OSTYPE" in
  darwin*)
    export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

    # brew
    PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
  ;;
  linux*)
    # ...
  ;;
esac
