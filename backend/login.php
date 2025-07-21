<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");

$input = json_decode(file_get_contents("php://input"), true);

$email = $input['email'] ?? '';
$password = $input['password'] ?? '';

$conn = new mysqli("localhost", "root", "8858", "bolsa_trabajo", 3306);

if ($conn->connect_error) {
    http_response_code(500);
    echo json_encode(["message" => "Error de conexión"]);
    exit();
}

$stmt = $conn->prepare("SELECT * FROM usuario WHERE email = ?");
$stmt->bind_param("s", $email);
$stmt->execute();

$result = $stmt->get_result();
$user = $result->fetch_assoc();

if (!$user || $password !== $user['password_hash']) {
    http_response_code(401);
    echo json_encode(["message" => "Credenciales incorrectas"]);
    exit();
}

echo json_encode([
    "message" => "Login exitoso",
    "role" => $user['rol']
]);

$stmt->close();
$conn->close();
?>
