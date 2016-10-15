<!DOCTYPE html>
<html>
    <?php include_once 'templates_admin/head.php'; ?>
    <body ng-app="administrativo">
        <?php include_once 'templates_admin/header.php'; ?>
        <div id="blue">
            <div class="container">
                <div class="row">
                </div><!-- /row -->
            </div> <!-- /container -->
        </div><!-- /blue -->
        <div class="container">
            <div ng-controller="lista_asistencia as ctrl">
                <div class="col-md-3" >
                    <div class="panel panel-primary" >
                        <div class="panel-heading" align="center"><h5>FECHA DE LA SESION ...</h5></div>
                        <div class="panel-body">
                            <input class="form-control" type="date" ng-model="ctrl.fecha" ng-change="ctrl.get_sesiones()">
                        </div>
                    </div>
                    <ul class="nav nav-list">
                        <li class="nav-header">Sesiones </li>
                        <li ng-repeat="s in ctrl.sesiones" >
                            <a href="#" ng-click="ctrl.asistencia(s)">
                                {{s.t_grupo}}-{{s.grupo}},{{s.profesor}}
                            </a>
                        </li>
                        <li class="nav-header" ng-click="ctrl.asistencia(0)">
                            {{ctrl.msg}}
                        </li>
                    </ul>
                </div>

                <div class="col-md-9" >
                    <div class="panel panel-primary" >
                        <div class="panel-heading" align="center"><h5>FECHA DE LA SESION ...</h5></div>

                        <div class="panel-body">
                            <div class="col-md-9" >
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <tbody>
                                            <tr>
                                                <th>{{ctrl.sesion.fk_cohorte}}</th>
                                                <th>{{ctrl.sesion.t_grupo + ' ' + ctrl.sesion.grupo}}</th>
                                                <th>{{ctrl.sesion.profesor}}</th>
                                                <th>{{ctrl.sesion.encuentro}}</th>
                                                <th>{{ctrl.sesion.fecha| date:'fullDate'}}</th>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="col-md-3" >
                                <button type="submit" class="btn btn-theme" ng-click="ctrl.imprimir_lista()">
                                    <span class="glyphicon glyphicon-print" aria-hidden="true"></span>
                                </button>

                                <button type="submit" class="btn btn-theme" ng-click="ctrl.guardar_lista()">
                                    <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>
                                </button>

                                <button type="submit" class="btn btn-theme" ng-click="ctrl.ver_lista()">
                                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                </button>
                            </div>
                        </div>

                    </div>
                    <div class="panel panel-primary" >
                        <div class="panel-heading" align="center"><h5>LISTADO</h5></div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Codigo </th>
                                            <th>Estudiante </th>
                                            <th>Programar </th>

            <!-- <th>Hora llegada </th>
            <th>Hora Salida </th> -->
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr ng-repeat="e in ctrl.estudiantes">
                                            <th>{{$index + 1}}</th>
                                            <th>{{e.codigo}}</th>
                                            <th>{{e.nombre}}</th>
                                            <th>
                                                <button type="submit" class="btn btn-theme btn btn-xs" ng-click="ctrl.reasignar(e.codigo)">
                                                    <span class="glyphicon glyphicon-share-alt" aria-hidden="true"></span>
                                                </button>
                                                 <button type="submit" class="btn btn-theme btn btn-xs" ng-click="ctrl.pendiente_reprogramacion(e.codigo)">
                                                    <span class="glyphicon glyphicon-flag" aria-hidden="true"></span>
                                                </button>
                                            </th>
                                           
                                            <!--<th><input ng-model="e.hora_ll" type=time min=8:00 max=17:00 step=900 value="08:00:00"></th>
                                            <th><input ng-model="e.hora_sa" type=time min=8:00 max=17:00 step=900 value="17:00:00"></th>-->
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>  
                </div>
                <!-- <div class="col-md-6" >
                        <div class="panel panel-info">
                            <div class="panel-body">
                                <pre>{{ctrl.estudiantes| json}}</pre>
                            </div>
                        </div>
                    </div>
                -->
            </div>
        </div>
    </body>
</html>