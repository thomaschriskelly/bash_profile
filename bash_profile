export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

alias ls='ls -lhAG'
alias find='find .'
alias grep='grep --color -I'
alias gitm='git checkout master'
alias gitp='git pull && git prune'
alias gits='git status && git branch'
alias gitb='git branch'

function curr_branch {
  echo `git symbolic-ref HEAD | cut -c12-`
}

function gitr {
  CURRENT_BRANCH=$(curr_branch)

  if [ "$CURRENT_BRANCH" == 'master' ]
  then
    echo "Already on master!!"
  else
    echo "Switching to master..." && gitm && echo "Syncing master..." && gitp && echo "Switching back to $CURRENT_BRANCH..." && git checkout $CURRENT_BRANCH && echo "Rebasing from master..." && git rebase master
  fi
}
