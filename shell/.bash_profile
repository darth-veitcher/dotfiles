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
