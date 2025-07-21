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
$password = '@LUPE22turbo';  // ← tu contraseña real
$db = 'bolsa_trabajo';

$conexion = new mysqli($host, $user, $password, $db);
if ($conexion->connect_error) {
    http_response_code(500);
    echo json_encode(['message' => '❌ Error de conexión: ' . $conexion->connect_error]);
    exit;
}

// Obtener datos enviados en JSON
$data = json_decode(file_get_contents("php://input"), true);

$email = $data['email'] ?? '';
$passwordIngresada = $data['password'] ?? '';

if (empty($email) || empty($passwordIngresada)) {
    http_response_code(400);
    echo json_encode(['message' => '❌ Correo y contraseña son requeridos.']);
    exit;
}

// Buscar usuario por email
$stmt = $conexion->prepare("SELECT ID_Postulante, Nombre, password, rol FROM POSTULANTE WHERE Email_Estudiante = ?");
$stmt->bind_param("s", $email);
$stmt->execute();
$resultado = $stmt->get_result();

if ($resultado->num_rows === 0) {
    http_response_code(401);
    echo json_encode(['message' => '❌ Correo no registrado.']);
    exit;
}

$usuario = $resultado->fetch_assoc();

// Verificar contraseña
if (!password_verify($passwordIngresada, $usuario['password'])) {
    http_response_code(401);
    echo json_encode(['message' => '❌ Contraseña incorrecta.']);
    exit;
}

// Si todo bien, devolver datos básicos
echo json_encode([
    'message' => '✅ Inicio de sesión exitoso',
    'postulante' => [
        'id' => $usuario['ID_Postulante'],
        'nombre' => $usuario['Nombre'],
        'rol' => $usuario['rol']
    ]
]);

$stmt->close();
$conexion->close();
?>
