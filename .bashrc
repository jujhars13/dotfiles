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

  #short path
  Time12h="\T"
  PathShort=\"\W\"
  PS1=\"\[\e\$cyan\]\$Time12h \$(whoami) \[\e\$cwdcolor\]\$PathShort\[\e\$gitcolor\]\\\$(parse_git_branch) \[\e\$inputcolor\]$ \"

# And some variables
EDITOR='vim'

