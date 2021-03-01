#!/bin/bash

# set current date and time
dt=$(date '+%F %R')

# set file location
fileloc="/data/data/com.termux/files/home/notes/qnote.txt"

text="$dt $@"

sed -i "1s/^/$text\n/" $fileloc

