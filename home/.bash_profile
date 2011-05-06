export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export PATH=${PATH}:/opt/local/lib/mysql5/bin/:/opt/local/sbin:/opt/mongodb/bin
export MANPATH=/opt/local/share/man:$MANPATH
export RAILS_ENV=development
export EDITOR="vim --noplugin"

alias start_star="sudo starling -P /var/run/starling.pid -L /var/log/starling/starling.log -q /var/spool/starling/ -d"
alias start_mongo="/opt/mongodb/bin/mongod --dbpath=/mongo/data/ --logpath /mongo/logs/mongod.log --fork"
alias tunnel_mongo_live="ssh -L 27020:localhost:27017 recs-l3 -f -N"
alias tunnel_mongo_dev="ssh -L 27030:localhost:27017 dev-app -f -N"
alias rest_tunnel_1a="ssh -L 28001:localhost:28017 mongo-1a -f -N"
alias rest_tunnel_1b="ssh -L 28001:localhost:28017 mongo-1b -f -N"
alias lm="mongo localhost:27020/product"
alias dm="mongo localhost:27030/product"
alias ks='killall ssh'

if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

complete -C /Users/mbrown/scripts/rake_tab_complete.rb -o default rake

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
