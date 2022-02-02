alias zrl='source ~/.zshrc'
#alias ldw='docker compose exec --user=laradock workspace $1'
alias ldup='docker compose up -d nginx mariadb redis phpmyadmin'
alias ldd='docker compose stop'
alias lds='docker compose stop'

devenv() {
    cd ~/dev/devenv
    if [[ $1 == "start" ]]
        then
        ldup
    elif [[ $1 == "stop" ]]
        then
        ldd
    fi
}

ldw() {
    if [[ $# -eq 0 ]] 
        then
        docker compose exec --user=laradock workspace zsh
    elif [[ $# -eq 1 ]]
    then
        docker compose exec --user=laradock workspace $1

    elif [[ $# -eq 2 ]]
    then
        docker compose exec --user=$2 workspace $1
    fi        
}
