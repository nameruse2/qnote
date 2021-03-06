#!/usr/bin/bash
fileloc=$HOME/notes/todo.txt

while getopts :a:s:lp thearg
do
    case $thearg in
        a) aflag="yes"; aarg+=("$OPTARG");;
        l) lflag="yes";;
        p) fileloc="$HOME/notes/projects.todo.txt";;
        d) fileloc="$HOME/notes/done.todo.txt";;
    esac
done
shift $((OPTIND-1))


if [[ $aflag == "yes" ]]
then 
    echo "${aarg[@]}"
elif [[ $lflag == "yes" ]]
then
    cat $fileloc
fi
