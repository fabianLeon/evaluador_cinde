<?php

include '../dao/dao.php';
include '../conf.php';
include '../dao/dao_evaluacion.php';

$dao = new dao(DB_HOST, DB_USER, DB_PASS, DB_NAME);
$dao->conectar();
$daoEvaluacion = new daoEvaluacion($dao);
session_start();
$estudiante = $_SESSION['k_estudiante'];

$result = $daoEvaluacion->consulta_pendientes($estudiante);

echo json_encode($result);
