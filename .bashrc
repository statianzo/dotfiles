export EDITOR=nvim
export PATH=$HOME/bin:$HOME/.local/bin:$HOME/.n/bin:/opt/homebrew/bin:/vendor/bundle/bin:./node_modules/.bin:$PATH

set -o vi

alias ls="ls -G"
alias bex="bundle exec"
alias birb="irb -r ./boot"
alias venv="source .venv/bin/activate"
alias vim=nvim

if [ -f /usr/share/git/git-prompt.sh ]; then
  source /usr/share/git/git-prompt.sh
fi

function purge-docker {
  docker ps -a | grep 'Exit' |  awk '{print $1}' | xargs docker rm &> /dev/null
  docker images | grep '<none>' |  awk '{print $3}'  | xargs docker rmi &> /dev/null
}

for f in $HOME/.bashrc.d/*; do
  . $f
done
export PS1='[\W]$(__git_ps1 "(%s)")\$ '
