alias virtualenv3='virtualenv -p /usr/local/bin/python3'

# Docker stuff
alias nuke-docker='docker rm $(docker ps -a -q) && docker rmi $(docker images -q)'
alias docker-machine-local='eval $(docker-machine env -u)'

# SSH
alias insecure-ssh='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
