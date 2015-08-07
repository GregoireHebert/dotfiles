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

