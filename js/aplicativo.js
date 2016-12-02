
////------------------------------------------------------------------------------
//---------------------- Mi aplicacion (miEvaluador) ---------------------------

var evaluador = angular.module('miEvaluador', []);

//-----------------------------------------------------------------------------
//--------------------------  Fabrica de Evalucion   --------------------------

evaluador.factory('eval', function () {
    var servicio = {
        usuario: '',
        id_usuario: '',
        abiertas: 0,
        cerradas: 0,
        preguntas: [],
        respuestas: [],
        objeto: {
            k_evaluacion: '',
            evaluacion: '',
            introduccion: '',
            t_grupo: '',
            profesor: '',
            grupo: '',
            encuentro: '',
            fecha: '',
            sesion: ''
        },
        objNuevo: function (k_evaluacion, evaluacion, introduccion, t_grupo, profesor, grupo, encuentro, fecha, sesion) {
            f = fecha.split('-');
            servicio.objeto.k_evaluacion = k_evaluacion;
            servicio.objeto.evaluacion = evaluacion;
            servicio.objeto.introduccion = introduccion;
            servicio.objeto.t_grupo = t_grupo;
            servicio.objeto.profesor = profesor;
            servicio.objeto.grupo = grupo;
            servicio.objeto.encuentro = encuentro;
            servicio.objeto.fecha = new Date(f[0], f[1] - 1, f[2]);
            servicio.objeto.sesion = sesion;
            console.log(fecha + ' ' + servicio.objeto.fecha);
        },
        cargar_preguntas: function (dato) {
            servicio.preguntas = dato;
            console.log(servicio.preguntas);
            for (var i = 0; i < servicio.preguntas.length; i++) {
                console.log(servicio.preguntas[i].tipo);
                if (servicio.preguntas[i].tipo === 'A') {
                    servicio.abiertas++;
                } else {
                    servicio.cerradas++;
                }
            }
            console.log('abiertas: ' + servicio.abiertas + ', cerradas: ' + servicio.cerradas)
        },
        cargar_respuestas: function (dato) {

            servicio.respuestas = dato;
            for (var i = 0; i < servicio.respuestas.length; i++) {
                console.log(servicio.respuestas[i].valor);
                servicio.respuestas[i].estado = 'old';
                servicio.respuestas[i].valor = null;
            }
            console.log("---------- RESPUESTA -----------");
            console.log(servicio.respuestas);
        }
    };
    return servicio;
});

//--------------------------------------------------------------------------------
//-------------------  Controlador de inicio de sesion  --------------------------
evaluador.controller('inicio_sesion', function ($scope, $http) {

    var ctrl = this;
    ctrl.info = '';
    //ctrl.evaluacion = eval;

    ctrl.inicioSesion = function () {
        console.log('informacion');
        data = {user: ctrl.codigo, password: ctrl.password, table:'estudiante'};
        $http.post('controller/session_start_controller.php', data).success(function (info) {
            swal({
                title: 'Informacion de Acceso ...!',
                text: info
            });
            if (info !== 'El usuario o la contraseña no son correctas') {
                setTimeout(function () {
                    location.href = "pendiente.php";
                }, 1500);
            }
        });
    };
});

//--------------------------------------------------------------------------------
//---------------  Controlador de evaluaciones pendientes  -----------------------

evaluador.controller('pendientes', function ($scope, $http, eval) {

    var ctrl = this;
    ctrl.msg = '';
    ctrl.evaluacion = eval;
    ctrl.evaluaciones_pendientes = [];
    $http.get('controller/pendiente_controller.php').success(function (data) {
        ctrl.evaluaciones_pendientes = data;
        ctrl.msg = 'Evaluaciones Pendientes:  ' + data.length;
    });

    ctrl.evaluacion_pendiente = function (k_evalu, evalu, introduccion, t_grupo, profesor, grupo, encuentro, fecha, sesion) {
        console.log(ctrl.evaluacion.objeto);
        eval.objNuevo(k_evalu, evalu, introduccion, t_grupo, profesor, grupo, encuentro, fecha, sesion);

        $http.get('controller/preguntas_controller.php?k_evaluacion=' + ctrl.evaluacion.objeto.k_evaluacion).success(function (preguntas) {
            eval.cargar_preguntas(preguntas);
        });

        $http.get('controller/respuestas_controller.php?k_evaluacion=' + ctrl.evaluacion.objeto.k_evaluacion).success(function (respuestas) {
            eval.cargar_respuestas(respuestas);
        });

    };

});
//--------------------------------------------------------------------------------
//--------------------  Controlador de evaluaciones  -----------------------------
evaluador.controller('controladorEvaluacion', function ($scope, $http, eval) {
    var ctrl = this;
    ctrl.evaluacion = eval;

    ctrl.asignar_nuevo = function (id) {
        var nuevo_concepto = $('#preg_' + id).val();
        if (nuevo_concepto != '') {
            eval.respuestas.push({pregunta: id, respuesta: nuevo_concepto, valor: 'LIKE', estado: 'new'});
            $('#preg_' + id).val('');
        }
    };

    ctrl.remove_resp = function (concepto) {
        for (var i = 0; i < eval.respuestas.length; i++) {
            if (eval.respuestas[i].respuesta === concepto) {
                eval.respuestas.splice(i, 1);
            }
        }
    };

    ctrl.enviar = function () {
        //window.location = "gracias.html";
        ctrl.enviar_respuestas();

    };
    ctrl.enviar_respuestas = function () {
        var respuestas = [];
        var ra = 0;
        var rc = 0;
        respuestas.push(eval.objeto);
        for (var i = 0; i < eval.respuestas.length; i++) {
            if (eval.respuestas[i].valor !== null) {
                respuestas.push(eval.respuestas[i]);
                if (eval.respuestas[i].valor === 'SELECT') {
                    rc++;
                } else {
                    ra++;
                }
            }
        }

        console.log('rc:' + rc + ',' + 'ra: ' + ra);
        if (rc >= eval.cerradas && ra >= eval.abiertas) {
            $http.post('controller/send_eval_controller.php', respuestas).success(function (data) {
                window.location = "gracias.php";
            });
        } else {
            swal({
                title: 'Espera...!',
                text: 'Aun no has terminado la evaluación.',
                timer: 1000
            });
        }

        //-------------------------------------------------------------------------------------
        //};
    };

    ctrl.limpiar = function (resp, id) {
        for (var i = 0; i < eval.respuestas.length; i++) {
            if (eval.respuestas[i].pregunta === id) {
                eval.respuestas[i].valor = null;
            }
        }
    };

}
);
