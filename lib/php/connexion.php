<?php
    $host = "localhost";
    $dbname = "id20930807_regena_bd";
    $user = "	id20930807_regena";
    $pass = "Patrickaime03#";
    
    try {
        $db = new PDO("mysql:host=$host; dbname=$dbname", $user, $pass);
        // echo "Connecte";
    } catch (\Throwable $th) {
        //echo "Error: ".$th->getMessage();
    }
?>