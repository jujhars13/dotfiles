# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

#define aliases here
alias q="exit"
alias git-merge-into="~/Dropbox/scripts/git-merge-into.sh"
alias pd="python /httpd/pigeon-droppings/pigeon_droppings/core.py -q"
alias ssh-buto="~/Dropbox/scripts/ssh-buto.sh"
alias ssh-butodev="~/Dropbox/scripts/ssh-buto.sh butodevelopment.pem"
alias inotify="~/Dropbox/scripts/inotify.sh"
alias ls="ls -alh --color=auto"
alias vi="vim"
alias grep='grep --color=auto'
#because ubuntu can be pants at times
alias node='nodejs'
alias docker='docker.io'

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/jujhar/.composer/vendor/bin/"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# simple calcultor from https://github.com/addyosmani/dotfiles/blob/master/.functions#L233
function calc() {
local result=""
result="$(printf "scale=10;$*\n" | bc --mathlib | tr -d '\\\n')"
#                       └─ default (when `--mathlib` is used) is 20
#
if [[ "$result" == *.* ]]; then
    # improve the output for decimal numbers
    printf "$result" |
    sed -e 's/^\./0./'        `# add "0" for cases like ".5"` \
        -e 's/^-\./-0./'      `# add "0" for cases like "-.5"`\
        -e 's/0*$//;s/\.$//'   # remove trailing zeros
else
    printf "$result"
fi
printf "\n"
}

# And some variables
EDITOR="vim"
export TERM=xterm-256color #otherwise vim colors don't work

# all my secret non public bits here
source ~/secret.sh
