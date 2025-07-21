<?php
include 'conexion.php';

$id = $_POST['id'];

$sql = "DELETE FROM PUESTO WHERE ID_Puesto = $id";

if ($conexion->query($sql)) {
    echo "Puesto eliminado correctamente.";
} else {
    echo "Error: " . $conexion->error;
}
