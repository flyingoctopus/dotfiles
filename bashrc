alias wget="curl -O"
alias rmdsstore="find . -name .DS_Store -exec rm {} \;"
alias rmlogfiles="find . -name '*.log' -exec rm {} \;"
alias vim="mvim -v"

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'

alias b="bundle"
alias bi="b install"
alias bu="b update"
alias bump="bu --source"
alias be="b exec"

# http://ryan.mcgeary.org/2011/02/09/vendor-everything-still-applies/
# alias bil="bi --local"
# alias bi="b install --path vendor"
# alias binit="bi && b package && echo 'vendor/ruby' >> .gitignore"

alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

alias ctags="`brew --prefix`/bin/ctags"

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

alias gist="gist -p -c"
alias json="python -m json.tool"
alias influxdb="influxdb -config=/usr/local/etc/influxdb.conf"

# ~/.bashrc
alias clean_queues="mongo augury_development --eval \"db.incoming.remove(); db.accepted.remove(); db.archived.remove()\""
alias clean_persistence="mongo persistence_development --eval \"db.orders.remove(); db.users.remove(); db.products.remove(); db.stock_transfers.remove()\""

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
