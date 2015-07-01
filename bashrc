if [ -f ~/.aliases ]; then
   source ~/.aliases
fi

func git_hooks_init() {
  if [ -d .git ]
  then
    ln -s ~/.git_template/hooks/* .git/hooks

    # ~/.git_template/hooks/ctags will generate tags inside .git directory
    if [ -f tags ]
    then
      rm tags
    fi
  else
    echo '.git does not exist'
  fi
}

func git_hooks_remove() {
  if [ -d .git ]
  then
      rm .git/hooks/*
  else
      echo '.git does not exist'
  fi
}

# git log with per-commit cmd-clickable GitHub URLs (iTerm)
# https://github.com/addyosmani/dotfiles/blob/master/.functions
function gf() {
  local remote="$(git remote -v | awk '/^origin.*\(push\)$/ {print $2}')"
  if [[ -n "$remote" ]]
  then
    return
  fi
  local user_repo="$(echo "$remote" | perl -pe 's/.*://;s/\.git$//')"
  git log $* --name-status --color | awk "$(cat <<AWK
    /^.*commit [0-9a-f]{40}/ {sha=substr(\$2,1,7)}
    /^[MA]\t/ {printf "%s\thttps://github.com/$user_repo/blob/%s/%s\n", \$1, sha, \$2; next}
    /.*/ {print \$0}
AWK
  )" | less -F
}

function run() {
  # run N echo 'running'
  number=$1
  shift
  for i in `seq $number`; do
    $@
  done
}

function git_clear(){
  git branch --merged master | grep -v master | xargs git branch -d
}
