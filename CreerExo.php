<?php

        $permission = "chmod 755";

        for ($i=0; $i < $argv[1]; $i++) { 
            if($i < 10){
            shell_exec ('touch ex_0'.($i+1).".php");
            $permission .= " ex_0".($i+1).".php";
            }
            else{
            shell_exec ('touch ex_'.($i+1).'.php');
            $permission .= " ex_".($i+1).".php";
            }
        }
        shell_exec( $permission);
?>       

