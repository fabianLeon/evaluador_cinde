//-----------------------------------------------------------------------------
//------------------  HERRAMIENTA PARA GENERACION DE PDF  ---------------------

////------------------------------------------------------------------------------
//---------------------- Mi aplicacion (miEvaluador) ---------------------------

var admin = angular.module('administrativo', []);
//--------------------------------------------------------------------------------
//-------------------  Controlador lista asistencia  --------------------------
admin.controller('lista_asistencia', function ($scope, $http) {

    var ctrl = this;
    ctrl.estudiantes = [];
    ctrl.estudiantes_impresion = [];
    ctrl.sesion_actual = {};
    ctrl.sesion = 0;
    ctrl.i = 0;
    console.log(ctrl.sesion_actual);
    ctrl.fecha = new Date();
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
    ctrl.asistencia = function (sesion) {
        for (var i = 0; i < ctrl.sesiones.lenght; i++) {
            if (ctrl.sesiones[i].sesion === sesion.sesion) {
                ctrl.sesion_actual = ctrl.sesiones[i];
            }
        }
        ctrl.sesion = sesion;
        $http.get('../controller/estudiantes_asistencia_controller.php?k_sesion=' + sesion.sesion).success(function (estu) {
            ctrl.estudiantes = estu;
        });
    };
    ctrl.get_sesiones();

    ctrl.get_estudiantes = function () {
        for (var i = 1; i <= ctrl.estudiantes.length ; i++) {
            ctrl.estudiantes_impresion = [''+i, ctrl.estudiantes.codigo, ctrl.estudiantes.nombre, '___________________']
        }
    };

    ctrl.generar_lista_asistencia = function () {
        var lista = {
            content: [
                {
                    table: {
                        // headers are automatically repeated if the table spans over multiple pages
                        // you can declare how many rows should be treated as headers
                        headerRows: 1,
                        widths: ['*', 'auto', 100, '*'],
                        body: [
                            ['#', 'Código', 'Nombres y apellidos', 'Firma'],
                            ctrl.estudiantes_impresion,
                            [{text: 'Bold value', bold: true}, 'Val 2', 'Val 3', 'Val 4']
                        ]
                    }
                }
            ]

        };
        return lista;
    };
    ctrl.guardar_lista = function () {
        var lista = ctrl.generar_lista_asistencia();
        var archivo = ctrl.sesion.profesor + '_' + ctrl.get_fecha(ctrl.fecha);
        pdfMake.createPdf(lista).download(archivo);
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
                    ).then(function () {
                window.locationf = "asistencia.php";
            });
            window.locationf = "asistencia.php";
        });
    };
});
//--------------------------------------------------------------------------------
//-------------------  Controlador de inicio de sesion  --------------------------
admin.controller('inicio_sesion', function ($scope, $http) {

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