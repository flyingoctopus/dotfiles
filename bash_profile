export PATH="/usr/local/git/bin:$PATH"
export PATH="/Users/pablo/.cabal/bin:$PATH"

export NODE_PATH="/usr/local/bin/node"

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_21.jdk/Contents/Home

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export EDITOR=vim
export TERM=screen-256color vi

# http://superuser.com/a/183980/226855
# http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

alias ctagsbundler="bundle show --paths | xargs ctags -R --exclude=.git --exclude=coverage --exclude=log && ctags -R --exclude=.git --exclude=coverage --exclude=log"
