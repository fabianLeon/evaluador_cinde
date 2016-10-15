<?php

/**
 * Description of daoSession
 *
 * @author Fabian
 */
class daoAsistencia {

    var $database;

    /**
     * constructor de la clase
     */
    function daoAsistencia($db) {
        $this->database = $db;
    }

    function consulta_session($fecha) {
        $sql = "	
        SELECT          s.fk_grupo,
                        s.fk_profesor,
                        tp.n_tipo_grupo t_grupo,
                        g.n_grupo grupo,
                        concat(p.n_nombres,' ',p.n_apellido1) profesor, 
                        s.d_sesion fecha,
                        s.q_encuentro encuentro,
                        s.pk_sesion sesion, s.fk_cohorte
        FROM		evaluador.grupo g, evaluador.profesor p,
                        evaluador.evaluacion e, evaluador.cohorte c,
                        evaluador.tipo_grupo tp,
                        evaluador.sesion s
        WHERE		tp.pk_tipo_grupo = g.fk_tipo_grupo and
                        s.fk_profesor = p.pk_profesor and
                        s.fk_grupo = g.pk_grupo and
                        s.d_sesion = '$fecha' and
                        s.ESTADO LIKE 'LISTA'
                        group by pk_sesion order by pk_sesion";
        //echo $sql;

        $result = $this->database->ejecutarConsulta($sql);
        return ($this->database->transformarResultado2($result));
    }
    function set_estudiante_pendiente($grupo,$estudiante, $profesor, $cohorte){
        $sql = "UPDATE evaluador.estudiante_cohorte_grupo SET
                fk_estado = 3 
                WHERE 
                fk_estudiante= '$estudiante' and 
                fk_grupo_cohorte = '$cohorte' and
                fk_grupo='$grupo' and 
                fk_profesor='$profesor' and 
                fk_estado = 1";
        $result = $this->database->ejecutarConsulta($sql);
        return ($this->database->transformarResultado2($result));
    }

    function sesiones_disponibles($grupo, $fecha) {
        $sql = "	
        SELECT          s.fk_grupo,
                        s.fk_profesor,
                        tp.n_tipo_grupo t_grupo,
                        g.n_grupo grupo,
                        concat(p.n_nombres,' ',p.n_apellido1) profesor, 
                        s.d_sesion fecha,
                        s.q_encuentro encuentro,
                        s.pk_sesion sesion, s.fk_cohorte
        FROM		evaluador.grupo g, evaluador.profesor p,
                        evaluador.evaluacion e, evaluador.cohorte c,
                        evaluador.tipo_grupo tp,
                        evaluador.sesion s
        WHERE		tp.pk_tipo_grupo = g.fk_tipo_grupo and
                        s.fk_profesor = p.pk_profesor and
                        s.fk_grupo = g.pk_grupo and
                        g.pk_grupo = $grupo and
                        s.d_sesion > '$fecha' and
                        s.ESTADO LIKE 'LISTA'
                        group by pk_sesion order by fecha";
        // echo $sql;

        $result = $this->database->ejecutarConsulta($sql);
        return ($this->database->transformarResultado2($result));
    }

    function consulta_estudiantes($sesion, $estado) {
        $sql = "
            SELECT      e.pk_estudiante codigo, concat(e.n_nombres,' ',e.n_apellido1,' ', e.n_apellido2) nombre
            FROM 	evaluador.estudiante e, evaluador.estudiante_cohorte_grupo ecg, 
                        evaluador.sesion s
            WHERE	s.pk_sesion = $sesion and
                        ecg.fk_estado = $estado and
                        e.pk_estudiante = ecg.fk_estudiante and
                        s.fk_cohorte = ecg.fk_grupo_cohorte and
                        s.fk_grupo = ecg.fk_grupo and
                        s.fk_profesor = ecg.fk_profesor 
                ";
        //echo $sql;
        $result = $this->database->ejecutarConsulta($sql);

        return ($this->database->transformarResultado2($result));
    }

    function insertar_asistencia($data) {
        $sesion = $data[0];
        $sql = '';
        $result = [];
        for ($i = 1; $i < count($data); $i ++) {
            $codigo = $data[$i]->{'codigo'};
            $sql = "SELECT evaluador.new_evaluacion('$codigo',$sesion);";
            $result = $this->database->ejecutarConsulta($sql);
        }
        $sql1 = " UPDATE evaluador.sesion s SET s.ESTADO='PENDIENTE' WHERE s.pk_sesion = '$sesion'";
        $result = $this->database->ejecutarConsulta($sql1);
        echo $sql . $result;
    }

}
