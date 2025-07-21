<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *'); // Permite llamadas desde JS en localhost

// Conexión a la base de datos
$host = 'localhost';
$usuario = 'root';        // 👉 reemplaza con tu usuario (por ejemplo, 'root')
$contrasena = '@LUPE22turbo';  // 👉 reemplaza con tu contraseña real
$bd = 'bolsa_trabajo';

$conexion = new mysqli($host, $usuario, $contrasena, $bd);

// Verificar conexión
if ($conexion->connect_error) {
    http_response_code(500);
    echo json_encode(['message' => 'Error de conexión: ' . $conexion->connect_error]);
    exit;
}

// Consulta a la base de datos
$sql = "SELECT ID_Universidad, Nombre_Universidad FROM UNIVERSIDAD";
$resultado = $conexion->query($sql);

$universidades = [];

if ($resultado && $resultado->num_rows > 0) {
    while ($fila = $resultado->fetch_assoc()) {
        $universidades[] = $fila;
    }
}

// Cerrar conexión
$conexion->close();

// Devolver datos en JSON
echo json_encode($universidades);
