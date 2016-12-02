//-----------------------------------------------------------------------------
//------------------  HERRAMIENTA PARA GENERACION DE PDF  ---------------------



////------------------------------------------------------------------------------
//---------------------- Mi aplicacion (administrativo) ---------------------------

var admin = angular.module('administrativo', []);
//--------------------------------------------------------------------------------
//-------------------  Controlador lista asistencia  --------------------------
admin.controller('lista_asistencia', function ($scope, $http, $filter, $window) {


    var ctrl = this;
    ctrl.estudiante_reprogramar = null;
    ctrl.e_reprogramar = {};
    ctrl.estudiantes = [];
    ctrl.sesiones_disponibles = [];
    ctrl.estudiantes_impresion = [];
    ctrl.sesion_actual = {};
    ctrl.sesion = 0;
    ctrl.i = 0;
    ctrl.cambio;
    ctrl.codigo = null;
    ctrl.fecha = new Date();
    ctrl.actualizar = function (codigo) {

        ctrl.e_reprogramar = JSON.parse(ctrl.estudiante_reprogramar);
        console.log(ctrl.e_reprogramar);
        swal({
            title: 'REPROGRAMAR',
            text: "Está Seguro que desea reprogramar el estudiante con codigo " + ctrl.codigo + " a \n " +
                    "Cohórte : \t" + ctrl.e_reprogramar.fk_cohorte + "\n" +
                    ctrl.e_reprogramar.t_grupo + ": \t" + ctrl.e_reprogramar.grupo + "\n" +
                    "Profesor(a) : \t" + ctrl.e_reprogramar.profesor + "\n" +
                    "Fecha: \t" + ctrl.e_reprogramar.fecha,
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si',
            cancelButtonText: 'Cancelar'
        }).then(function () {

            var cadena1 = '../controller/reprogramar_pendiente_controller.php?' +
                    'cohorte_grupo_old=' + ctrl.sesion.fk_cohorte_grupo +
                    '&estudiante=' + codigo +
                    '&e=4';
            console.log(cadena1);
            $http.get(cadena1).success(function (data) {
             console.log(data);
            });

            var cadena2 = '../controller/reprogramacion_controller.php?' +
                    'cohorte_grupo_new=' + ctrl.e_reprogramar.fk_cohorte_grupo +
                    '&estudiante=' + codigo +
                    '&e=5';
                      $http.get(cadena2).success(function (data) {
                        console.log(data);
                      });
            console.log(cadena2);
            swal({
                text: 'El estudiante con código ' + codigo + ' cambió de grupo a'
            }).then(function () {
                ctrl.asistencia(ctrl.sesion);
            });
        });

        ctrl.codigo = null;
        ctrl.cambio = false;
        ctrl.estudiante_reprogramar = null;

    };
    ctrl.get_fecha = function (now) {
        var month = (now.getMonth() + 1);
        var day = now.getDate();
        if (month < 10)
            month = "0" + month;
        if (day < 10)
            day = "0" + day;
        var today = now.getFullYear() + '-' + month + '-' + day;
        return today;
    };
    ctrl.get_sesiones = function () {

        $http.get('../controller/asistencia_controller.php?date=' + ctrl.get_fecha(ctrl.fecha)).success(function (data) {
            console.log(data);
            ctrl.sesiones = data;
            ctrl.msg = 'Sesiones Pendientes:  ' + data.length;
        });
    };

    ctrl.get_sesiones_disponibles = function () {

        $http.get('../controller/reprogramacion_disponibles_controller.php?grupo=' +
                ctrl.sesion.fk_grupo + '&fecha=' + ctrl.get_fecha(ctrl.fecha) +
                '&hoy=' + ctrl.get_fecha(new Date)).success(function (data) {
                  console.log(data);
            ctrl.sesiones_disponibles = data;
        });

    };


    ctrl.reasignar = function (codigo) {
        ctrl.codigo = codigo;
        ctrl.cambio = true;
    };

    ctrl.asistencia = function (sesion) {
        for (var i = 0; i < ctrl.sesiones.lenght; i++) {
            if (ctrl.sesiones[i].sesion === sesion.sesion) {
                ctrl.sesion_actual = ctrl.sesiones[i];

            }
        }
        ctrl.sesion = sesion;
        $http.get('../controller/estudiantes_asistencia_controller.php?k_sesion=' + sesion.sesion).success(function (estu) {
            console.log(estu);
            ctrl.estudiantes = estu;
        });
        ctrl.get_sesiones_disponibles();
    };
    ctrl.get_sesiones();


    ctrl.pendiente_reprogramacion = function (codigo) {

        swal({
            title: 'PENDIENTE POR REPROGRAMACIÓN',
            text: "Está Seguro que desea cambiar el estado del estudiante?",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si',
            cancelButtonText: 'Cancelar'
        }).then(function () {
            var cadena = '../controller/reprogramar_pendiente_controller.php?' +
                    'cohorte_grupo_old=' + ctrl.sesion.fk_cohorte_grupo +
                    '&estudiante=' + codigo +
                    '&e=3';
            console.log(cadena);
            $http.get(cadena).success(function (data) {
                console.log(data);
            });
            swal({
                text: 'El estudiante con código ' + codigo + ' cambió su estado a ' +
                        'PENDIENTE POR REPROGRAMACIÓN, no aparecerá más en esta lista'
            }).then(function () {
                ctrl.asistencia(ctrl.sesion);
            });
        });



    };

    ctrl.get_estudiantes = function () {
        ctrl.estudiantes_impresion = [];
        ctrl.estudiantes_impresion.push(['#', 'Código', 'Nombres y apellidos', 'Firma']);
        for (var i = 0; i < ctrl.estudiantes.length; i++) {
            ctrl.estudiantes_impresion.push(['' + (i + 1), ctrl.estudiantes[i][0], ctrl.estudiantes[i][1], '']);
        }
        return ctrl.estudiantes_impresion;

    };

    ctrl.generar_lista_asistencia = function () {
        ctrl.get_estudiantes();
        var lista = {
            pageSize: 'LETTER',
            content: [
                {
                    text: 'MAESTRÍA EN DESARROLLO EDUCATIVO Y SOCIAL\n' +
                            'UPN ' + ctrl.sesion.fk_cohorte + ' - '
                            + ctrl.sesion.t_grupo + ' ' + ctrl.sesion.grupo + '\n' +
                            ctrl.sesion.profesor + '\n' +
                            $filter('date')(ctrl.fecha, "fullDate") + '\n\n',
                    style: 'header'
                }
                , {
                    table: {
                        style: 'demoTable',
                        // headers are automatically repeated if the table spans over multiple pages
                        // you can declare how many rows should be treated as headers
                        headerRows: 1,
                        widths: [15, 70, 300, 100],
                        body: ctrl.estudiantes_impresion
                    }
                }
            ],
            styles: {
                header: {
                    bold: true,
                    color: '#000',
                    fontSize: 14,
                    alignment: 'center'
                },
                demoTable: {
                    color: '#666',
                    fontSize: 10
                }
            }

        };
        return lista;
    };
    ctrl.guardar_lista = function () {
        var lista = ctrl.generar_lista_asistencia();
        var archivo = ctrl.sesion.profesor + '_' + ctrl.get_fecha(ctrl.fecha);
        pdfMake.createPdf(lista).download(archivo);
    };
    ctrl.imprimir_lista = function () {
        var lista = ctrl.generar_lista_asistencia();
        var archivo = ctrl.sesion.profesor + '_' + ctrl.get_fecha(ctrl.fecha);
        pdfMake.createPdf(lista).print(archivo);
    };
    ctrl.ver_lista = function () {
        var lista = ctrl.generar_lista_asistencia();
        var archivo = ctrl.sesion.profesor + '_' + ctrl.get_fecha(ctrl.fecha);
        pdfMake.createPdf(lista).open(archivo);
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
            });
            swal(
                    'Lista de Asistencia Enviada!',
                    'Su Lista de Asistencia Fue enviada Exitosamente',
                    'success'
                    ).then(function () {
                ctrl.get_sesiones();
            });
        });
    };


});//--end controller lista_asistencia
//--------------------------------------------------------------------------------
//-------------------  Controlador de inicio de sesion  --------------------------
admin.controller('inicio_sesion', function ($scope, $http) {

    var ctrl = this;
    ctrl.info = '';
    //ctrl.evaluacion = eval;

    ctrl.inicioSesion = function () {
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
//-----------------------------------------------------------------------------
//--------------------------  Fabrica de Evalucion   --------------------------

admin.factory('eval', function () {
    var servicio = {
        id_pregunta: 0,
        nombre: '',
        introduccion: '',
        preguntas: [],
        respuestas: [],
        nueva_pregunta: function (data) {
            servicio.preguntas.push(data);
            servicio.id_pregunta = servicio.id_pregunta + 1;
        },
        nueva_respuesta: function (respuesta) {
            servicio.respuestas.push(respuesta);
        },
        remove_pregunta: function (id) {
            servicio.preguntas.splice(id - 1, 1);
            for (var i = 0; i < $(servicio.preguntas).size(); i++) {
                servicio.preguntas[i].id = i + 1;
            }
            servicio.id_pregunta--;
        }
    };
    return servicio;
});
//--------------------------------------------------------------------------------
//--------------------  Controlador de form evaluacion ---------------------------
admin.controller('formulario', function ($http, eval) {
    var ctrl = this;
    ctrl.evaluacion = eval;
    ctrl.evaluacion.id_pregunta++;
    ctrl.nueva_pregunta = function (tipo) {
        if ($('#enunciado_abierta').val().length > 0) {
            ctrl.id++;
            var resp = {enunciado: ctrl.enunciado, tipo: tipo, id: ctrl.evaluacion.id_pregunta};
            ctrl.evaluacion.nueva_pregunta(resp);
            ctrl.enunciado = '';
        } else {
            swal({
                title: 'Espera...!',
                text: 'Debes añadir un enunciado para crear una pregunta.',
                timer: 1000
            });
        }
    };
}
);
//--------------------------------------------------------------------------------
//--------------------  Controlador de vista previa evaluaciones  -----------------------------
admin.controller('vista_evaluacion', function ($http, eval) {
    var ctrl = this;
    ctrl.evaluacion = eval;
    ctrl.remover_pregunta = function (id) {
        ctrl.evaluacion.remove_pregunta(id);
    };
}
);
