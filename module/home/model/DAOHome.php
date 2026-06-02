<?php
	$path = $_SERVER['DOCUMENT_ROOT'] . '/clutchtime_v10';
	include($path . "/model/connect.php");
    
	class DAOHome {
		function select_eventos() {
        $sql = "SELECT e.*, c.nombre AS nombre_ciudad 
                FROM eventos e
                JOIN ciudades c ON e.id_ciudad = c.id_ciudad
                ORDER BY e.fecha_inicio DESC";

        $conexion = connect::con();
        $res = mysqli_query($conexion, $sql);
        connect::close($conexion);

        $retrArray = array();
        if (mysqli_num_rows($res) > 0) {
            while ($row = mysqli_fetch_assoc($res)) {
                $retrArray[] = $row;
            }
        }
        return $retrArray;
    }

		function select_partidos() {
        $sql = "SELECT p.*,
                el.nombre AS nombre_local,
                el.imagen_logo AS logo_local,
                el.color_principal AS color_local,
                ev.nombre AS nombre_visitante,
                ev.imagen_logo AS logo_visitante,
                ev.color_principal AS color_visitante
                FROM partidos p
                JOIN equipos el ON p.id_equipo_local = el.id_equipo
                JOIN equipos ev ON p.id_equipo_visitante = ev.id_equipo
                ORDER BY p.fecha DESC";

        $conexion = connect::con();
        $res = mysqli_query($conexion, $sql);
        connect::close($conexion);

        $retrArray = array();
        if (mysqli_num_rows($res) > 0) {
            while ($row = mysqli_fetch_assoc($res)) {
                $retrArray[] = $row;
            }
        }
        return $retrArray;
    }

		function select_equipos() {
        $sql = "SELECT e.*, c.nombre AS nombre_ciudad
                FROM equipos e
                JOIN ciudades c ON e.id_ciudad = c.id_ciudad
                ORDER BY e.nombre ASC";

        $conexion = connect::con();
        $res = mysqli_query($conexion, $sql);
        connect::close($conexion);

        $retrArray = array();
        if (mysqli_num_rows($res) > 0) {
            while ($row = mysqli_fetch_assoc($res)) {
                $retrArray[] = $row;
            }
        }
        return $retrArray;
    }
	function select_jugadores() {
        $sql = "SELECT j.*, 
                e.nombre AS nombre_equipo,
                e.color_principal AS color_equipo
                FROM jugadores j
                JOIN equipos e ON j.id_equipo = e.id_equipo
                WHERE j.activo = 1
                ORDER BY j.apellido ASC";

        $conexion = connect::con();
        $res = mysqli_query($conexion, $sql);
        connect::close($conexion);

        $retrArray = array();
        if (mysqli_num_rows($res) > 0) {
            while ($row = mysqli_fetch_assoc($res)) {
                $retrArray[] = $row;
            }
        }
        return $retrArray;
    }
		function select_categorias() {
        $sql = "SELECT * FROM categorias ORDER BY nivel ASC";

        $conexion = connect::con();
        $res = mysqli_query($conexion, $sql);
        connect::close($conexion);

        $retrArray = array();
        if (mysqli_num_rows($res) > 0) {
            while ($row = mysqli_fetch_assoc($res)) {
                $retrArray[] = $row;
            }
        }
        return $retrArray;
    }
	}