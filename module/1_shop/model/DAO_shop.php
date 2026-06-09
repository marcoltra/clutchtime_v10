<?php
$path = $_SERVER['DOCUMENT_ROOT'] . '/clutchtime_v10';
include($path . "/model/connect.php");

class DAOShop{
	function select_entradas($desde, $items, $tipo = 'todos') {
    $conexion = connect::con();
    $retrArray = array();

    if ($tipo == 'todos' || $tipo == 'evento') {
        $sql_eventos = "SELECT 'evento' AS tipo, id_evento AS id,
                        nombre, imagen_url, fecha_inicio AS fecha
                        FROM eventos
                        LIMIT $desde, $items";
        $res = mysqli_query($conexion, $sql_eventos);
        while ($row = mysqli_fetch_assoc($res)) {
            $retrArray[] = $row;
        }
    }

    if ($tipo == 'todos' || $tipo == 'partido') {
        $sql_partidos = "SELECT 'partido' AS tipo, id_partido AS id,
                        estado AS nombre, imagen_url, fecha
                        FROM partidos
                        LIMIT $desde, $items";
        $res = mysqli_query($conexion, $sql_partidos);
        while ($row = mysqli_fetch_assoc($res)) {
            $retrArray[] = $row;
        }
    }

    connect::close($conexion);
    return $retrArray;
}
	function select_one_entrada($id, $tipo) {
    if ($tipo == 'evento') {
        $sql = "SELECT e.*, c.nombre AS nombre_ciudad
                FROM eventos e
                JOIN ciudades c ON e.id_ciudad = c.id_ciudad
                WHERE e.id_evento = '$id'";
    } else {
        $sql = "SELECT * FROM partidos p
                JOIN equipos el ON p.id_equipo_local = el.id_equipo
                JOIN equipos ev ON p.id_equipo_visitante = ev.id_equipo
                WHERE p.id_partido = '$id'";
    }
    $conexion = connect::con();
    $res = mysqli_query($conexion, $sql);
    connect::close($conexion);
    return mysqli_fetch_assoc($res);
}

function getFilters() {
    $conexion = connect::con();

    $sql_tipos      = "SELECT DISTINCT tipo FROM eventos";
    $sql_ciudades   = "SELECT id_ciudad, nombre FROM ciudades";
    $sql_temporadas = "SELECT id_temporada, nombre FROM temporadas";
    $sql_categorias = "SELECT id_categoria, nombre FROM categorias";

    $res_tipos      = mysqli_query($conexion, $sql_tipos);
    $res_ciudades   = mysqli_query($conexion, $sql_ciudades);
    $res_temporadas = mysqli_query($conexion, $sql_temporadas);
    $res_categorias = mysqli_query($conexion, $sql_categorias);

    connect::close($conexion);
    $retrArray = array();
    $tipos = array();
    while ($row = mysqli_fetch_assoc($res_tipos)) {
        $tipos[] = $row;
    }
    $ciudades = array();
    while ($row = mysqli_fetch_assoc($res_ciudades)) {
        $ciudades[] = $row;
    }
    $temporadas = array();
    while ($row = mysqli_fetch_assoc($res_temporadas)) {
        $temporadas[] = $row;
    }
    $categorias = array();
    while ($row = mysqli_fetch_assoc($res_categorias)) {
        $categorias[] = $row;
    }
    $retrArray['tipos']      = $tipos;
    $retrArray['ciudades']   = $ciudades;
    $retrArray['temporadas'] = $temporadas;
    $retrArray['categorias'] = $categorias;
    return $retrArray;
}
function select_filter_entradas() {
    $tipo_evento = $_GET['tipo_evento'] ?? '*';
    $ciudad      = $_GET['ciudad']      ?? '*';
    $temporada   = $_GET['temporada']   ?? '*';
    $filtros = "";
    if ($ciudad != '*') {
        $filtros .= " AND c.nombre = '$ciudad'";
    }
    if ($tipo_evento != '*') {
        $tipos = explode(",", $tipo_evento);
        $lista = "'" . implode("','", $tipos) . "'";
        $filtros .= " AND e.tipo IN ($lista)";
    }
    $sql = "SELECT 'evento' AS tipo, id_evento AS id,
            e.nombre, e.imagen_url, e.fecha_inicio AS fecha
            FROM eventos e
            JOIN ciudades c ON e.id_ciudad = c.id_ciudad
            WHERE 1=1 $filtros";
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
	function select_filter_home($opc, $valor) {
    if ($opc == 'equipo') {
        $sql = "SELECT 'partido' AS tipo, id_partido AS id,
                estado AS nombre, imagen_url, fecha
                FROM partidos p
                JOIN equipos el ON p.id_equipo_local = el.id_equipo
                JOIN equipos ev ON p.id_equipo_visitante = ev.id_equipo
                WHERE el.nombre = '$valor'
                OR ev.nombre = '$valor'";
    } else if ($opc == 'ciudad') {
        $sql = "SELECT 'evento' AS tipo, id_evento AS id,
                nombre, imagen_url, fecha_inicio AS fecha
                FROM eventos e
                JOIN ciudades c ON e.id_ciudad = c.id_ciudad
                WHERE c.nombre = '$valor'";
    } else {
        $sql = "SELECT 'evento' AS tipo, id_evento AS id,
                nombre, imagen_url, fecha_inicio AS fecha
                FROM eventos
                WHERE tipo = '$valor'";
    }

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

	//SEARCH////
function select_equipo_search($equipo) {
    $sql = "SELECT 'partido' AS tipo, id_partido AS id,
            estado AS nombre, imagen_url, fecha
            FROM partidos p
            JOIN equipos el ON p.id_equipo_local = el.id_equipo
            JOIN equipos ev ON p.id_equipo_visitante = ev.id_equipo
            WHERE el.id_equipo = '$equipo'
            OR ev.id_equipo = '$equipo'";

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

function select_ciudad_search($ciudad) {
    $sql = "SELECT 'evento' AS tipo, id_evento AS id,
            nombre, imagen_url, fecha_inicio AS fecha
            FROM eventos e
            JOIN ciudades c ON e.id_ciudad = c.id_ciudad
            WHERE c.id_ciudad = '$ciudad'";

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

function select_temporada_search($temporada) {
    $sql = "SELECT 'partido' AS tipo, id_partido AS id,
            estado AS nombre, imagen_url, fecha
            FROM partidos p
            JOIN temporadas t ON p.id_temporada = t.id_temporada
            WHERE t.nombre = '$temporada'";

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

function select_equipo_ciudad_search($equipo, $ciudad) {
    $sql = "SELECT 'partido' AS tipo, id_partido AS id,
            estado AS nombre, imagen_url, fecha
            FROM partidos p
            JOIN equipos el ON p.id_equipo_local = el.id_equipo
            JOIN equipos ev ON p.id_equipo_visitante = ev.id_equipo
            JOIN ciudades c ON el.id_ciudad = c.id_ciudad
            WHERE (el.id_equipo = '$equipo' OR ev.id_equipo = '$equipo')
            AND c.id_ciudad = '$ciudad'";

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

function select_equipo_temporada_search($equipo, $temporada) {
    $sql = "SELECT 'partido' AS tipo, id_partido AS id,
            estado AS nombre, imagen_url, fecha
            FROM partidos p
            JOIN equipos el ON p.id_equipo_local = el.id_equipo
            JOIN equipos ev ON p.id_equipo_visitante = ev.id_equipo
            JOIN temporadas t ON p.id_temporada = t.id_temporada
            WHERE (el.id_equipo = '$equipo' OR ev.id_equipo = '$equipo')
            AND t.nombre = '$temporada'";

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

function select_ciudad_temporada_search($ciudad, $temporada) {
    $sql = "SELECT 'partido' AS tipo, id_partido AS id,
            estado AS nombre, imagen_url, fecha
            FROM partidos p
            JOIN equipos el ON p.id_equipo_local = el.id_equipo
            JOIN temporadas t ON p.id_temporada = t.id_temporada
            JOIN ciudades c ON el.id_ciudad = c.id_ciudad
            WHERE c.id_ciudad = '$ciudad'
            AND t.nombre = '$temporada'";

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

function select_all_search($equipo, $ciudad, $temporada) {
    $sql = "SELECT 'partido' AS tipo, id_partido AS id,
            estado AS nombre, imagen_url, fecha
            FROM partidos p
            JOIN equipos el ON p.id_equipo_local = el.id_equipo
            JOIN equipos ev ON p.id_equipo_visitante = ev.id_equipo
            JOIN temporadas t ON p.id_temporada = t.id_temporada
            JOIN ciudades c ON el.id_ciudad = c.id_ciudad
            WHERE (el.id_equipo = '$equipo' OR ev.id_equipo = '$equipo')
            AND c.id_ciudad = '$ciudad'
            AND t.nombre = '$temporada'";

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

	function select_entradas_order($order, $desde, $items) {
    $sql = "SELECT 'evento' AS tipo, id_evento AS id,
            nombre, imagen_url, fecha_inicio AS fecha
            FROM eventos
            UNION ALL
            SELECT 'partido' AS tipo, id_partido AS id,
            estado AS nombre, imagen_url, fecha
            FROM partidos
            ORDER BY $order
            LIMIT $desde, $items";

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

	// COUNT PAGINATION
function select_count_entradas() {
    $sql = "SELECT COUNT(*) AS n_prod FROM eventos";
    $conexion = connect::con();
    $res = mysqli_query($conexion, $sql);
    connect::close($conexion);
    return $res; 
}
	function count_filter_entradas() {
    $ciudad = $_GET['ciudad'] ?? '*';
    $tipo   = $_GET['tipo']   ?? '*';

    $filtros = "";
    if ($ciudad != '*') {
        $filtros .= "AND c.nombre = '$ciudad'";
    }
    if ($tipo != '*') {
        $filtros .= "AND e.tipo = '$tipo'";
    }

    $sql = "SELECT COUNT(*) AS n_prod
            FROM eventos e
            JOIN ciudades c ON e.id_ciudad = c.id_ciudad
            WHERE 1=1 $filtros";

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

	function count_entradas_order($order) {
    $sql = "SELECT COUNT(*) AS n_prod
            FROM (
                SELECT id_evento AS id FROM eventos
                UNION ALL
                SELECT id_partido AS id FROM partidos
            ) AS total";

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
	function count_entradas_related($tipo) {
    $sql = "SELECT COUNT(*) AS n_prod
            FROM partidos
            WHERE estado = '$tipo'";

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

function select_entradas_related($tipo, $loaded, $items) {
    $sql = "SELECT 'partido' AS tipo, id_partido AS id,
            estado AS nombre, imagen_url, fecha
            FROM partidos
            WHERE estado = '$tipo'
            LIMIT $loaded, $items";

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
