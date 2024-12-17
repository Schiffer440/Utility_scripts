<?php

if(key_exists(1,$argv)){
    $titre = $argv[1];
}
else{
    echo "Insérez un nom pour le projet : ".PHP_EOL;
    $titre = readline();
}


$htmltext = '<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="style.css" rel="stylesheet">
        <title>'.$titre.'</title>
    </head>

    <body>

        
        
        <script src="script.js"></script>
    </body>

</html>';

$csstext = "*{
    margin:0;
    padding: 0;
    box-sizing: border-box;
}";

shell_exec( "mkdir $titre");
shell_exec( "touch ./$titre/script.js");


file_put_contents("./$titre/index.html", $htmltext);
file_put_contents("./$titre/style.css", $csstext);






