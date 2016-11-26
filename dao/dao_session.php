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

    function inicioSesion($user,$pass,$table){
        $sql = "select concat(n_nombres,' ',n_apellido1) from evaluador.$table where pk_$table like '$user' and p_contrasena like '$pass'";
        $result = $this->database->ejecutarConsulta($sql);
        return ($this->database->transformarResultado($result));
    }

}