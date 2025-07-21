<?php
header('Content-Type: application/json');
include 'conexion.php';

$sql = "SELECT * FROM PUESTO_TRABAJO";
$result = $conexion->query($sql);

$puestos = [];
while ($row = $result->fetch_assoc()) {
    $puestos[] = $row;
}
echo json_encode($puestos);