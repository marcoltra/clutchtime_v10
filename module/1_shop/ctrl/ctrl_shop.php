<?php
$path = $_SERVER['DOCUMENT_ROOT'] . '/clutchtime_v10';
include($path . "/module/1_shop/model/DAO_shop.php");

switch ($_GET['op']) {
    case 'view':
        include('module/1_shop/view/shop.html');
        break;

    case 'getEntradas':
    $desde = $_POST['desde'];
    $items = $_POST['items'];
    try {
        $dao = new DAOShop();
        $data = $dao->select_entradas($desde, $items);
    } catch (Exception $e) {
        echo json_encode("error");
        exit;
    }
    if (!empty($data)) {
        echo json_encode($data);
    } else {
        echo json_encode("error");
    }
    break;


case 'details_entrada':
    $id   = $_GET['id'];
    $tipo = $_GET['tipo'];
    try {
        $daoshop = new DAOShop();
        $Date_entrada = $daoshop->select_one_entrada($id, $tipo);
    } catch (Exception $e) {
        echo json_encode("error");
    }
    if (!empty($Date_entrada)) {
        echo json_encode($Date_entrada);
    } else {
        echo json_encode("error");
    }
    break;


    case 'filters':
    try {
        $daoFilter = new DAOShop();
        $Dates_filter_entr = $daoFilter->select_filter_entradas();
    } catch (Exception $e) {
        echo json_encode("error");
    }
    if (!empty($Dates_filter_entr)) {
        echo json_encode($Dates_filter_entr);
        exit;
    } else {
        echo json_encode("error");
    }
    break;

    case 'home_filter':
    $opc = $_GET['opc'];
    $valor = $_GET['valor'];
    try {
        $daoFilter = new DAOShop();
        $Dates_filter_entr = $daoFilter->select_filter_home($opc, $valor);
    } catch (Exception $e) {
        echo json_encode("error");
    }
    if (!empty($Dates_filter_entr)) {
        echo json_encode($Dates_filter_entr);
        exit;
    } else {
        echo json_encode("error");
    }
    break;
    case 'search_filter':
    $equipo    = $_POST['equipo'] ?? '0';
    $ciudad    = $_POST['ciudad'] ?? '0';
    $temporada = $_POST['temporada'] ?? '0';

    try {
        $dao = new DAOShop();
        if ($equipo != '0' && $ciudad == '0' && $temporada == '0') {
            $rdo = $dao->select_equipo_search($equipo);
        } else if ($equipo == '0' && $ciudad != '0' && $temporada == '0') {
            $rdo = $dao->select_ciudad_search($ciudad);
        } else if ($equipo == '0' && $ciudad == '0' && $temporada != '0') {
            $rdo = $dao->select_temporada_search($temporada);
        } else if ($equipo != '0' && $ciudad != '0' && $temporada == '0') {
            $rdo = $dao->select_equipo_ciudad_search($equipo, $ciudad);
        } else if ($equipo != '0' && $ciudad == '0' && $temporada != '0') {
            $rdo = $dao->select_equipo_temporada_search($equipo, $temporada);
        } else if ($equipo == '0' && $ciudad != '0' && $temporada != '0') {
            $rdo = $dao->select_ciudad_temporada_search($ciudad, $temporada);
        } else if ($equipo != '0' && $ciudad != '0' && $temporada != '0') {
            $rdo = $dao->select_all_search($equipo, $ciudad, $temporada);
        } else {
            $rdo = $dao->select_entradas(0, 20);
        }
    } catch (Exception $e) {
        echo json_encode("error");
        exit;
    }
    if (!$rdo) {
        echo json_encode("error");
        exit;
    } else {
        $dinfo = array();
        foreach ($rdo as $row) {
            array_push($dinfo, $row);
        }
        echo json_encode($dinfo);
    }
    break;


    case 'order_filter':
    $opc_order  = $_GET['order'];
    $total_prod = $_POST['total_prod'];
    $items_page = $_POST['items_page'];

    try {
        $daoshop = new DAOShop();
        if ($opc_order == "0") {
            $Dates_Entradas = $daoshop->select_entradas(0, 20);
        } else {
            $Dates_Entradas = $daoshop->select_entradas_order($opc_order, $total_prod, $items_page);
        }
    } catch (Exception $e) {
        echo json_encode("error");
    }
    if (!empty($Dates_Entradas)) {
        echo json_encode($Dates_Entradas);
    } else {
        echo json_encode("error");
    }
    break;
    case 'count_entr_pag':
    try {
        $dao = new DAOShop();
        $rdo = $dao->select_count_entradas();
    } catch (Exception $e) {
        echo json_encode("error");
        exit;
    }
    if (!$rdo) {
        echo json_encode("error");
        exit;
    } else {
        $dinfo = array();
        foreach ($rdo as $row) {
            array_push($dinfo, $row);
        }
        echo json_encode($dinfo);
    }
    break;

    case 'count_entr_filters':
    try {
        $dao = new DAOShop();
        $rdo = $dao->count_filter_entradas();
    } catch (Exception $e) {
        echo json_encode("error");
        exit;
    }
    if (!$rdo) {
        echo json_encode("error");
        exit;
    } else {
        $dinfo = array();
        foreach ($rdo as $row) {
            array_push($dinfo, $row);
        }
        echo json_encode($dinfo);
    }
    break;

    case 'count_order_filter':
    $order = $_POST['value_orderby'][0]['order'];
    try {
        $dao = new DAOShop();
        $rdo = $dao->count_entradas_order($order);
    } catch (Exception $e) {
        echo json_encode("error");
        exit;
    }
    if (!$rdo) {
        echo json_encode("error");
        exit;
    } else {
        $dinfo = array();
        foreach ($rdo as $row) {
            array_push($dinfo, $row);
        }
        echo json_encode($dinfo);
    }
    break;

    case 'count_entr_related':
    $tipo = $_POST['type_entr'];
    try {
        $dao = new DAOShop();
        $rdo = $dao->count_entradas_related($tipo);
    } catch (Exception $e) {
        echo json_encode("error");
        exit;
    }
    if (!$rdo) {
        echo json_encode("error");
        exit;
    } else {
        $dinfo = array();
        foreach ($rdo as $row) {
            array_push($dinfo, $row);
        }
        echo json_encode($dinfo);
    }
    break;


   case 'entr_related':
    $tipo   = $_POST['type'];
    $loaded = $_POST['loaded'];
    $items  = $_POST['items'];
    try {
        $dao = new DAOShop();
        $rdo = $dao->select_entradas_related($tipo, $loaded, $items);
    } catch (Exception $e) {
        echo json_encode("error");
        exit;
    }
    if (!$rdo) {
        echo json_encode("error");
        exit;
    } else {
        $dinfo = array();
        foreach ($rdo as $row) {
            array_push($dinfo, $row);
        }
        echo json_encode($dinfo);
    }
    break;
    default:
        include($path . "/view/inc/error404.php");
        break;
}
