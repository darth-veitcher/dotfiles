# Set architecture flags
export ARCHFLAGS="-arch x86_64"
# Ensure user-installed binaries take precedence
export PATH=/usr/local/bin:$PATH
# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

# https://hackercodex.com/guide/mac-osx-mavericks-10.9-configuration/
# Set architecture flags
export ARCHFLAGS="-arch x86_64"
# Ensure user-installed binaries take precedence
export PATH=/usr/local/bin:$PATH
# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

# Bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
fi

# NVM
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

export PATH=$PATH:/Users/jamesveitch/bin

# Docker cleanup
# https://stackoverflow.com/a/32723127/322358
dcleanup(){
    docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
    docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
    docker rmi -f $(docker images -qf dangling=true 2>/dev/null) 2>/dev/null
    docker rmi -f $(docker images -a | grep "^<none>" | awk '{print $3}') 2>/dev/null
}

# Fix docker issue on Mac around /etc/localtime
# https://github.com/docker/for-mac/issues/2396#issuecomment-444903734
# https://github.com/docker/for-mac/issues/2396#issuecomment-446515510
export ETC_LOCALTIME=$(readlink /etc/localtime)
export LOCALTZ=$(echo $(readlink /etc/localtime) | awk -F'\/' '{print $6"/"$7}')

# pyenv
# https://medium.com/hackernoon/reaching-python-development-nirvana-bb5692adf30c
eval "$(pyenv init -)"

# import access key for gitlab
test -f ~/.gitlab && source ~/.gitlab

# nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
export PATH="/Users/jamesveitch/.nodenv/shims:${PATH}"
export NODENV_SHELL=bash
source '/Users/jamesveitch/.nodenv/libexec/../completions/nodenv.bash'
command nodenv rehash 2>/dev/null
nodenv() {
  local command
  command="${1:-}"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "$(nodenv "sh-$command" "$@")";;
  *)
    command nodenv "$command" "$@";;
  esac
}

# ANDROID_HOME for ReactNative
# https://facebook.github.io/react-native/docs/getting-started.html
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
