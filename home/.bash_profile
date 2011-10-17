export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export PATH=${PATH}:/opt/local/lib/mysql5/bin/:/opt/local/sbin:/opt/mongodb/bin
export MANPATH=/opt/local/share/man:$MANPATH
export RAILS_ENV=development
export EDITOR="vim --noplugin"

alias start_star="sudo starling -P /var/run/starling.pid -L /var/log/starling/starling.log -q /var/spool/starling/ -d"
alias start_mongo="/opt/mongodb/bin/mongod --dbpath=/mongo/data/ --logpath /mongo/logs/mongod.log --fork"
alias tunnel_mongo_s2_master="ssh -L 27201:localhost:27017 s2-mongo-1a -f -N"
alias tunnel_mongo_s2_secondary="ssh -L 27202:localhost:27017 s2-mongo-1b -f -N"
alias tunnel_mongo_s1_master="ssh -L 27101:localhost:27017 mongo-1a -f -N"
alias tunnel_mongo_s1_secondary="ssh -L 27102:localhost:27017 mongo-1b -f -N"
alias tunnel_mongo_dev="ssh -L 27030:localhost:27017 dev-mongo -f -N"
alias tunnel_mongo_bart="ssh -L 27040:localhost:27017 bart.local -f -N"
alias tunnel_elastic_live="ssh -L 9300:localhost:9200 -i .ssh/root-ec2 ec2-user@ra-es1.public.aws.igodigital.net -f -N"
alias rest_tunnel_1a="ssh -L 28001:localhost:28017 mongo-1a -f -N"
alias rest_tunnel_1b="ssh -L 28001:localhost:28017 mongo-1b -f -N"
alias lm1="mongo localhost:27102/product --shell ~/.mongo/set_secondary.js"
alias lm2="mongo localhost:27202/product --shell ~/.mongo/set_secondary.js"
alias dm="mongo localhost:27030/product"
alias bm="mongo localhost:27040/product"
alias ks='killall ssh'

alias start_mysql='echo sudo /opt/local/bin/mysqld_safe5 with an ampersand'
alias stop_mysql='/opt/local/bin/mysqladmin5 -h 127.0.0.1 -u rails -p shutdown'
alias mydb='mysql -u rails -h 127.0.0.1 -p '

if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

#complete -C /Users/mbrown/scripts/rake_tab_complete.rb -o default rake

export PATH=/opt/local/bin:/opt/local/sbin:~/bin:$PATH

#Amazon stuff
#MASTER
export EC2_PRIVATE_KEY=~/ec2/pk-ec2-mgmt.pem
export EC2_CERT=~/ec2/cert-ec2-mgmt.pem

#export AWS_CREDENTIAL_FILE=/opt/RDSCli-1.0.006/credential-file-path.template
#export AWS_RDS_HOME=/opt/RDSCli-1.0.006
#export AWS_IAM_HOME=/opt/IAMCli
export EC2_HOME=/opt/ec2
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6.0/Home
export PATH=/opt/ec2/bin:$PATH:/opt/RDSCli-1.0.006/bin:/opt/scala/bin:/opt/IAMCli


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
