<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");
require_once 'conexion.php';

// 1. Verificar método POST
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
  http_response_code(405);
  echo json_encode(['success' => false, 'error' => 'Método no permitido. Se requiere POST']);
  exit;
}

// 2. Obtener y validar datos
$data = json_decode(file_get_contents('php://input'), true);

$required = ['job_id', 'nombre', 'email', 'universidad'];
foreach ($required as $field) {
  if (empty($data[$field])) {
    http_response_code(400);
    echo json_encode(['success' => false, 'error' => "El campo $field es requerido"]);
    exit;
  }
}

// 3. Sanitizar datos
$job_id = filter_var($data['job_id'], FILTER_SANITIZE_NUMBER_INT);
$nombre = htmlspecialchars($data['nombre']);
$email = filter_var($data['email'], FILTER_SANITIZE_EMAIL);

// 4. Conexión y query
try {
  $db = (new Conexion())->obtenerConexion();
  
  $stmt = $db->prepare("INSERT INTO aplicaciones (
    id_puesto, nombre_postulante, email_postulante, telefono,
    id_universidad, url_cv, mensaje, fecha_aplicacion
  ) VALUES (?, ?, ?, ?, ?, ?, ?, NOW())");
  
  $stmt->bind_param(
    "isssiss",
    $job_id,
    $nombre,
    $email,
    $data['telefono'],
    $data['universidad'],
    $data['cv_url'],
    $data['mensaje']
  );

  if (!$stmt->execute()) {
    throw new Exception("Error al guardar: " . $stmt->error);
  }

  echo json_encode(['success' => true, 'message' => 'Aplicación registrada']);
  
} catch (Exception $e) {
  http_response_code(500);
  echo json_encode(['success' => false, 'error' => $e->getMessage()]);
}
?>