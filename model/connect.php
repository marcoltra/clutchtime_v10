<?php
class connect
{
    public static function con()
    {
        $host = '127.0.0.1';
        $user = "root";
        $pass = "";
        $db = "clutchtime_bd";

        $conexion = mysqli_connect($host, $user, $pass, $db);
        if (!$conexion) {
            die("Error de conexión: " . mysqli_connect_error());
        }mysqli_set_charset($conexion, 'utf8mb4');
        return $conexion;
    }
    public static function close(&$conexion)
    {
        mysqli_close($conexion);
        $conexion = null;
    }
}