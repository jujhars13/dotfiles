#some basic bash sugar
alias ls='ls -alh --color=auto'
alias vi='vim'
alias grep='grep --color=auto'

# Set prompt and window title
inputcolor='[0;37m'
cwdcolor='[1;32m'
gitcolor='[1;31m'
usercolor='[0;32m'
# Regular Colors
color='[0;94m'       # to make it different to your local bash prompt

function parse_git_branch {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Various variables you might want for your PS1 prompt instead
Time12h="\T"
Time12a="\@"
PathShort="\W"

#short path
PS1="\[\e$Yellow\]$Time12h $(whoami) \[\e$cwdcolor\]$PathShort\[\e$gitcolor\]\$(parse_git_branch) \[\e$inputcolor\]$ "

# And some variables
EDITOR='vim'

