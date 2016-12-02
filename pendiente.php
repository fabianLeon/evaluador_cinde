<!DOCTYPE html>
<html>
    <?php include_once 'templates/head.php'; ?>
    <body ng-app="miEvaluador">
        <?php include_once 'templates/header.php'; ?>
        <div id="blue">
            <div class="container">
                <div class="row">
                </div><!-- /row -->
            </div> <!-- /container -->
        </div><!-- /blue -->
        <div class="container">
            <div ng-controller="pendientes as ctrl">
                <div class="col-md-3" >

                    <ul class="nav nav-list">
                        <li class="nav-header">Evalaciones Pendientes</li>
                        <li ng-repeat="e in ctrl.evaluaciones_pendientes" >
                            <a href="#" ng-click="ctrl.evaluacion_pendiente(e.k_evaluacion, e.evaluacion, e.introduccion, e.t_grupo, e.profesor, e.grupo, e.encuentro, e.fecha, e.sesion)">
                                {{e.grupo}},{{e.profesor}}, {{e.evaluacion}}
                            </a>
                        </li>
                        <li class="nav-header" ng-click="ctrl.evaluacion_pendiente('', '', '', '', '', '', '', '', '')">
                            {{ctrl.msg}}
                        </li>
                    </ul>
                </div>
            </div>
            <div ng-controller="controladorEvaluacion as ctrl">

                <div class="col-md-9" >
                    <div ng-if="ctrl.evaluacion.objeto.introduccion != ''">
                        <div class="panel panel-primary" >
                            <div class="panel-heading" align="center"><h1>{{ctrl.evaluacion.objeto.evaluacion}}</h1></div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <tbody>
                                            <tr>
                                                <th>{{ctrl.evaluacion.objeto.t_grupo}}</th>
                                                <th>Profesor </th>
                                                <th>No. de Encuentro </th>
                                                <th>Fecha </th>
                                            </tr>
                                            <tr>
                                                <th>{{ctrl.evaluacion.objeto.grupo}}</th>
                                                <th>{{ctrl.evaluacion.objeto.profesor}}</th>
                                                <th>{{ctrl.evaluacion.objeto.encuentro}}</th>
                                                <th>{{ctrl.evaluacion.objeto.fecha| date:'fullDate'}}</th>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <!Este es un Comentario>
                            <div class="panel-heading">{{ctrl.evaluacion.objeto.introduccion}} </div>
                            <div class="panel-body">

                                <div ng-repeat="pregunta in ctrl.evaluacion.preguntas">

                                    <div class="panel panel-primary" >
                                        <div class="panel-heading">{{pregunta.q_orden}}. {{pregunta.n_enunciado}}</div>
                                        <div ng-if="pregunta.tipo === 'A'">
                                            <div class="panel-body">
                                                <div ng-repeat="respuesta in ctrl.evaluacion.respuestas">
                                                    <div class="col-md-3" ng-if="respuesta.pregunta === pregunta.pk_pregunta">


                                                        <div ng-if="respuesta.estado === 'new'">
                                                            <div class="panel panel-info"  align ="right">
                                                                <div class="panel-heading">{{respuesta.respuesta + '    '}}
                                                                    <button type="submit" class="btn btn-danger btn-xs" ng-click="ctrl.remove_resp(respuesta.respuesta)">
                                                                        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                                                    </button>
                                                                </div>
                                                                <div class="panel-body"  align ="center">
                                                                    <form class=form-control>
                                                                        <input class="form-group" type="radio" name="name" ng-model="respuesta.valor" value="LIKE" disabled="">
                                                                        <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
                                                                        <input class="form-group" type="radio" name="name" ng-model="respuesta.valor" value="UNLIKE" disabled="">
                                                                        <span class="glyphicon glyphicon-thumbs-down" aria-hidden="true"></span>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div ng-if="respuesta.estado === 'old'">
                                                            <div class="panel panel-primary"  align ="center">
                                                                <div class="panel-heading">{{respuesta.respuesta}}</div>
                                                                <div class="panel-body"  align ="center">
                                                                    <form class=form-control>
                                                                        <input class="form-group" type="radio" name="name" ng-model="respuesta.valor" value="LIKE">
                                                                        <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
                                                                        <input class="form-group" type="radio" name="name" ng-model="respuesta.valor" value="UNLIKE">
                                                                        <span class="glyphicon glyphicon-thumbs-down" aria-hidden="true"></span>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="panel panel-info"  align ="center">
                                                        <form>
                                                            <div class="panel-heading">
                                                                <input type="text" class="form-control" id = "{{'preg_' + pregunta.pk_pregunta}}" placeholder="Nuevo Concepto ...">
                                                            </div>
                                                            <button type="submit" class="btn btn-info" ng-click="ctrl.asignar_nuevo(pregunta.pk_pregunta)">
                                                                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>   Agregar
                                                            </button>
                                                        </form>
                                                        <br>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div ng-if="pregunta.tipo === 'C'">
                                            <div class="panel-body">
                                                <div ng-repeat="respuesta in ctrl.evaluacion.respuestas" >
                                                    <div class="col-lg-6" ng-if="respuesta.pregunta === pregunta.pk_pregunta">
                                                        <input class="form-group" type="radio" name="name" ng-model="respuesta.valor" ng-mousedown="ctrl.limpiar(respuesta.respuesta, pregunta.pk_pregunta)" value="SELECT">
                                                        {{respuesta.respuesta}}
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-footer" align="right">
                                <button type="button" class="btn btn-info btn-lg" ng-click="ctrl.enviar()">
                                    <span class="glyphicon glyphicon-file" aria-hidden="true"></span>   Enviar Evaluación
                                </button>
                            </div>
                        </div>
                    </div>                   
                </div>
            </div>
        </div>
    </body>
</html>
