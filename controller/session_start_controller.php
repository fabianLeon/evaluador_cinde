<?php

include '../dao/dao.php';
include '../conf.php';
include '../dao/dao_session.php';
session_start();

$dao = new dao(DB_HOST, DB_USER, DB_PASS, DB_NAME);
$dao->conectar();
$daoSession = new daoSession($dao);

$data = json_decode(file_get_contents("php://input"));

if( $daoSession->inicioSesion($data->{'user'},$data->{'password'})){
    $result = $daoSession->inicioSesion($data->{'user'}, $data->{'password'});
    $_SESSION['user'] = $dao->strtoupper_utf8($result[0]);
    $_SESSION['k_estudiante'] = $data->{'user'};    
    echo ($_SESSION['user'].', Bienvenido Al Sistema Evaluador');
}else{
    echo ('El usuario o la contraseña no son correctas');
}