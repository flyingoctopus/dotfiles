# Added `xcap` because `cap` is a reserved word. `cap` completion doesn't work.
# https://stackoverflow.com/questions/21353937/is-cap-a-reserved-word-zsh-completion?noredirect=1#comment32196838_21353937
# http://zsh.sourceforge.net/Doc/Release/Zsh-Modules.html#The-zsh_002fcap-Module

func xcap() {
  if [ -f Gemfile ]
  then
    bundle exec cap $*
  else
    cap $*
  fi
}
