alias rmdsstore="find . -name .DS_Store -exec rm {} \;"
alias rmlogfiles="find . -name '*.log' -exec rm {} \;"
alias vim="mvim -v"

# alias ..='cd ..'
# alias ...='cd ../../'
# alias ....='cd ../../../'
# alias .....='cd ../../../../'
# alias ......='cd ../../../../../'

alias ctags="`brew --prefix`/bin/ctags"

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

alias gist="gist -p -c"
alias json="python -m json.tool"
alias influxdb="influxdb -config=/usr/local/etc/influxdb.conf"

# ~/.bashrc
alias clean_queues="mongo augury_development --eval \"db.incoming.remove(); db.accepted.remove(); db.archived.remove()\""
alias clean_persistence="mongo persistence_development --eval \"db.orders.remove(); db.users.remove(); db.products.remove(); db.stock_transfers.remove()\""

alias mov2gif='rm -rf /tmp/mov2gif; mkdir /tmp/mov2gif; ffmpeg -i target.mov -vf scale=640:-1 -r 10 /tmp/mov2gif/ffout%3d.png; convert -delay 8 -loop 0 /tmp/mov2gif/ffout*.png ~/Desktop/target.gif'


# alias csshxspree="sshx -l core $(cap staging aws:servers|xargs)"
alias csshxspree='tmux-cssh -u core -ns $(be cap staging aws:servers)'


alias ta='tmux attach-session -t'
alias tl='tmux list-sessions'
alias tn='tmux new -s'
# tmux -S /tmp/pair
# chmod 777 /tmp/pair
# tmux -S /tmp/pair attach
# http://remotepairprogramming.com/tagged/tmux
# http://tmate.io/
# SSH Tunneling
# https://ngrok.com/
# record shell
# http://showterm.io/
#  $ showterm
# https://github.com/icholy/ttygif
#  $ ttyrec myrecording
#  $ ./ttygif myrecording -f
#  $ ./concat_osx.sh terminal.gif
# http://asciinema.org/
# http://www.mkyong.com/mac/how-to-find-large-file-size-on-mac-os-x3/
# Result – Find all files that have a size >= 100MB
# sudo find / -type f -size +100000k -exec ls -lh {} \; | awk '{ print $9 ": " $5 }'

alias gup='git up'
alias gl='git lg'

alias arspec='SPEC_ALL=true rspec'
alias afrspec='arspec --fail-fast'

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

func set_tmux_pane_title() {
  printf "\033]2;%s\033\\" "$*";
}

# added by travis gem
[ -f /Users/pablo/.travis/travis.sh ] && source /Users/pablo/.travis/travis.sh

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

alias emacs='/usr/local/Cellar/emacs/24.3/Emacs.app/Contents/MacOS/Emacs -nw'

function run() {
  # run N echo 'running'
  number=$1
  shift
  for i in `seq $number`; do
    $@
  done
}

function set_story(){
  echo "$1" > .pivotal_story_id
}

function git_clear(){
  git branch --merged master | grep -v master | xargs git branch -d
}
