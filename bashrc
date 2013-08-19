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
# alias bi="b install --path vendor"
alias bi="b install"
alias bil="bi --local"
alias bu="b update"
alias be="b exec"
alias binit="bi && b package && echo 'vendor/ruby' >> .gitignore"

alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# http://www.iterm2.com/#/section/faq
# Q: How do I change a tab's title?
function set_title_tab {
  echo -e "\033];$1\007"
}

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

