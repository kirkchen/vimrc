# Bullet-train config
BULLETTRAIN_PROMPT_ORDER=(
  context
  dir
  git
  ruby
  nvm
  go
  time
)
BULLETTRAIN_NVM_SHOW=true
BULLETTRAIN_GO_SHOW=true
BULLETTRAIN_DIR_EXTENDED=2
BULLETTRAIN_GIT_PROMPT_CMD=\${\$(git_prompt_info)//\\//\ \ }

# Tmux
export EDITOR=vim

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="powerline"
ZSH_THEME="bullet-train"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git ruby rails golang zsh-autosuggestions extract z alias-tips)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
unalias gb
alias gbr="git branch"
alias gcoi="git checkout \$(git branch | cut -c 3- | pick)"
alias gmi="git merge \$(git branch | cut -c 3- | pick)"
alias gmdb="f() { if [ -z \$1 ]; then echo 'Please assign branch namespace.'; else git branch | awk -F. '/'"\$1"'/{print}' | xargs -I {} git branch -D {}; fi }; f"
alias mux="tmuxinator"
alias ctags="`brew --prefix`/bin/ctags"
alias ptt="ssh bbsu@ptt.cc"

# Homebrew file wrap
if [ -f $(brew --prefix)/etc/brew-wrap ];then
  source $(brew --prefix)/etc/brew-wrap
fi

# Visual Studio Code
function code {  
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        local argPath="$1"
        [[ $1 = /* ]] && argPath="$1" || argPath="$PWD/${1#./}"
        open -a "Visual Studio Code" "$argPath"
    fi
}

# Rvm
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Golang
export GOPATH=$HOME/.go
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin

# Gradle
export PATH=$PATH:~/Tools/gradle-2.13/bin

# Java
export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0_112`

# MySql
export PATH=$PATH:$(brew --prefix)/Cellar/mysql/5.7.16/bin

# Nvm
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"