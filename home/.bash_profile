export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export PATH=${PATH}:/opt/local/sbin:/mongo/mongodb/bin
export MANPATH=/opt/local/share/man:$MANPATH
export RAILS_ENV=development
export EDITOR="mvim"
export GIT_MERGE_AUTOEDIT=no

alias start_star="sudo starling -P /var/run/starling.pid -L /var/log/starling/starling.log -q /var/spool/starling/ -d"
alias start_mongo="/mongo/mongodb/bin/mongod --dbpath=/mongo/data/ --logpath /mongo/logs/mongod.log --fork"

alias tunnel_mongo_s2_master="ssh -L 27201:localhost:27017 s2-mongo-1a -f -N"
alias tunnel_mongo_s2="ssh -L 27202:localhost:27017 s2-mongo-1b -f -N"
alias tunnel_mongo_s1_master="ssh -L 27101:localhost:27017 mongo-1a -f -N"
alias tunnel_mongo_s1="ssh -L 27102:localhost:27017 mongo-1b -f -N"
alias tunnel_mongo_s3_master="ssh -L 27301:localhost:27017 s3-mongo-1a -f -N"
alias tunnel_mongo_s3="ssh -L 27302:localhost:27017 s3-mongo-1b -f -N"
alias tunnel_mongo_s4_master="ssh -L 27401:localhost:27017 s4-mongo-1a -f -N"
alias tunnel_mongo_s4="ssh -L 27402:localhost:27017 s4-mongo-1b -f -N"
alias tunnel_mongo_s5_master="ssh -L 27501:localhost:27017 s5-mongo-1a -f -N"
alias tunnel_mongo_s5="ssh -L 27502:localhost:27017 s5-mongo-1b -f -N"

alias tunnel_mongo_dev="ssh -L 27030:localhost:27017 dev-mongo -f -N"
alias tunnel_mongo_bart="ssh -L 27040:localhost:27017 bart.local -f -N"

alias tunnel_elastic_s1="ssh -L 9301:localhost:9200 s1-es-1a -f -N"
alias tunnel_elastic_s2="ssh -L 9302:localhost:9200 s2-es-1a -f -N"
alias bd1="open 'http://localhost:8000/bigdesk/index.html?port=9301&go'"
alias bd2="open 'http://localhost:8000/bigdesk-master/index.html?port=9302&go'"

alias rest_tunnel_stack1="ssh -L 28101:localhost:28017 mongo-1a -f -N"
alias rest_tunnel_stack2="ssh -L 28102:localhost:28017 s2-mongo-1a -f -N"
alias rest_tunnel_stack3="ssh -L 28103:localhost:28017 s3-mongo-1a -f -N"
alias rest_tunnel_stack4="ssh -L 28104:localhost:28017 s4-mongo-1a -f -N"

alias lm1="mongo localhost:27102/product --shell ~/.mongo/set_secondary.js"
alias lm2="mongo localhost:27202/product --shell ~/.mongo/set_secondary.js"
alias lm3="mongo localhost:27302/product --shell ~/.mongo/set_secondary.js"
alias lm4="mongo localhost:27402/product --shell ~/.mongo/set_secondary.js"
alias lm5="mongo localhost:27502/product --shell ~/.mongo/set_secondary.js"

alias dm="mongo localhost:27030/product --shell ~/.mongo/set_secondary.js"
alias bm="mongo localhost:27040/product --shell ~/.mongo/set_secondary.js"
alias ks='killall ssh'

alias wm1="mongo localhost/white_mouse_development"

alias show_tag='git show-ref --tags | grep '
alias wget="curl -O"

alias vi='mvim -v'

alias powstart="echo '* Starting the Pow server...'
launchctl unload '$HOME/Library/LaunchAgents/cx.pow.powd.plist' 2>/dev/null || true 
launchctl load -Fw '$HOME/Library/LaunchAgents/cx.pow.powd.plist' 2>/dev/null"

if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi

source $HOME/castle/home/git_complete

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

source ~/.scribblr_keys

complete -o default -o nospace -W "$(/usr/bin/env ruby -ne 'puts $_.split(/[,\s]+/)[1..-1].reject{|host| host.match(/\*|\?/)} if $_.match(/^\s*Host\s+/);' < $HOME/.ssh/config)" scp sftp ssh
complete -o default -o nospace -W "$(/usr/bin/env ruby -ne 'puts $_.split(/[,\s]+/)[1..-1].reject{|host| host.match(/\*|\?/)} if $_.match(/^\s*Host\s+/);' < /etc/ssh_config)" scp sftp ssh
