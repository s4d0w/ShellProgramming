#!/bin/bash
#########################
# 1. $HOME/.bashrc
# 2. $HOME/.vimrc
# 3. ?
#########################

set -e 

source /root/shell/functions.sh

echo
echo "[$HOME/.bashrc]"
# 1. $HOME/.bashrc
BASHRC=$HOME/bashrc.txt
# BASHRC=$HOME/.bashrc
echo "[Phase 01] $BASHRC 파일 설정"
/bin/cp /etc/skel/.bashrc $BASHRC
cat << EOF >> $BASHRC
#
# Specific configuration
#
export PS1='\[\e[31;1m\][\w]\$ \[\e[m\]'

alias ls='ls -h -F --color=auto'
alias tree='env LANG=C tree -F'
alias clar='clear'
alias c='clear'
alias pps='ps -ef | head -1; ps -ef | grep $1'
alias vi='/usr/bin/vim'
alias grep='grep --color=auto -i'
alias df='df -h -T'

EOF
echo "[  OK  ] $BASHRC 설정 완료"

echo
echo "[$HOME/.vimrc]"
# 2. $HOME/.vimrc
VIMRC=$HOME/.vimrc
echo "[Phase 01] $VIMRC 파일 설정"
cat << EOF > $VIMRC
syntax on
set nu
set ai
set ts=4 sw=4
set et
EOF
echo "[  OK  ] $VIMRC 설정 완료"
