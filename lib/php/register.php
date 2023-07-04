<?php 
include "connexion.php";

$_name = $_POST['_name'];
$_email = $_POST['_email'];
$_password = sha1($_POST['_password']);

try {
    if (isset($_name, $_email, $_password)) {
        
        $req = $db->prepare("SELECT * FROM users WHERE email = ?");
        $req->execute(array($_email));
        $exist = $req->rowCount();

        if ($exist == 0) {
            $req = $db->prepare("INSERT INTO users (first_name, email, password, type_utilisateur) VALUES (?, ?, ?, 'Citoyen')");
            $req->execute(array($_name, $_email, $_password));
            if ($req) {
                $success = 1;
                $msg = "Succès de l'enregistrement";
            } else {
                $success = 0;
                $msg = "Erreur d'enregistrement";
            }  
        } else {
            $msg = "Email déjà utilisé";
            $success = 0;
        }
        
    } else {
        $success = 0;
        $msg = "Données manquantes";
    }
} catch (\Throwable $th) {
    $success = 0;
    $msg = "Erreur : " . $th->getMessage();
}

echo json_encode([
    "data" => [
        $msg,
        $success
    ]
]);
?>
