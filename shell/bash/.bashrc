# https://hackercodex.com/guide/python-development-environment-on-mac-osx/
# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true

# allow a "global" pip override
gpip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}
gpip3(){
   PIP_REQUIRE_VIRTUALENV="" pip3 "$@"
}

# stick some aliases in
# https://askubuntu.com/a/17537
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

# remove ssh host key
forget_host_key(){
   echo Will remove $@ from ssh known_hosts
   FORGET='^.*'"$@"'.*$'
   echo regex set to $FORGET
   sed -i.bak s'/'$FORGET'//' ~/.ssh/known_hosts
}

# create a react-native project
create_expo(){
  npx expo-cli init -t blank --yarn --name "$@" "$@"
  cd "$@"
  expo-cli install react-navigation react-native-gesture-handler react-native-reanimated react-navigation-stack axios react-native-json-tree
}

# Set Docker host for TLS remote daemon
# Assumes you've saved the ca.pem, cert.pem, and key.pem into ~/.docker/$HOST
# https://gist.github.com/darth-veitcher/0b2e6b64bc4ba908a307ece13e3c6bb4
docker_host(){
  echo "Setting host details to "$@
  ROOT=$HOME"/.docker/$@"
  if [ -d $ROOT ]; then
    echo "Using certificates from "$ROOT
    export DOCKER_TLS_VERIFY=1
    export DOCKER_HOST=$@:2376
    export DOCKER_CERT_PATH=$ROOT
  fi
}