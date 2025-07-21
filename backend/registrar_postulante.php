<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");

$data = json_decode(file_get_contents('php://input'), true);

$conn = new mysqli("localhost", "root", "", "bolsa_trabajo", 3306);

if ($conn->connect_error) {
    die(json_encode(["error" => "Connection failed: " . $conn->connect_error]));
}

// Antes de ejecutar la inserción, valida los campos requeridos
$requiredFields = ['ID_Postulante', 'Carrera', 'Nombre', 'Email_Estudiante']; // Todos los NOT NULL
foreach ($requiredFields as $field) {
    if (empty($data[$field])) {
        http_response_code(400);
        die(json_encode(["error" => "El campo $field es obligatorio"]));
    }
}

// Luego prepara la consulta SQL
$stmt = $conn->prepare("INSERT INTO POSTULANTE 
    (ID_Postulante, Carrera, Año_Ingreso, Nombre, Apellido, Email_Estudiante, Teléfono_Estudiante, ID_Universidad, rol, password_hash) 
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

$stmt->bind_param("isissssiss", 
    $data['ID_Postulante'],
    $data['Carrera'],  // Asegúrate que este valor no sea null
    $data['Año_Ingreso'] ?? date('Y'), // Valor por defecto si no se especifica
    $data['Nombre'],
    $data['Apellido'] ?? '', // Valor por defecto
    $data['Email_Estudiante'],
    $data['Teléfono_Estudiante'] ?? '+51', // Valor por defecto
    $data['ID_Universidad'] ?? 301, // Valor por defecto
    $data['rol'] ?? 'postulante',
    password_hash($data['password'] ?? 'temp123', PASSWORD_DEFAULT)
);

$conn->close();
?>