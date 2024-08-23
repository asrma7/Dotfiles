#!/usr/bin/env bash

languages=`echo "golang python3 lua cpp c typescript nodejs csharp" | tr ' ' '\n'`

command=`echo "sed awk xargs find grep mv tar" | tr ' ' '\n'`

selected=`echo -e "$languages\n$command" | fzf`
if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter Query: " query

if echo -e "$languages" | grep -qs $selected; then
    query=`echo $query | tr ' ' '+'`
    tmux neww bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
else
    tmux neww bash -c "curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done"
fi
