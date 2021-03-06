#!/usr/bin/env bash

# set current date and time
dt=$(date '+%F %R')

# set file location
fileloc="$HOME/Documents/notes/qnote.txt"

text="$dt $@\n"

sed -i "1s/^/$text\n/" $fileloc

