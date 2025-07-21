<?php
include 'conexion.php';

$id = $_POST['id'];

$sql = "DELETE FROM EMPRESA WHERE ID_Empresa = $id";

if ($conexion->query($sql)) {
    echo "Empresa eliminada correctamente.";
} else {
    echo "Error: " . $conexion->error;
}
