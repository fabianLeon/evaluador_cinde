
////------------------------------------------------------------------------------
//---------------------- Mi aplicacion (miEvaluador) ---------------------------

var docente = angular.module('docente', []);


//--------------------------------------------------------------------------------
//-------------------  Controlador lista asistencia  --------------------------
docente.controller('lista_asistencia', function ($scope, $http) {

    var ctrl = this;
    ctrl.estudiantes = [];
    ctrl.sesion_actual = {};
    ctrl.sesion = 0;
    ctrl.i = 0;

    $http.get('../controller/asistencia_controller.php').success(function (data) {
        console.log(data);
        ctrl.sesiones = data;
        ctrl.msg = 'Sesiones Pendientes:  ' + data.length;
    });
    ctrl.asistencia = function (sesion) {
        for (var i = 0; i < ctrl.sesiones.lenght; i++) {
            if (ctrl.sesiones[i].sesion === sesion) {
                ctrl.sesion_actual = ctrl.sesiones[i];
            }
        }
        ctrl.sesion = sesion;
        $http.get('../controller/estudiantes_asistencia_controller.php?k_sesion=' + sesion).success(function (estu) {
            ctrl.estudiantes = estu;
        });

    };

    ctrl.enviar_asistencia = function () {
        swal({
            title: 'Enviar Lista de Asistencia',
            text: "Este proceso es irreversible y no podra añadir otro estudiante!<br><br> Está Seguro que desea enviar ahora la lista de asistencia?",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si, Enviar',
            cancelButtonText: 'Cancelar'
        }).then(function () {
            var envio = [];
            envio.push(ctrl.sesion);
            for (var i = 0; i < ctrl.estudiantes.length; i++) {
                if (ctrl.estudiantes[i].check) {
                    envio.push(ctrl.estudiantes[i]);
                }
            }
            console.log(envio);
            $http.post('../controller/llenar_asistencia_controller.php', envio).success(function (datos) {
                console.log(datos);
            });
            swal(
                    'Lista de Asistencia Enviada!',
                    'Su Lista de Asistencia Fue enviada Exitosamente',
                    'success'
                    );
        });

    };

});


//-----------------------------------------------------------------------------
//--------------------------  Fabrica de Evalucion   --------------------------

docente.factory('eval', function () {
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
docente.controller('inicio_sesion', function ($scope, $http) {

    var ctrl = this;
    ctrl.info = '';
    //ctrl.evaluacion = eval;

    ctrl.inicioSesion = function () {
        console.log('informacion');
        data = {user: ctrl.codigo, password: ctrl.password, table: 'administrativo'};
        $http.post('../controller/session_start_controller.php', data).success(function (info) {
            swal({
                title: 'Informacion de Acceso...!',
                text: info,
                timer: 1200
            });
            if (info !== 'El usuario o la contraseña no son correctas') {
                setTimeout(function () {
                    location.href = "asistencia.php";
                }, 1500);
            }
        });
    };
});

//--------------------------------------------------------------------------------
//---------------  Controlador de evaluaciones pendientes  -----------------------

docente.controller('pendientes', function ($scope, $http, eval) {

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
docente.controller('controladorEvaluacion', function ($scope, $http, eval) {
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


