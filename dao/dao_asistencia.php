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
        SELECT  s.fk_cohorte_grupo,
        				tp.n_tipo_grupo t_grupo,
        				g.n_grupo grupo,
        				concat(p.n_nombres,' ',p.n_apellido1) profesor,
        				s.d_sesion fecha,
        				s.q_encuentro encuentro,
        				s.pk_sesion sesion, cg.*
        FROM		evaluador.grupo g, evaluador.profesor p,
        				evaluador.evaluacion e, evaluador.cohorte c,
        				evaluador.tipo_grupo tp,
        				evaluador.sesion s, evaluador.cohorte_grupo cg
        WHERE		tp.pk_tipo_grupo = g.fk_tipo_grupo and
        				cg.pk_cohorte_grupo = s.fk_cohorte_grupo and
        				cg.fk_profesor = p.pk_profesor and
        				cg.fk_grupo = g.pk_grupo and
        				s.d_sesion = '$fecha' and
        				s.ESTADO LIKE 'LISTA'
        group by pk_sesion order by pk_sesion";
        //echo $sql;

        $result = $this->database->ejecutarConsulta($sql);
        return ($this->database->transformarResultado2($result));
    }

    function set_estudiante_pendiente($estudiante, $cohorte_grupo_old, $e) {
        $sql = "
                UPDATE evaluador.estudiante_cohorte_grupo ecg SET
                fk_estado = $e
                WHERE
                ecg.fk_cohorte_grupo = $cohorte_grupo_old and
                ecg.fk_estudiante like '$estudiante' ";
        //echo $sql.'<br>';
        $result = $this->database->ejecutarConsulta($sql);
        return ($this->database->transformarResultado2($result));
    }

    function reprogramacion($estudiante, $cohorte_grupo_new, $e) {
        $sql = "INSERT INTO evaluador.estudiante_cohorte_grupo(fk_cohorte_grupo, fk_estudiante, fk_estado) values ($cohorte_grupo_new,'$estudiante', $e)";
        //echo $sql;
        $result = $this->database->ejecutarConsulta($sql);
        return ($this->database->transformarResultado2($result));
    }

    function sesiones_disponibles($grupo, $fecha, $hoy) {
        $sql = "

        SELECT  s.fk_cohorte_grupo,
        				tp.n_tipo_grupo t_grupo,
        				g.n_grupo grupo,
        				concat(p.n_nombres,' ',p.n_apellido1) profesor,
        				s.d_sesion fecha,
        				s.q_encuentro encuentro,
        				s.pk_sesion sesion, cg.*, g.*
        FROM		evaluador.grupo g, evaluador.profesor p,
        				evaluador.evaluacion e, evaluador.cohorte c,
        				evaluador.tipo_grupo tp,
        				evaluador.sesion s, evaluador.cohorte_grupo cg
        WHERE		tp.pk_tipo_grupo = g.fk_tipo_grupo and
        				cg.pk_cohorte_grupo = s.fk_cohorte_grupo and
        				cg.fk_profesor = p.pk_profesor and
        				cg.fk_grupo = g.pk_grupo and
                g.pk_grupo = $grupo and
                s.d_sesion != '$fecha' and
                s.d_sesion >= '$hoy' and
        				s.ESTADO LIKE 'LISTA'
        group by pk_sesion order by fecha";
        // echo $sql;

        $result = $this->database->ejecutarConsulta($sql);
        return ($this->database->transformarResultado2($result));
    }

    function consulta_estudiantes($sesion, $estado) {
        $sql = "
            SELECT  e.pk_estudiante codigo, concat(e.n_nombres,' ',e.n_apellido1,' ', e.n_apellido2) nombre, ecg.fk_estado estado
            FROM 	  evaluador.estudiante e, evaluador.estudiante_cohorte_grupo ecg,
                        evaluador.sesion s, evaluador.cohorte_grupo cg
            WHERE	  s.pk_sesion = $sesion and
                    e.pk_estudiante = ecg.fk_estudiante and
                    s.fk_cohorte_grupo = cg.pk_cohorte_grupo and
                    s.fk_cohorte_grupo = ecg.fk_cohorte_grupo";
        //echo $sql;
        $result = $this->database->ejecutarConsulta($sql);

        return ($this->database->transformarResultado2($result));
    }

    function insertar_asistencia($data) {
        $sesion = $data[0]->{'sesion'};
        $sql = '';
        $result = [];
        for ($i = 1; $i < count($data); $i ++) {
            $codigo = $data[$i]->{'codigo'};
            $sql = "SELECT evaluador.new_evaluacion('$codigo',$sesion);";
            $result = $this->database->ejecutarConsulta($sql);
        }
        $sql1 = " UPDATE evaluador.sesion s SET s.ESTADO='PENDIENTE' WHERE s.pk_sesion = '$sesion'";
        //echo $sql;
        $result = $this->database->ejecutarConsulta($sql1);
        //echo $sql . $result;
    }

}
