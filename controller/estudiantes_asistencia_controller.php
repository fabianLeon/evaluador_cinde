<?php

include '../dao/dao.php';
include '../conf.php';
include '../dao/dao_asistencia.php';

$dao = new dao(DB_HOST, DB_USER, DB_PASS, DB_NAME);
$dao->conectar();
$daoAsistencia = new daoAsistencia($dao);
session_start();

$sesion = $_GET['k_sesion'];
$result = $daoAsistencia->consulta_estudiantes($sesion);

echo json_encode($result);
