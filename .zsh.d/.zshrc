# Path to your oh-my-zsh configuration.
ZSH=$HOME/dotfiles/.zsh.d/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="random"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git github)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

chpwd() { ls }

# history
HISTSIZE=100000
SAVEHIST=1000000

# alias
alias v='vim'
alias gdf='git diff'
alias usecmd="history | awk '{print $2}' | sort | uniq -c | sort -rn | head -n 20"
alias memo="vim $HOME/memo/weekly/`date +%Y-%U`.txt"
alias gicl="git branch --merged | grep -v '*' | grep -v 'master' | grep -v 'main' | grep -v 'develop' | xargs -I {} git branch -d {}"
alias tailf="tail -f"

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# jump
eval "$(jump shell --bind=j)"
