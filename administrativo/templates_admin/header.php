<?php session_start();
//if(!$_SESSION || $_SERVER['REQUEST_URI'] !=  '/evaluador_cinde/index.php'){
  //  header('Location: session_destroy.php');
//}
?>
<div class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="session_destroy.php">
                <img src="../img/logo2.png" class="img-responsive" style="max-width: 100px; margin-top: -20px">
            </a>
        </div>
        <div class="navbar-collapse collapse navbar-right">
            <ul class="nav navbar-nav">
                <?php if ($_SESSION) { ?>
                    <li><a href="reprogramar.php">PROGRAMACIONES</a></li>
                    <li><a href="nueva_evaluacion.php">NUEVA EVALUACIÓN</a></li>
                    <li><a href="asistencia.php">ASISTENCIA</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class='glyphicon glyphicon-user' aria-hidden='true'>
                            </span><?php echo(" " . $_SESSION['user']); ?> <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="session_destroy.php">CERRAR SESIÓN</a></li>
                        </ul>
                    </li>
                <?php } else { ?>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <span class='glyphicon glyphicon-user' aria-hidden='true'></span>  USUARIO <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="index.php">INICIAR SESION</a></li>
                        </ul>
                    </li>
                <?php } ?>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</div>
