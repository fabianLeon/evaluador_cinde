<?php

/**
 * Description of daoSession
 *
 * @author Fabian
 */
class daoSession {

    var $database;

    /**
     * constructor de la clase
     */
    function daoSession($db) {
        $this->database = $db;
    }

    function inicioSesion($estudiante,$pass){
        $sql = "select concat(n_nombres,' ',n_apellido1) from evaluador.estudiante where pk_estudiante like '$estudiante' and p_contrasena like '$pass'";
        $result = $this->database->ejecutarConsulta($sql);
        return ($this->database->transformarResultado($result));
    }

}