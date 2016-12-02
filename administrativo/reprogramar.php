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
                                        <tr align="center">
                                            <th>#</th>
                                            <th>Codigo </th>
                                            <th>Estudiante </th>

                                            <th ng-if="ctrl.sesiones_disponibles.length > 0">RP</th>
                                            <th>PPP </th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr ng-repeat="e in ctrl.estudiantes" ng-if="e.estado == '1'">
                                            <th>{{$index + 1}}</th>
                                            <th>{{e.codigo}}</th>
                                            <th>{{e.nombre}}</th>
                                            <th ng-if="ctrl.sesiones_disponibles.length > 0 && ctrl.codigo === e.codigo">
                                                <select class="form-control" name="repeatSesion" id="repeatSesion" ng-model="ctrl.estudiante_reprogramar" ng-change="ctrl.actualizar(e.codigo)" ng-show="ctrl.cambio">
                                                    <option ng-repeat="option in ctrl.sesiones_disponibles" value="{{option}}"> {{option.fecha}}</option>
                                                </select>
                                            </th>
                                            <th ng-if="ctrl.sesiones_disponibles.length > 0">
                                                <button type="submit" class="btn btn-theme btn btn-xs" ng-click="ctrl.reasignar(e.codigo)" ng-hide="ctrl.cambio">
                                                    <span class="glyphicon glyphicon-share-alt" aria-hidden="true"></span>
                                                </button>
                                            </th>
                                            <th>
                                                <button type="submit" class="btn btn-theme btn btn-xs" ng-click="ctrl.pendiente_reprogramacion(e.codigo)">
                                                    <span class="glyphicon glyphicon-flag" aria-hidden="true"></span>
                                                </button>
                                            </th>
                                        </tr>
                                        <tr ng-repeat="e in ctrl.estudiantes" ng-if="e.estado == '4'">
                                            <th style="background-color: #86895D">{{$index + 1}}</th>
                                            <th style="background-color: #86895D">{{e.codigo}}</th>
                                            <th style="background-color: #86895D">{{e.nombre}}</th>
                                            <th style="background-color: #86895D"> REPROGRAMADO</th>
                                        </tr>
                                        <tr ng-repeat="e in ctrl.estudiantes" ng-if="e.estado == '5'" >
                                            <th style="background-color: #FE9A2E" >{{$index + 1}}</th>
                                            <th style="background-color: #FE9A2E">{{e.codigo}}</th>
                                            <th style="background-color: #FE9A2E">{{e.nombre}}</th>
                                            <th style="background-color: #FE9A2E"> ASISTENTE</th>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
