<?php

include '../dao/dao.php';
include '../conf.php';
include '../dao/dao_evaluacion.php';

$dao = new dao(DB_HOST, DB_USER, DB_PASS, DB_NAME);
$dao->conectar();
$daoEvaluacion = new daoEvaluacion($dao);
session_start();

$data = json_decode(file_get_contents("php://input"));

$daoEvaluacion->insertar_respuestas($data,$_SESSION['k_estudiante']);