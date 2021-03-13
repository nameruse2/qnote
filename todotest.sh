#!/usr/bin/bash

# set current date and time
dt=$(date '+%F')

# set file location
fileloc="$HOME/notes/todo.txt"



while getopts :a:s:lp thearg
do
    case $thearg in
        a) aflag="yes"; aarg+=("$OPTARG");;
        l) lflag="yes";;
        p) pflag="yes";;
        d) fileloc="$HOME/notes/done.todo.txt";;
    esac
done
shift $((OPTIND-1))

# add a task with -a flag
if [[ $aflag == "yes" ]]
then 
    #echo "${aarg[@]}"
    text="$dt $@"
    echo $text >> $fileloc
# Print list
elif [[ $lflag == "yes" ]]
then
    cat -n $fileloc
elif [[ $pflag == "yes" ]]
then
    projects=( $(rg -o "\+\w+" $fileloc | sort | uniq) )
    for i in "${projects[@]}"; do
        procount=$(rg -v '^x' $fileloc | rg -cF $i)
        toprint="$i $procount"
        echo $toprint
    done
fi


## move @someday tasks to someday file
#grep @someday todo.txt >> someday.todo.txt
#sed -i '/@someday/d' todo.txt
