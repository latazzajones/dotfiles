#rvm 
source /Users/leo/.rvm/scripts/rvm

# Git branch prompt for bash
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo '('$branch')'
  fi
}
#PS1="\[\033[0;34m\]\W\[\033[0;36m\]\$(parse_git_branch)\[\033[0m\]$ "

setopt prompt_subst
PROMPT='%F{green}%1/%F{magenta}$(git_branch_name):%F{black}'

# export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

alias ll="ls =lahG"

alias rp="rspec --require rspec/pride --format PrideFormatter"

######################
# Load secrets 
source ~/.keys

###########

export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"
