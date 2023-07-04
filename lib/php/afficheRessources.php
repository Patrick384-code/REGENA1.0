<?php
include "connexion.php";

try {
    $stmt = $db->query("SELECT * FROM ressources");
    $ressources = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode($ressources);
} catch (Exception $e) {
    echo json_encode(["error" => $e->getMessage()]);
}
?>
