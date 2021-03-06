#!/bin/bash

# set current date and time
dt=$(date '+%F')

# set file location
fileloc="$HOME/notes/todo.txt"

text="$dt $@"

echo $text >> $fileloc
