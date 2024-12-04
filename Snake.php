<?php
$taille = 50;
$hauteur = 10;
$speed = 1;
$direction = "right";
$timmer = 20;
$game = true;
$counter = 0;
$commande = PHP_OS_FAMILY == "Windows" ? 'cls' : 'clear';

class cell{
    public $posX = 0;
    public $posY = 0;
    public $sprite = "\033[32m=\033[0m";

    public function __construct($x, $y){
        $this->posX = $x;
        $this->posY = $y;
    }
}
class player{
    public $posX = 10;
    public $posY = 0;
    public $sprite = "\033[32mO\033[0m";
    public $corp = [];
}

class pomme{
    public $posX;
    public $posY;

    public $sprite = "\033[31mO\033[0m";

    public function __construct($x, $y){
        $this->posX = $x;
        $this->posY = $y;
    }
}

$player = new player();
$cell1 = new cell(9,0);
$cell2 = new cell(8,0);
$cell3 = new cell(7,0);

$player->corp = [$cell1, $cell2, $cell3];
$pomme = new pomme(47,8);
$pommes = [$pomme];

$stdin = fopen('php://stdin', 'r');
stream_set_blocking($stdin, 0);
system('stty cbreak -echo');


$map = [];
for($i = 0; $i < $hauteur; $i++){
    $map[$i] = [];
}
    while($game){
        affiche();
        
        checkdir();
        move($direction);
        
        usleep(50000/$speed);
        @system($commande);
        
        // $timmer --;
        // if($timmer == 0){

        //     $pommes[] = new pomme(rand(0,99),rand( 0,19));
        //     $timmer = rand(100,200);
        // }
    }

    function move(string $direction){
        global $player;
        global $hauteur;
        global $taille;
        global $counter;
        for ($i=count( $player->corp)-1; $i >= 0; $i--) { 
            $cell = $player->corp[$i];

            if($i != 0){
                $cell->posX = $player->corp[$i-1]->posX;
                $cell->posY = $player->corp[$i-1]->posY;
            }
            elseif($i == 0){
                $cell->posX = $player->posX;
                $cell->posY = $player->posY;
            }

        }
        switch ($direction) {
            case 'up':
                if($player->posY == $hauteur-1)
                $player->posY = 0;
                else
                $player->posY ++;
                break;
            case 'down':
                if($player->posY == 0)
                $player->posY = $hauteur -1;
                else
                $player->posY --;
                break;
            case 'left':
                if($player->posX == 0)
                $player->posX = $taille-1;
                else
                $player->posX --;
                break;
            case 'right':
                if($player->posX == $taille-1)
                $player->posX = 0;
                else
                $player->posX ++;
                break;
        }
        echo $counter."               "."x : ".$player->posX." y : ".$player->posY.PHP_EOL;
    }

    function checkdir(){
        global $stdin;
        global $direction;
        global $speed;
        $keypress = fgets($stdin);
        switch ($keypress) {
            case 'z':
                if($direction != "down"){
                $direction = "up";
                $speed = 0.5;
                }
                break;
            case 's':
                if($direction != "up"){
                $direction = "down";
                $speed = 0.5;
                }
                break;
            case 'q':
                if($direction != "right"){
                $direction = "left";
                $speed = 1;
                }
                break;
            case 'd':
                if($direction != "left"){
                $direction = "right";
                $speed = 1;
                }
                break;
        }
    }

    function affiche(){
        global $map;
        global $taille;
        global $player;
        global $hauteur;
        global $pomme;
        global $pommes;
        global $game;
        foreach ($map as $key => $ligne) {
            for ($i=0; $i < $taille; $i++) { 


                if ($player->posX == $i && $player->posY == $key) 
                $map[$key][$i] = $player->sprite;
                else
                $map[$key][$i] = " ";
                foreach ($pommes as $k => $p) {
                    if($pommes[$k]->posX == $i && $pommes[$k]->posY == $key)
                    $map[$key][$i] = $pommes[$k]->sprite;
                    if($player->posX == $pommes[$k]->posX && $player->posY == $pommes[$k]->posY){
                    addcell();
                    unset($pommes[$k]);
                    $pommes[] = new pomme(rand(0,$taille-1),rand( 0,$hauteur-1));
                    }
                }
                foreach ($player->corp as $cell) {
                    if($cell->posX == $player->posX && $cell->posY == $player->posY)
                    $game = false;
                    if($cell->posX == $i && $cell->posY == $key)
                    $map[$key][$i] = $cell->sprite;
                }
            }
        }
            echo str_repeat("_", $taille).PHP_EOL;
        for ($i= ($hauteur -1); $i >= 0; $i--) {
            echo "|".implode("", $map[$i])."|".PHP_EOL;
        }
            echo str_repeat("_", $taille).PHP_EOL;
        // print_r($pommes);
    }

    function addcell(){
        global $counter;
        $counter ++;
        $newcell = new cell(0,0);
        global $player;
        $player->corp[] = $newcell;
    }