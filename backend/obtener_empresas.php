<?php
header('Content-Type: application/json');
include 'conexion.php';

$sql = "SELECT * FROM EMPRESA";
$result = $conexion->query($sql);

$empresas = [];
while ($row = $result->fetch_assoc()) {
    $empresas[] = $row;
}
echo json_encode($empresas);