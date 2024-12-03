#!/bin/bash


read -p "Which file do you want to add (* for all):" files
echo "read => $files"
if [[ -z $files ]]
then
    echo "No files requested, exiting..."
    exit 1
fi
read -e -p "Enter commit message(leave it blank for 'auto push'): " -i "auto push" message
echo $message
git commit -m "$message"
git push
