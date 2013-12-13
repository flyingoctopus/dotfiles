alias wget="curl -O"
alias rmdsstore="find . -name .DS_Store -exec rm {} \;"
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
