<?php
$host = "localhost";
$usuario = "root";
$contrasena = "";  // o la contraseña que hayas definido en XAMPP
$base_datos = "bolsa_trabajo";

$conexion = new mysqli($host, $usuario, $contrasena, $base_datos);

if ($conexion->connect_error) {
    die("Conexión fallida: " . $conexion->connect_error);
}