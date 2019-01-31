# Git branch prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\033[0;34m\]\W\[\033[0;36m\]\$(parse_git_branch)\[\033[0m\]$ "

# export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

alias ll="ls =lahG"

alias rp="rspec --require rspec/pride --format PrideFormatter"

######################
# Load secrets 
source ~/.keys

###########

export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"

source ~/git-completion.bash
