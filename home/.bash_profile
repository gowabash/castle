export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export PATH=/usr/local/bin:${PATH}:/opt/local/sbin:/mongo/mongodb/bin:/usr/local/sbin:/usr/local/share/npm/bin
export MANPATH=/opt/local/share/man:$MANPATH
export IGO_DEVELOPER=matt
export EDITOR="mvim"
export GIT_MERGE_AUTOEDIT=no
export CLASSPATH=.:~/jars

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_55.jdk/Contents/Home

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

alias start_mongo="/mongo/mongodb/bin/mongod --config /mongo/conf/mongo.conf"
alias start_elastic_search="/elasticsearch/elasticsearch/bin/elasticsearch -d -p /elasticsearch/elasticsearch/pidifle es.config=/elasticsearch/elasticsearch/config/elasticsearch.yml"
alias start_kafka="zkServer start;kafka-server-start.sh -daemon /usr/local/etc/kafka/server.properties"

alias tunnel_mongo_s2_master="ssh -L 27201:localhost:27017 stack2-mongo-1a -f -N"
alias tunnel_mongo_s2="ssh -L 27202:localhost:27017 stack2-mongo-1b -f -N"

alias tunnel_mongo_stage="ssh -L 27050:localhost:27017 stage-mongo -f -N"
alias tunnel_mongo_demo="ssh -L 27030:localhost:27017 demo-mongo-1a -f -N"

alias bd1="open 'http://localhost:8000/bigdesk/index.html?port=9301&go'"
alias bd2="open 'http://localhost:8000/bigdesk-master/index.html?port=9302&go'"

alias rest_tunnel_stack1="ssh -L 28101:localhost:28017 mongo-1a -f -N"
alias rest_tunnel_stack2="ssh -L 28102:localhost:28017 s2-mongo-1a -f -N"
alias rest_tunnel_stack3="ssh -L 28103:localhost:28017 s3-mongo-1a -f -N"
alias rest_tunnel_stack4="ssh -L 28104:localhost:28017 s4-mongo-1a -f -N"


alias tunnel_pg_s0="ssh -L 5500:localhost:5432 s0-postgres -f -N"
alias tunnel_pg_stage="ssh -L 5400:localhost:5432 stage-postgres -f -N"

alias pg-s0="psql -h localhost -p 5500 -U igo ck"
alias pg-stage="psql -h localhost -p 5400 -U igo ck"

alias sm="mongo localhost:27050/product --shell ~/.mongo/set_secondary.js"
alias dm="mongo localhost:27030/product --shell ~/.mongo/set_secondary.js"
alias bm="mongo localhost:27040/product --shell ~/.mongo/set_secondary.js"
alias ks='killall ssh'

alias wm1="mongo localhost/white_mouse_development"

alias show_tag='git show-ref --tags | grep '
alias wget="curl -O"

alias vi='mvim -v'
alias eclipse='open ~/bin/adt/eclipse/Eclipse.app'

alias powstart="echo '* Starting the Pow server...'
launchctl unload '$HOME/Library/LaunchAgents/cx.pow.powd.plist' 2>/dev/null || true 
launchctl load -Fw '$HOME/Library/LaunchAgents/cx.pow.powd.plist' 2>/dev/null"

ulimit -n 16384

if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi

show_pulls() {
  projects=( "cie" "batchelor" "silverMonkey" "crimsonKraken" "collector" "greenHawk" "orangeOwl" "mission_control" "blackSquid" "redRhino") 
  for i in "${projects[@]}"
  do
    gh pr -u iGoDigital-LLC -r $i
  done
}

open_pull() {
  gh pr -u iGoDigital-LLC -r $1 -n $2 -B
}

tunnel_mongo() {
  ssh -L 27100:localhost:27017 ubuntu@mongo-$2.$1.igodigital.net -f -N
}

tunnel_mongo_stack2() {
  key="/Users/mbrown/.ssh/recs-west.pem"
  ssh -L 27100:localhost:27017 ec2-user@mongo-$2.stack2.igodigital.net -f -N -i $key
}

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

$(boot2docker shellinit 2>&1 | grep -i export)
export DOCKER_HOST=tcp://127.0.0.1:2376
export FIG_PROJECT_NAME=cobaltstartfish
