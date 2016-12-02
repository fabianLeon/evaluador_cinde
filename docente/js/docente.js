
////------------------------------------------------------------------------------
//---------------------- Mi aplicacion (miEvaluador) ---------------------------

var docente = angular.module('docente', []);


//--------------------------------------------------------------------------------
//-------------------  Controlador de inicio de sesion  --------------------------
docente.controller('inicio_sesion', function ($scope, $http) {

    var ctrl = this;
    ctrl.info = '';
    //ctrl.evaluacion = eval;

    ctrl.inicioSesion = function () {
        console.log('informacion');
        data = {user: ctrl.codigo, password: ctrl.password, table: 'profesor'};
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



