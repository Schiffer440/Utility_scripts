#!/bin/bash

read -p "Nombre d'ex.php ? :" nb

nb_de_fichier=$nb

for ((i=1; i <= $nb_de_fichier;i++))
do
    if [ $i -lt 10 ]
    then
        touch ex_0$i.php
        if [ $? -eq 0 ]
        then
            echo -e "\033[32mex_0$i.php created with success !\033[0m"
        else
            echo -e "\033[31mError while creating ex_0$i.php...\033[0m"
        fi
    else
        touch ex_$i.php
        if [ $? -eq 0 ]
        then
            echo -e "\033[32mex_$i.php created with success !\033[0m"
        else
            echo -e "\033[31mError while creating ex_$i.php...\033[0m"
        fi
    fi
done
code .
