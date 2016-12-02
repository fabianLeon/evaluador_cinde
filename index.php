<!DOCTYPE html>
<html lang="en">
    <?php include_once 'templates/head.php';
    ?>
    <body ng-app="miEvaluador">
        <?php
        include_once 'templates/header.php';
        ?>
        <!-- *****************************************************************************************************************
         BLUE WRAP
         ***************************************************************************************************************** -->
        <div id="blue">
            <div class="container">
                <div class="row">
                    <h3>Inicio de Sesión.</h3>
                </div><!-- /row -->
            </div> <!-- /container -->
        </div><!-- /blue -->
        <!-- *****************************************************************************************************************
         CONTACT FORMS
         ***************************************************************************************************************** -->
        <div class="container mtb" ng-controller="inicio_sesion as ctrl">
            <div class="row">
                <div class="col-lg-4 col-lg-offset-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="ctitle" style="text-align: center">Sistema de Evaluacion</h3>
                            <h4 style="text-align: center">Bienvenido al sistema de evaluacion!</h4>
                        </div>
                        <div class="panel-body">
                            <br>
                            <form role="form" method="POST">
                                <?php // if (isset($_GET['e'])) { ?>
                                <h5 class="ctitle" style="text-align: center">{{ctrl.info}}</h5>
                                <?php //} ?>
                                <div class="form-group">
                                    <input type="text" class="form-control" ng-model="ctrl.codigo" name="inputEmail" id="inputEmail" required="" placeholder="* Codigo Estudiante">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" ng-model="ctrl.password" name="inputPassword" id="inputPassword" required="" placeholder="* Contraseña ">
                                </div>
                                <div style="text-align: center">
                                    <button type="submit" class="btn btn-theme" ng-click="ctrl.inicioSesion()">Iniciar Sesión</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div><! --/col-lg-8 -->
            </div><! --/row -->
        </div><! --/container -->
        <!-- *****************************************************************************************************************
         FOOTER
         ***************************************************************************************************************** -->
        <!-- <?php //include_once 'templates/footer.php';  ?> -->
        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
    </body>
</html>