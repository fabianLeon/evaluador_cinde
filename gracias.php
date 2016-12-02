<!DOCTYPE html>
<html lang="en">
    <?php include_once 'templates/head.php';
    ?>

    <body>

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

        <div class="container">
            <div class="alert alert-success" role="alert">
                Bien Hecho! Gracias por contestar exitosamente la evaluación,
                si deseas ir a aula virtual <a href="http://virtual.cinde.org.co/" class="alert-link"> haz click aqui!</a>
            </div>
            <div class="alert alert-success" role="alert">
                Si deseas regresar al modulo de evaluacion <a href="pendiente.php" class="alert-link"> haz click aqui!</a>
            </div>

        </div>


        <!-- *****************************************************************************************************************
         FOOTER
         ***************************************************************************************************************** -->
        <?php //include_once 'templates/footer.php'; ?>
        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
    </body>
</html>