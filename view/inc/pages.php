<?php
switch ($_GET['page'] ?? '') {

    case 'controller_home':
        $_GET['op'] = $_GET['op'] ?? 'view';
        include("module/home/controller/ctrl_home.php");
        break;

    case 'tienda':
        $_GET['op'] = $_GET['op'] ?? 'view';
        include("module/1_shop/ctrl/ctrl_shop.php");
        break;

    case '404':
        include("view/inc/error404.php");
        break;

    case '503':
        include("view/inc/error503.php");
        break;

    default:
        $_GET['op'] = $_GET['op'] ?? 'view';
        include("module/home/controller/ctrl_home.php");
        break;
}
?>
