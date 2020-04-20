alias virtualenv3='virtualenv -p /usr/local/bin/python3'

# Docker stuff
alias nuke-docker='docker rm $(docker ps -a -q) && docker rmi $(docker images -q) && docker system prune -a -f'
alias docker-machine-local='eval $(docker-machine env -u)'

# SSH
# insecure-ssh useful for local testing where you don't want to
# cache the remote key and then end up needing to remove from ~/.ssh/known_hosts
# (e.g. spinning up loads of VMs / Containers with same hostnames or IPs)
alias insecure-ssh='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'

# Cookie-cutter
alias create-project='cookiecutter git@gitlab.com:saracen9/cookiecutter-pygitlab.git'

# SQLite DB Browser
# Install using brew https://sqlitebrowser.org
alias sqlite-browser='/Applications/DB\ Browser\ for\ SQLite.app/Contents/MacOS/DB\ Browser\ for\ SQLite'
