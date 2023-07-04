<?php
include "connexion.php";

$_email = $_POST['_email'];
$_password = sha1($_POST['_password']);

try {
    if (isset($_email, $_password)) {
        
        $req = $db->prepare("SELECT * FROM users WHERE email=? AND password=?");
        $req->execute(array($_email, $_password));
        $exist = $req->rowCount();

        if ($exist == 1) {
            $array = $req->fetch();
            $msg = "Connecté avec succès";
            $success = 1;
        } else {
            $array = null;
            $msg = "Email ou mot de passe incorrect";
            $success = 0;
        }
        
    } else {
        $success = 0;
        $msg = "Données manquantes";
    }
} catch (\Throwable $th) {
    $success = 0;
    $msg = "Erreur : " . $th->getMessage();
    $array = null;
}

echo json_encode([
    "data" => [
        $msg,
        $success,
        $array 
    ]
]);
?>
