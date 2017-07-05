# if [ -f ~/.aliases ]; then
   # source ~/.aliases
# fi

function ctagsupdate {
	ctags -eR -h=rb.rake --languages=Ruby \
  --exclude=.git \
  --exclude=node_modules \
  --exclude=spec \
  --exclude=node-acceptance \
  --exclude=public \
  --exclude=vendor \
  --exclude=stylesheets \
  --exclude=javascripts \
  --exclude=assets \
  --exclude=images \
  --exclude=tmp \
  --exclude=cache \
  --exclude=themes \
  --exclude=app/views \
  --exclude=app/assets \
  --exclude=.html,.erb,.js,.json,.yml,.scss,.css,.sass,.liquid,.coffee \
  --exclude=.java \
  --exclude=.jpg,.gif,.png,jpeg,.svg -f
}

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

function fd() {
	(cd ~/spree/spreeworks/ops && bundle exec bin/fd $*)
}

function ce_prompt () {
  if [[ -n "$AWS_VAULT" ]]
  then
    echo "($AWS_VAULT) "
  fi
}

function lmk() {
  # https://brunobuccolo.com/be-notified-of-slow-shell-commands/
  eval $*
  osascript -e "display notification \"Done: $*\" with title \"lmk\" sound name \"Basso\""
}
