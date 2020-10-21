cxo=~/dev/cxo
dev=~/dev/
alias zrl='source ~/.zshrc'
alias ldw='docker-compose exec --user=laradock workspace $1'
alias ldup='docker-compose up -d nginx mariadb redis'

fpath() {
 d=`pwd`
 echo "$d/$1"
}

