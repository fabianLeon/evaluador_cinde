<?php

include '../dao/dao.php';
include '../conf.php';
include '../dao/dao_asistencia.php';

$dao = new dao(DB_HOST, DB_USER, DB_PASS, DB_NAME);
$dao->conectar();
$daoAsistencia = new daoAsistencia($dao);
session_start();

$grupo = $_GET['grupo'];
$fecha = $_GET['fecha'];

$result = $daoAsistencia->sesiones_disponibles($grupo, $fecha);

echo json_encode($result);
