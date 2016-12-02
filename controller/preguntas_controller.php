<?php

include '../dao/dao.php';
include '../conf.php';
include '../dao/dao_evaluacion.php';

$dao = new dao(DB_HOST, DB_USER, DB_PASS, DB_NAME);
$dao->conectar();
$daoEvaluacion = new daoEvaluacion($dao);
session_start();
$evaluacion= $_GET['k_evaluacion'];

$preguntas = $daoEvaluacion->consulta_preguntas($evaluacion);
$preguntas_json = json_encode($preguntas);
echo $preguntas_json;