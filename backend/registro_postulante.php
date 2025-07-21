<?php
// Mostrar errores para depuración
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Encabezados
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');

// Conexión a la base de datos
$host = 'localhost';
$user = 'root';
$password = '@LUPE22turbo';  // tu contraseña de MySQL
$db = 'bolsa_trabajo';

$conexion = new mysqli($host, $user, $password, $db);
if ($conexion->connect_error) {
    http_response_code(500);
    echo json_encode(['message' => 'Error de conexión: ' . $conexion->connect_error]);
    exit;
}

// Obtener datos del cuerpo del request (JSON)
$data = json_decode(file_get_contents("php://input"), true);

// Validar campos requeridos
$requeridos = ['Nombre', 'Apellido', 'Email_Estudiante', 'password', 'Carrera', 'Año_Ingreso', 'Teléfono_Estudiante', 'ID_Universidad'];
foreach ($requeridos as $campo) {
    if (empty($data[$campo])) {
        http_response_code(400);
        echo json_encode(['message' => "❌ Falta el campo requerido: $campo"]);
        exit;
    }
}

// Extraer datos
$nombre        = $data['Nombre'];
$apellido      = $data['Apellido'];
$email         = $data['Email_Estudiante'];
$password      = $data['password'];
$carrera       = $data['Carrera'];
$anioIngreso   = $data['Año_Ingreso'];
$telefono      = $data['Teléfono_Estudiante'];
$idUniversidad = $data['ID_Universidad'];

// Consulta SIN el campo rol (se usará valor por defecto)
$stmt = $conexion->prepare("INSERT INTO POSTULANTE (
    Carrera, Año_Ingreso, Nombre, Apellido, Email_Estudiante,
    Teléfono_Estudiante, ID_Universidad, password
) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");

if (!$stmt) {
    http_response_code(500);
    echo json_encode(['message' => '❌ Error en prepare: ' . $conexion->error]);
    exit;
}

$stmt->bind_param("sissssis", $carrera, $anioIngreso, $nombre, $apellido, $email, $telefono, $idUniversidad, $password);

if ($stmt->execute()) {
    echo json_encode(['message' => '✅ Registro exitoso']);
} else {
    http_response_code(500);
    echo json_encode(['message' => '❌ Error al registrar: ' . $stmt->error]);
}

$stmt->close();
$conexion->close();
