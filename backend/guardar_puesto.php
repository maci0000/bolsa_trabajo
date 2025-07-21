<?php
include 'conexion.php';

$nombre = $_POST['nombre'];
$descripcion = $_POST['descripcion'];
$fecha_pub = $_POST['fecha_pub'];

$sql = "INSERT INTO PUESTO_TRABAJO (Titulo_Puesto, Descripción_Puesto, Fecha_Publicación)
        VALUES ('$nombre', '$descripcion', '$fecha_pub')";

if ($conexion->query($sql)) {
    echo "Puesto guardado correctamente.";
} else {
    echo "Error: " . $conexion->error;
}