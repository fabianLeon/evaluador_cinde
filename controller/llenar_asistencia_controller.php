<?php

include '../dao/dao.php';
include '../conf.php';
include '../dao/dao_asistencia.php';

$dao = new dao(DB_HOST, DB_USER, DB_PASS, DB_NAME);
$dao->conectar();
$daoAsistencia = new daoAsistencia($dao);
session_start();

$data = json_decode(file_get_contents("php://input"));
$daoAsistencia->insertar_asistencia($data);
//echo json_encode($data);
