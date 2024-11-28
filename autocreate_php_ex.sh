#!/bin/bash

read -p "Nombre d'ex.php ? :" nb

nb_de_fichier=$nb

for ((i=1; i <= $nb_de_fichier;i++))
do
    if [ $i -lt 10 ]
    then
        touch ex_0$i.php
    else
        touch ex_$i.php
    fi
done
