<?php
include 'conexion.php';

$nombre = $_POST['nombre'];
$direccion = $_POST['direccion'];
$telefono = $_POST['telefono'];
$email = $_POST['email'];

$sql = "INSERT INTO EMPRESA (Nombre_Empresa, Direccion_Empresa, Telefono_Empresa, Email_Empresa)
        VALUES ('$nombre', '$direccion', '$telefono', '$email')";

if ($conexion->query($sql)) {
    echo "Empresa guardada correctamente.";
} else {
    echo "Error: " . $conexion->error;
}