export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/git/bin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/Users/pablo/bin"

export NODE_PATH="/usr/local/bin/node"
export ANDROID_HOME=/usr/local/opt/android-sdk

export AWS_REGION="us-east-1"

# http://stackoverflow.com/a/1348940/464685
export JAVA_HOME=$(/usr/libexec/java_home)

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export EDITOR=vim
export TERM=screen-256color vi

export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin

# brew info bzr
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

# http://superuser.com/a/183980/226855
# http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html
# if [ -f ~/.bashrc ]; then
   # source ~/.bashrc
# fi

eval $(ssh-agent) > /dev/null
# eval ssh-add "$HOME/.ssh/pablo@spreecommerce_id_rsa" > /dev/null
