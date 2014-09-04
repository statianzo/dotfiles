TERM=xterm-16color

export EDITOR=vim
export PATH=$HOME/bin:./vendor/bundle/bin:$GOPATH/bin:$PATH
ps1prefix=
[ -n "$DOCKER" ] && ps1prefix="docker:"
PS1='[${ps1prefix}\W]\$ '

set -o vi

alias ls="ls --color"
alias bex="bundle exec"
alias birb="irb -r ./boot"
alias venv="source .venv/bin/activate"

if [ -f /usr/share/git/git-prompt.sh ]; then
  source /usr/share/git/git-prompt.sh
  PS1='[${ps1prefix}\W]$(__git_ps1 "(%s)")\$ '
fi

function purge-docker {
  docker ps -a | grep 'Exit' |  awk '{print $1}' | xargs docker rm &> /dev/null
  docker images | grep '<none>' |  awk '{print $3}'  | xargs docker rmi &> /dev/null
}

for f in $HOME/.bashrc.d/*; do
  . $f
done
