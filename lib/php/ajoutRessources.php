<?php
include "connexion.php";

$_longitude = $_POST['longitude'];
$_latitude = $_POST['latitude'];
$_nomRessource = $_POST['nom_ressource'];
$_description = $_POST['description'];
$_imageRessource = $_POST['image_ressource'];
$_categoryId = $_POST['category_id'];
$_zoneId = $_POST['zone_id'];
$_userId = $_POST['user_id'];

try {
    if (isset($_longitude, $_latitude, $_nomRessource, $_description, $_imageRessource, $_categoryId, $_zoneId, $_userId)) {
        
        $req = $db->prepare("INSERT INTO ressources (longitude, latitude, nom_ressource, description, image_ressource, category_id, zone_id, user_id, date_ajout) VALUES (?, ?, ?, ?, ?, ?, ?, ?, NOW())");
        $req->execute(array($_longitude, $_latitude, $_nomRessource, $_description, $_imageRessource, $_categoryId, $_zoneId, $_userId));
        
        if ($req) {
            $success = 1;
            $msg = "Ressource ajoutée avec succès";
        } else {
            $success = 0;
            $msg = "Erreur lors de l'ajout de la ressource";
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
    "success" => $success,
    "message" => $msg
]);
?>
