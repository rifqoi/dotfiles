#!/bin/env bash

REPO_ROOT=`pwd`

while [[ ! -e $REPO_ROOT/.git ]] && [[ `dirname $REPO_ROOT` != $REPO_ROOT ]]
do
	REPO_ROOT=`dirname $REPO_ROOT`
done


if [[ -d $REPO_ROOT/.git ]]; then
	tmux popup -E -w 97% -h 95% "lazygit -p '$REPO_ROOT'"
else
	tmux popup -E "echo 'Not a git repository.' | cowsay -d | less"
fi
