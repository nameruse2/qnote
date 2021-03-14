#!/bin/sh

# set current date and time
dt=$(date '+%F')

# set file location
fileloc="$HOME/notes/todo.txt"

function add ()
{
    text="$dt $@"
    echo $text >> $fileloc
    return 0
}

function list ()
{
   cat -n $fileloc
   return 0
}

function projects ()
{
    projects=( $(rg -o "\+\w+" $fileloc | sort | uniq) )
    for i in "${projects[@]}"; do
        procount=$(rg -v '^x' $fileloc | rg -cF $i)
        toprint="$i $procount"
        echo $toprint
    done
    return 0
}

"$@"



## move @someday tasks to someday file
#grep @someday todo.txt >> someday.todo.txt
#sed -i '/@someday/d' todo.txt
