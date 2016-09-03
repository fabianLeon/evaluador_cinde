<?php

/**
 * Description of daoSession
 *
 * @author Fabian
 */
class daoEvaluacion {

    var $database;

    /**
     * constructor de la clase
     */
    function daoEvaluacion($db) {
        $this->database = $db;
    }

    function consulta_pendientes($estudiante) {
        $sql = "
        SELECT          tp.n_tipo_grupo t_grupo,
                        g.n_grupo grupo,
                        concat(p.n_nombres,' ',p.n_apellido1) profesor, 
                        e.n_evaluacion evaluacion, 
                        e.ln_introduccion introduccion, s.d_sesion fecha,s.q_encuentro encuentro,
                        e.pk_evaluacion k_evaluacion, s.pk_sesion sesion
        FROM		evaluador.grupo g, evaluador.profesor p,
                        evaluador.evaluacion e, evaluador.cohorte c,
                        evaluador.evaluacion_asistencia ea, evaluador.tipo_grupo tp,
                        evaluador.sesion s
        WHERE		ea.fk_evaluacion = e.pk_evaluacion and
                        ea.fk_estudiante like '$estudiante' and
                        tp.pk_tipo_grupo = g.fk_tipo_grupo and
                        ea.fk_sesion = s.pk_sesion and
                        s.fk_profesor = p.pk_profesor and
                        s.fk_grupo = g.pk_grupo and
                        ea.estado like	'PENDIENTE'
        GROUP BY 	n_evaluacion";
        //echo $sql;
        $result = $this->database->ejecutarConsulta($sql);

        return ($this->database->transformarResultado2($result));
    }

    function consulta_preguntas($evaluacion) {
        $sql = "select  p.* 
                from    evaluador.pregunta_evaluacion pe,
                        evaluador.pregunta p
                where 	pe.fk_evaluacion = $evaluacion and
                        fk_pregunta = p.pk_pregunta
                group by p.pk_pregunta
                ";
        //echo $sql;
        $result = $this->database->ejecutarConsulta($sql);

        return ($this->database->transformarResultado2($result));
    }

    function consulta_respuestas($evaluacion) {
        $sql = "select  er.fk_descripcion respuesta, er.fk_pregunta pregunta,
                        er.v_respuesta valor 
                from 	evaluador.evaluacion_respuesta er,
                        evaluador.pregunta p, 
                        evaluador.respuesta r
                where 	er.fk_evaluacion = $evaluacion and
                        er.fk_pregunta = p.pk_pregunta and
                        er.fk_descripcion like r.pk_descripcion and
                        r.estado like 'VIVO'
                group by er.fk_pregunta, er.fk_descripcion 
                order by pregunta,r.orden
                ";
        //echo $sql;
        $result = $this->database->ejecutarConsulta($sql);

        return ($this->database->transformarResultado2($result));
    }

    function insertar_respuestas($data, $estudiante) {
        $sesion = $data[0]->{'sesion'};
        $evaluacion = $data[0]->{'k_evaluacion'};
        for ($i = 1; $i < count($data); $i ++) {
            $respuesta = $data[$i]->{'respuesta'};
            $pregunta = $data[$i]->{'pregunta'};    
            $valor = $data[$i]->{'valor'};
            $sql = "insert into evaluador.evaluacion_respuesta values "
                    . "('$estudiante',$sesion, evaluador.new_concepto('$respuesta'),$pregunta, $evaluacion,'$valor')";
            $result = $this->database->ejecutarConsulta($sql);
        }
        $sql = "UPDATE evaluador.evaluacion_asistencia SET estado = 'OK' WHERE fk_sesion = $sesion and fk_estudiante like '$estudiante'";
        $result = $this->database->ejecutarConsulta($sql);
    }

}
