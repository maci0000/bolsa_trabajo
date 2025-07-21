
<?php
class Conexion {
    private $host = "localhost";
    private $usuario = "root";
    private $contrasena = "";
    private $base_datos = "bolsa_trabajo";
    private $conexion;

    public function __construct() {
        $this->conexion = new mysqli(
            $this->host, 
            $this->usuario, 
            $this->contrasena, 
            $this->base_datos
        );

        if ($this->conexion->connect_error) {
            die("Error de conexión: " . $this->conexion->connect_error);
        }

        $this->conexion->set_charset("utf8mb4");
    }

    public function obtenerConexion() {
        return $this->conexion;
    }

    public function cerrarConexion() {
        $this->conexion->close();
    }
}
?>