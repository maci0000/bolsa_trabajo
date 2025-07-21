<?php
include 'conexion.php';

$id = $_POST['id'];

// Primero, eliminar puestos relacionados para evitar conflicto por clave foránea
$conexion->query("DELETE FROM PUESTO WHERE ID_Empresa = $id");

$sql = "DELETE FROM EMPRESA WHERE ID_Empresa = $id";

if ($conexion->query($sql)) {
    echo "Empresa eliminada correctamente.";
} else {
    echo "Error: " . $conexion->error;
}
