# bash

alias {up,..}='cd ..'

# busybox

alias cp='cp -i'
alias df='df -h'
alias du='du -h'
alias grep='grep --exclude-dir ".git" --color=tty'
alias free='free -m'
alias l='ls -lh --color'
alias ll='ls -lh --color'
alias lla='ll -a --color'
alias ls='ls --color'
alias mv='mv -i'

# docker

alias docker-ip='docker inspect --format "{{ .NetworkSettings.IPAddress }}"'
alias docker-ip='docker inspect --format "{{ .NetworkSettings.IPAddress }}"'
alias dc='docker-compose'
alias dc-dev='dc -f docker-compose.yml -f docker-compose.dev.yml'
alias dc-bf='dc -f docker-compose.yml -f docker-compose.dev.yml -f docker-compose.blackfire.yml'
alias dc-dev-varnish='dc -f docker-compose.yml -f docker-compose.dev.yml -f docker-compose.varnish.yml'

# ssh

alias ssh-unsafe='ssh -o "StrictHostKeyChecking=no" -o "UserKnownHostsFile /dev/null"'

# sudo

alias fuck='sudo $(history -p \!\!)'
alias sudo='sudo '

# Symfony2

# Add a couple of aliases for symfony projects
## some of these commands are often used in developpement
alias DP='php app/console doctrine:database:drop --force --if-exists && php app/console doctrine:database:create && php app/console doctrine:schema:create && php app/console doctrine:fixtures:load --purge-with-truncate --no-interaction'
alias AI='php app/console assets:install --symlink && php app/console assetic:dump'

# git

# clean branches not on remote
alias git-clean-branch='git branch -r | awk "{print substr($1,8)}" | egrep -v -f /dev/fd/0 <(git branch) | awk "{print $1}" | xargs git branch -D'
