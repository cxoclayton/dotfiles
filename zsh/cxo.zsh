cxo=~/dev/cxo
dev=~/dev/
alias zrl='source ~/.zshrc'
alias ldw='docker compose exec --user=laradock workspace $1'
alias ldup='docker compose up -d nginx mariadb redis'
alias ldd='docker compose stop'
alias lds='docker compose stop'
alias gput='git push origin && git push github && git push --tags && git push --tags origin'

fpath() {
 d=`pwd`
 echo "$d/$1"
}

