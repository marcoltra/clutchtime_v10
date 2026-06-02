<?php
    $path = $_SERVER['DOCUMENT_ROOT'] . '/clutchtime_v10';
    include($path . "/module/home/model/DAOHome.php");

    switch ($_GET['op']) {
        case 'view';
            include ('module/home/view/home.html');
        break;

        case 'getEventos':
        try {
            $daohome = new DAOHome();
            $data = $daohome->select_eventos();
        } catch(Exception $e) {
            echo json_encode("error");
            exit;
        }
        if (!empty($data)) {
            echo json_encode($data);
        } else {
            echo json_encode("error");
        }
        break;
        

        case 'getPartidos':
        try {
            $daohome = new DAOHome();
            $data = $daohome->select_partidos();
        } catch(Exception $e) {
            echo json_encode("error");
            exit;
        }
        if (!empty($data)) {
            echo json_encode($data);
        } else {
            echo json_encode("error");
        }
        break;

        case 'getEquipos':
        try {
            $daohome = new DAOHome();
            $data = $daohome->select_equipos();
        } catch(Exception $e) {
            echo json_encode("error");
            exit;
        }
        if (!empty($data)) {
            echo json_encode($data);
        } else {
            echo json_encode("error");
        }
        break;
        case 'getJugadores':
        try {
            $daohome = new DAOHome();
            $data = $daohome->select_jugadores();
        } catch(Exception $e) {
            echo json_encode("error");
            exit;
        }
        if (!empty($data)) {
            echo json_encode($data);
        } else {
            echo json_encode("error");
        }
        break;
         case 'getCategorias':
        try {
            $daohome = new DAOHome();
            $data = $daohome->select_categorias();
        } catch(Exception $e) {
            echo json_encode("error");
            exit;
        }
        if (!empty($data)) {
            echo json_encode($data);
        } else {
            echo json_encode("error");
        }
        break;

        default;
            include($path ."/view/inc/error404.php");
        break;
    }
?>