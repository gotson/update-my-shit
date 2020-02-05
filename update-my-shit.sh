#!/bin/bash

LOGDIR="${HOME}/Library/Logs/ums"
mkdir -p $LOGDIR

run(){
    local command=$1
    local logfile="${LOGDIR}/${2}"
    local timestamp=$(date +"[%Y-%m-%d %H:%M:%S]")

    echo "${timestamp} ${command}" | tee -a $logfile
    eval $command | tee -a $logfile
}

run "brew update" "brew-update.log"
run "brew upgrade" "brew-upgrade.log"
run "brew cleanup" "brew-cleanup.log"
run "brew cask upgrade" "cask-upgrade.log"
run "npm -g update" "npm-update.log"
run "pip3 list --outdated" "pip-update.log"
run "pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3 install -U" "pip-update.log"
run "fish -c 'omf update'" "omf-update.log"
run "mas upgrade" "mas-upgrade.log"
run "tldr --update" "tldr-update.log"