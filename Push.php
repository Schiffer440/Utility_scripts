<?php
        shell_exec ('git add .');
        shell_exec ('git commit -m "'.$argv[1].'"');
        shell_exec ('git push');

