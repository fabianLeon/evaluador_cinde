<!DOCTYPE html>
<html lang="en">
    <?php include_once 'templates_admin/head.php';
    ?>
    <body ng-app="administrativo">
        <?php
        include_once 'templates_admin/header.php';
        ?>
        <!-- *****************************************************************************************************************
         BLUE WRAP
         ***************************************************************************************************************** -->
        <div id="blue">
            <div class="container">
                <div class="row">
                    <h3>Nueva Evaluación</h3>
                </div><!-- /row -->
            </div> <!-- /container -->
        </div><!-- /blue -->
        <!-- *****************************************************************************************************************
         CONTACT FORMS
         ***************************************************************************************************************** -->
        <div class="container mtb" >
            <div class="row">
                <div class="col-lg-6">
                    <div ng-controller="formulario as ctrl">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <br>
                                <div class="form-group">
                                    <label>Ingrese el Nombre de la evaluación</label>
                                    <input type="text" class="form-control" ng-model="ctrl.evaluacion.nombre" name="nombre_evaluacion" id="nombre_evaluacion" required="" placeholder="* Nombre de la Evaluación" autocomplete="off">
                                </div>
                                <div class="form-group">
                                    <label>Ingrese la Introducción de la evaluación</label>
                                    <textarea type="text" class="form-control" ng-model="ctrl.evaluacion.introduccion" name="introducción_evaluacion" id="introducción_evaluacion" required="" placeholder="* Introducción de la evaluación"autocomplete="off"></textarea>
                                </div>
                                <div class="panel panel-info">

                                    <div class="panel-heading">Nueva Pregunta</div>
                                    <div class="panel-body">

                                        <div class="form-group">
                                            <label>Ingrese el enunciado de la pregunta</label>
                                            <textarea type="text" class="form-control" ng-model="ctrl.enunciado" name="enunciado_abierta" id="enunciado_abierta" required="" placeholder="* Enunciado" autocomplete="off"></textarea>
                                        </div>     
                                        <div class="col-md-6">
                                            <button type="button" class="btn btn-info btn-xs" ng-click="ctrl.nueva_pregunta('A')">
                                                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Añadir Pregunta Abierta
                                            </button>
                                        </div>
                                        <div class="col-md-6">
                                            <div align="right">
                                                <button type="button" class="btn btn-info btn-xs" ng-click="ctrl.nueva_pregunta('C')">
                                                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Añadir Pregunta Cerrada
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div><!--/col-lg-6 -->

                <div ng-controller="vista_evaluacion as ctrl">
                    <div class="col-md-6" >
                        <div class="panel panel-primary" >
                            <div class="panel-heading" align="center"><h1>{{ctrl.evaluacion.nombre}}</h1></div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <tbody>
                                            <tr>
                                                <th>Linea/Seminario</th>
                                                <th>Profesor </th>
                                                <th>No. de Encuentro </th>
                                                <th>Fecha </th>
                                            </tr>
                                            <tr>
                                                <th> Nombre de la Sesión</th>
                                                <th> Nombre del Profesor</th>
                                                <th> #n </th>
                                                <th>1 de Enero de 2016</th>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <!Este es un Comentario>
                            <div class="panel-heading">{{ctrl.evaluacion.introduccion}} </div>
                            <div class="panel-body">

                                <div ng-repeat="pregunta in ctrl.evaluacion.preguntas">

                                    <div class="panel panel-primary" >

                                        <div class="panel-heading">{{pregunta.id}}. {{pregunta.enunciado}}
                                            <button type="submit" class="btn btn-danger btn-xs" ng-click="ctrl.remover_pregunta(pregunta.id)">
                                                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                            </button>
                                        </div>

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
            </div><!--/row -->
        </div><!--/container -->
        <!-- *****************************************************************************************************************
         FOOTER
         ***************************************************************************************************************** -->
        <!-- <?php //include_once 'templates/footer.php';                       ?> -->
        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
    </body>
</html>