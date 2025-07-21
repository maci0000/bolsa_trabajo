<?php
include 'conexion.php';

$nombre = $_POST['nombre'];
$descripcion = $_POST['descripcion'];
$id_empresa = $_POST['id_empresa'];

$sql = "INSERT INTO PUESTO (Nombre_Puesto, Descripcion_Puesto, ID_Empresa)
        VALUES ('$nombre', '$descripcion', '$id_empresa')";

if ($conexion->query($sql)) {
    echo "Puesto guardado correctamente.";
} else {
    echo "Error: " . $conexion->error;
}