<?php

include '../dao/dao.php';
include '../conf.php';
include '../dao/dao_asistencia.php';

$dao = new dao(DB_HOST, DB_USER, DB_PASS, DB_NAME);
$dao->conectar();
$daoAsistencia = new daoAsistencia($dao);
session_start();

$grupo      = $_GET['grupo'];
$estudiante = $_GET['estudiante'];
$profesor   = $_GET['profesor'];
$cohorte    = $_GET['cohorte'];

$result = $daoAsistencia->set_estudiante_pendiente($grupo, $estudiante, $profesor, $cohorte);

echo json_encode($result);
