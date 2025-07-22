<?php
$servername = "localhost";
$username = "root";
$password = "1107";
$dbname = "bolsa_trabajo";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Recoger los datos del formulario
$nombre_empresa = $_POST['nombre_empresa'];
$email = $_POST['email'];
$telefono = $_POST['telefono'];
$ruc = $_POST['ruc'];
$razon_social = $_POST['razon_social'];
$direccion_fiscal = $_POST['direccion_fiscal'];
$direccion_empresa = $_POST['direccion_empresa'];
$tipo_empresa = $_POST['tipo_empresa'];
$fecha_registro = $_POST['fecha_registro'] ?? date('Y-m-d');
$contrasena_hash = password_hash($_POST['contraseña'], PASSWORD_DEFAULT);

// Consulta SQL (sin incluir ID_Empresa)
$sql = "INSERT INTO empresa (
    Nombre_Empresa, 
    Email_Contacto, 
    Telefono_Contacto, 
    RUC, 
    Razon_social,
    Tipo_empresa, 
    Direccion_Fiscal, 
    Direccion_Empresa, 
    Contrasena_Hash, 
    Fecha_Registro
) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"; // Solo 10 parámetros

// Preparar la sentencia
$stmt = $conn->prepare($sql);

if ($stmt === false) {
    die("Error al preparar la consulta: " . $conn->error);
}

// Vincular parámetros (corregido para 10 parámetros)
$stmt->bind_param(
    "ssssssssss", 
    $nombre_empresa, 
    $email, 
    $telefono, 
    $ruc, 
    $razon_social,
    $tipo_empresa,  // Corregido: $tipo_empresa en lugar de $Tipo_empresa
    $direccion_fiscal, 
    $direccion_empresa, 
    $contrasena_hash, 
    $fecha_registro
);

// Ejecutar la consulta
if ($stmt->execute()) {
    // Éxito - devolver respuesta JSON
    echo json_encode([
        'success' => true,
        'message' => 'Empresa registrada con éxito',
        'empresa_id' => $stmt->insert_id // Esto devolverá el ID auto-generado (6, 7, etc.)
    ]);
} else {
    // Error - devolver mensaje de error
    echo json_encode([
        'success' => false,
        'message' => 'Error al registrar la empresa: ' . $stmt->error
    ]);
}

// Cerrar conexiones
$stmt->close();
$conn->close();
?>