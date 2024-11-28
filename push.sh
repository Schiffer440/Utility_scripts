#!/bin/bash


git add *
if [ $? -ne 0 ]
then
    exit 1
fi
read -p "Commit message:" message
git commit -m "$message"

git push