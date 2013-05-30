alias wget="curl -O"
alias rmdsstore="find . -name .DS_Store -exec rm {} \;"
alias vim="mvim -v"

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'

# http://ryan.mcgeary.org/2011/02/09/vendor-everything-still-applies/
alias b="bundle"
alias bi="b install --path vendor"
alias bil="bi --local"
alias bu="b update"
alias be="b exec"
alias binit="bi && b package && echo 'vendor/ruby' >> .gitignore"

alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

export PATH="/usr/local/git/bin:$PATH"

export NODE_PATH="/usr/local/bin/node"

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_21.jdk/Contents/Home

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export EDITOR=vim
export TERM=screen-256color vi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# http://www.iterm2.com/#/section/faq
# Q: How do I change a tab's title?
function set_title_tab {
  echo -e "\033];$1\007"
}
