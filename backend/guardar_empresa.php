<?php
// Configuración de la conexión a la base de datos
$servername = "localhost";
$username = "root"; // Reemplaza con tu usuario de MySQL
$password = "1107"; // Reemplaza con tu contraseña de MySQL
$dbname = "bolsa_trabajo";

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Recoger datos del formulario
$nombre_empresa = $_POST['nombre_empresa'];
$email = $_POST['email'];
$telefono = $_POST['telefono'];
$ruc = $_POST['ruc'];
$razon_social = $_POST['razon_social'];
$direccion_fiscal = $_POST['direccion_fiscal'];
$direccion_empresa = $_POST['direccion_empresa'];
$contrasena = $_POST['contrasena'];

// Hashear la contraseña (nunca almacenes contraseñas en texto plano)
$contrasena_hash = password_hash($contrasena, PASSWORD_DEFAULT);

// Obtener la fecha actual
$fecha_registro = date("Y-m-d");

// Preparar y ejecutar la consulta SQL
$sql = "INSERT INTO Empresa (Nombre_Empresa, Email_Contacto, Telefono_Contacto, RUC, Razon_social, Direccion_Fiscal, Direccion_Empresa, Contrasena_Hash, Fecha_Registro)
VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

$stmt = $conn->prepare($sql);
$stmt->bind_param("sssssssss", $nombre_empresa, $email, $telefono, $ruc, $razon_social, $direccion_fiscal, $direccion_empresa, $contrasena_hash, $fecha_registro);

if ($stmt->execute()) {
    echo "Empresa registrada exitosamente";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

// Cerrar conexión
$stmt->close();
$conn->close();
?>