dev=~/dev/
alias cduber='cd "/Users/colemanr/Library/Application Support/Übersicht/widgets"'
alias gput='git push origin && git push github && git push --tags && git push --tags origin'

fpath() {
 d=`pwd`
 echo "$d/$1" | pbcopy
 echo "$d/$1"
}