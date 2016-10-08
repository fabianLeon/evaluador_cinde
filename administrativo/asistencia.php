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
                        <div class="panel-heading" align="center"><h1>LISTADO</h1></div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>ck</th>
                                            <th>Codigo </th>
                                            <th>Estudiante </th>
                                            <!-- <th>Hora llegada </th>
                                            <th>Hora Salida </th> -->
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr ng-repeat="e in ctrl.estudiantes">
                                            <th>{{$index+1}}</th>
                                            <th><input type ="checkbox" ng-model="e.check"></th>
                                            <th>{{e.codigo}}</th>
                                            <th>{{e.nombre}}</th>
                                            <!--<th><input ng-model="e.hora_ll" type=time min=8:00 max=17:00 step=900 value="08:00:00"></th>
                                            <th><input ng-model="e.hora_sa" type=time min=8:00 max=17:00 step=900 value="17:00:00"></th>-->
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <div style="text-align: center">
                                <button type="submit" class="btn btn-theme" ng-click="ctrl.enviar_asistencia()">Enviar Lista Asistencia</button>
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
