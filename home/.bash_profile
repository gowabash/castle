export CLICOLOR=1
#export LSCOLORS=ExFxCxDxBxegedabagacad
export LSCOLORS=exfxcxdxbxegedabagacad
export PATH=/usr/local/bin:${PATH}:/opt/local/sbin:/mongo/mongodb/bin:/usr/local/sbin:/usr/local/share/npm/bin
export MANPATH=/opt/local/share/man:$MANPATH
export IGO_DEVELOPER=matt
export EDITOR="mvim"
export GIT_MERGE_AUTOEDIT=no
export CLASSPATH=.:~/jars

alias pg-s0="psql -h localhost -p 5500 -U igo ck"
alias pg-stage="psql -h localhost -p 5400 -U igo ck"

alias ks='killall ssh'

alias wget="curl -O"

alias vi='mvim -v'
alias fig=docker-compose

if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi

alias lm="mongo localhost:27100/admin -u developers -p Jtpy3FDvfCBA4fh --shell ~/.mongo/set_secondary.js"

source $HOME/.homesick/repos/gowabash/castle/home/git_complete

export PATH=/opt/local/bin:/opt/local/sbin:~/bin:$PATH

#Amazon stuff
#MASTER
export EC2_PRIVATE_KEY=~/ec2/pk-ec2-mgmt.pem
export EC2_CERT=~/ec2/cert-ec2-mgmt.pem

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOR="\[\033[0m\]"
WHITE="\[\033[1;37m\]"
CYAN="\[\033[0;36m\]"
GRAY="\[\033[0;37m\]"
BLUE="\[\033[0;34m\]"

PS1="$GREEN\u@\h$YELLOW:\W$RED\$(parse_git_branch)$NO_COLOR\$ "

complete -o default -o nospace -W "$(/usr/bin/env ruby -ne 'puts $_.split(/[,\s]+/)[1..-1].reject{|host| host.match(/\*|\?/)} if $_.match(/^\s*Host\s+/);' < $HOME/.ssh/config)" scp sftp ssh

#export DOCKER_HOST=tcp://127.0.0.1:2376
#export COMPOSE_PROJECT_NAME=cobaltstarfish
#export DOCKER_CERT_PATH=/Users/mbrown/.boot2docker/certs/boot2docker-vm
#export DOCKER_TLS_VERIFY=1

function setjdk() {
if [ $# -ne 0 ]; then
  removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
  if [ -n "${JAVA_HOME+x}" ]; then
    removeFromPath $JAVA_HOME
  fi
  export JAVA_HOME=`/usr/libexec/java_home -v $@`
  export PATH=$JAVA_HOME/bin:$PATH
fi
}
function removeFromPath() {
export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
}
setjdk 1.7

export GOPATH=~/gopath

export CDAP_SDK_HOME=/cdap/sdk
PATH=$PATH:$CDAP_SDK_HOME/bin

# virtualenvwrapper for python
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/development
source /usr/local/bin/virtualenvwrapper.sh
