if [ -f ~/.aliases ]; then
   source ~/.aliases
fi

function git_hooks_init() {
  if [ -d .git ]
  then
    ln -sf ~/.git_template/hooks .git/hooks

    # ~/.git_template/hooks/ctags will generate tags inside .git directory
    if [ -f tags ]
    then
      rm tags
    fi
  else
    echo '.git does not exist'
  fi
}

function git_hooks_remove() {
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


function git_clear(){
  git checkout master
  git branch --merged master | grep -v master | xargs git branch -d
}

function ce () {
  if [[ $# -eq 1 ]] ; then
    if [ -f ~/spree/env/"$1" ] ; then
      set -a
      . ~/spree/env/"$1"
      if [[ "$1" == "none" ]] ; then
        unset ce
      else
        export ce="$1"
      fi
      set +a
    fi
  else
    local -a envs
    envs=("${(f)$(ls ~/spree/env/)}")
    for x in $envs; do
      if [[ "$x" == "$ce" ]]; then
        echo "* $x"
      else
        echo "  $x"
      fi
    done
  fi
}


function ce_prompt () {
  if [[ -n "$ce" ]]
  then
    echo "($ce) "
  fi
}

function lmk() {
  # https://brunobuccolo.com/be-notified-of-slow-shell-commands/
  eval $*
  osascript -e "display notification \"Done: $*\" with title \"lmk\" sound name \"Basso\""
}

function dynscan() {
  dyn scan $(cf id dyn$1) | jq
}
