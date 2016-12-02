<?php

include '../dao/dao.php';
include '../conf.php';
include '../dao/dao_asistencia.php';

$dao = new dao(DB_HOST, DB_USER, DB_PASS, DB_NAME);
$dao->conectar();
$daoAsistencia = new daoAsistencia($dao);
session_start();

$estudiante          = $_GET['estudiante'];
$cohorte_grupo_old   = $_GET['cohorte_grupo_old'];
$e   = $_GET['e'];

$result = $daoAsistencia->set_estudiante_pendiente($estudiante, $cohorte_grupo_old, $e);

echo json_encode($result);
