# display files by size
alias lah='ls -lhS'
#This will print out just the hidden files in the current working directory.
alias lh='ls -lisAd .[^.]*'
#This will print out the directory in a detailed format. It will also print out hidden files and folder as well.
alias la='ls -lisA'
# safe remove
alias rm='rm -iv'
# history search 
alias hs='history|grep -i' 
#he below one will extract tar files.
alias tgz='tar -xvfz'
# find files with pattern
alias ff='find . -type f -iname'
# find 10 days older files
alias ff10='find $HOME/trash -mtime +10 -type f -delete'
# clear screen
alias c='clear'
## Colorize the ls output ##
alias ls='ls --color=auto'
## Use a long listing format ##
alias ll='ls -la'
## Show hidden files ##
alias l.='ls -d .* --color=auto'
## recursive show
alias lr='ls -R'
## get rid of command not found ##
## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias mkdir='mkdir -pv'

# handy short cuts #
alias h='history'
alias j='jobs -l'

alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

function getmyfile() {
  ftp -n $HOST <<END_SCRIPT
  user ${USER} ${PASSWD}
  cd ~/the/file/path
  get $FILE
  quit
  END_SCRIPT
}

# To invoke on the command-line:
getmyfile

# Create variables
HOST=myhostname
PASSWD=mypass
FILE=myfile.out

function find_alias() {
  alias | grep "alias\s$1"
}
