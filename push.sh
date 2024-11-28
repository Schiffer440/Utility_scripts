#!/bin/bash

read -p "Which file do you want to add (* for all):" files
git add $files
if [ $? -ne 0 ]
then
    exit 1
fi
read -p "Commit message:" message
git commit -m "$message"
git push