<?php

include '../dao/dao.php';
include '../conf.php';
include '../dao/dao_evaluacion.php';

$dao = new dao(DB_HOST, DB_USER, DB_PASS, DB_NAME);
$dao->conectar();
$daoEvaluacion = new daoEvaluacion($dao);
session_start();
$evaluacion= $_GET['k_evaluacion'];

$resp = $daoEvaluacion->consulta_respuestas($evaluacion);
$respuestas_json = json_encode($resp);
echo $respuestas_json;
