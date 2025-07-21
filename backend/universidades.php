<?php
header("Content-Type: application/json");
// Permite acceso desde cualquier origen
header("Access-Control-Allow-Origin: *"); 

// Conexión a la base de datos
$conn = new mysqli("localhost", "root",  "bolsa_trabajo", 3306);

// Verifica conexión
if ($conn->connect_error) {
    die(json_encode(["error" => "Error de conexión: " . $conn->connect_error]));
}

// Consulta SOLO los nombres
$sql = "SELECT Nombre_Universidad FROM UNIVERSIDAD ORDER BY Nombre_Universidad";
$result = $conn->query($sql);

if (!$result) {
    die(json_encode(["error" => "Error en consulta: " . $conn->error]));
}

$nombres = array();
while ($row = $result->fetch_assoc()) {
    $nombres[] = $row['Nombre_Universidad'];
}

echo json_encode($nombres);
$conn->close();
?>