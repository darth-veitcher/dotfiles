alias virtualenv3='virtualenv -p /usr/local/bin/python3'

# Docker stuff
alias nuke-docker='docker rm $(docker ps -a -q) && docker rmi $(docker images -q)'
alias docker-machine-local='eval $(docker-machine env -u)'

# SSH
# insecure-ssh useful for local testing where you don't want to
# cache the remote key and then end up needing to remove from ~/.ssh/known_hosts
# (e.g. spinning up loads of VMs / Containers with same hostnames or IPs)
alias insecure-ssh='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
