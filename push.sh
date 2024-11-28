#!/bin/bash

#!/bin/bash

read -p "Which file do you want to add (* for all):" files
git add $files
if [ $? -ne 0 ]
then
    exit 1
fi
read -e -p "Enter commit message(leave it blank for 'auto push'): " -i "auto push" message
echo $message
git commit -m "$message"
git push