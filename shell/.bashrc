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