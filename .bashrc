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
Black="[0;30m"        # Black
Red="[0;31m"          # Red
Green="[1;32m"        # Green
Yellow="[0;33m"       # Yellow
Blue="[0;34m"         # Blue
Purple="[0;35m"       # Purple
Cyan="[0;36m"         # Cyan
White="[0;37m"        # White

function parse_git_branch {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Various variables you might want for your PS1 prompt instead
Time12h="\T"
Time12a="\@"
PathShort="\W"

#short path
PS1="\[\e$Yellow\]$Time12h $(whoami)@\h \[\e$cwdcolor\]$PathShort\[\e$gitcolor\]\$(parse_git_branch) \[\e$inputcolor\]$ "

# And some variables
EDITOR='vim'

