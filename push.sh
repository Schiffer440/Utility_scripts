#!/bin/bash

#Color list#
    DEF="\033[0m"
    RED="\033[31;5;32m"
    GREEN="\033[32m"
    YELLOW="\033[33m"
    BLUE="\033[34m"
    MAGENTA="\033[35m"
    CYAN="\033[36m"
    WHITE="\033[37m"
#Text syle#
    BOLD="\033[1m"
    ITALIC="\033[3m"
    UNDERLINE="\033[4m"

read -p "Which file do you want to add (* for all):" files
echo "read => $files"
if [[ -z $files ]]
then
    echo -e "${BOLD}${RED}No files requested, exiting...${DEF}"
    exit 1
else
    git add $files
    if [ $? -ne 0 ]
    then
        exit 1
    fi
    read -e -p "Enter commit message(leave it blank for 'auto push'): " -i "auto push" message
    git commit -m "$message"
    git push
fi
