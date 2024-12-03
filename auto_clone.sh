#!/bin/bash

read -p "Day n° ? (sous forme [nn]) : " day 
read -p "Nom du dossier : " dir
if [ $? -eq 0 ] 
then
    read -p "Créer les fichiers exercices ? (y/n): " -i "y" files 
else
    read -p "veuillez entrer un nom de dossier : " dir
fi

create_files=$files
day_nb=$day
dir_name=$dir

git clone git@github.com:EpitechWebAcademiePromo2026/W-WEB-024-PAR-1-1-poolphpday$day_nb-ion.pascal.git $dir_name
if [ $? -eq 0 ] 
then
    if [ $create_files == "y" ] 
    then
        read -p "Nombre d'ex.php ? :" nb
        nb_de_fichier=$nb
        
        for ((i=1; i <= $nb_de_fichier;i++))
        do
            if [ $i -lt 10 ]
            then
                touch ./$dir_name/ex_0$i.php
                if [ $? -eq 0 ]
                then
                    echo -e "\033[32mex_0$i.php created with success !\033[0m"
                else
                    echo -e "\033[31mError while creating ex_0$i.php...\033[0m"
                fi
            else
                touch ./$dir_name/ex_$i.php
                if [ $? -eq 0 ]
                then
                    echo -e "\033[32mex_$i.php created with success !\033[0m"
                else
                    echo -e "\033[31mError while creating ex_$i.php...\033[0m"
                fi
            fi
        done
        else
            echo FAIL
    fi
    echo "******************************"
    echo -e "\033[0;32mclone terminé et \e[1;35m$dir_name \e[0;32mcréé avec succès\e[0m"
    echo "******************************"
    echo -e "\e[0;33mDéplacé dans $dir_name"
else
    echo -e "\e[0;31mErreur lors du clonnage du repo \e[1;31m$day_nb"
fi