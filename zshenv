export SHELL=/bin/zsh

export EDITOR=vim

export PATH="$HOME/bin:$PATH"

# ruby
export PATH="$PATH:$HOME/.rbenv/bin"
export PATH="$HOME/.rbenv/shims:$PATH"

# javascript
export PATH="$PATH:/usr/local/share/npm/bin"

# haskell
export PATH="$PATH:$HOME/.cabal/bin"

# go
export PATH="$HOME/go/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:/usr/local/go/bin"

# rust
[[ -s $HOME/.cargo/env ]] && source $HOME/.cargo/env

# aws-vault
export AWS_VAULT_BACKEND=pass
export AWS_VAULT_PASS_PREFIX=aws-vault

# tools
export PATH="/usr/local/heroku/bin:$PATH"
