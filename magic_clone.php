<?php

function prompt($message, $default = null) {
    echo $message;
    $input = trim(fgets(STDIN));
    return $input !== '' ? $input : $default;
}

$dayNb = prompt("Day n° ? (sous forme [nn]) : ");
$dirName = prompt("Nom du dossier : ");
$userName = prompt("idendifiant git : ");
 while($dirName === null || $dirName === '') {
    $dir = prompt("Veuillez entrer un nom de dossier : ");
}

exec("git clone git@github.com:EpitechWebAcademiePromo2026/W-WEB-024-PAR-1-1-poolphpday{$dayNb}-{$userName}.git $dirName", $output, $returnVar);

if ($returnVar === 0) {
    $nbDeFichier = (int)prompt("Nombre d'exercices ? : ");
    for ($i = 1; $i <= $nbDeFichier; $i++) {
        $fileName = $i < 10 ? "ex_0{$i}.php" : "ex_{$i}.php";
        $filePath = "./$dirName/$fileName";

        if (touch($filePath)) {
            echo "\033[32m$fileName créé !\033[0m\n";
        } else {
            echo "\033[31mErreur lors de la création de $fileName...\033[0m\n";
        }
    }

    echo "******************************\n";
    echo "\033[0;32mRepo cloné dans \e[1;35m$dirName\e[0m\n";
    echo "******************************\n";

} else {
    echo "\e[0;31mErreur lors du clonage du repo \e[1;31m$dayNb\n";
}

