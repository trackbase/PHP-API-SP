<?php
$requestMethod = $_SERVER["REQUEST_METHOD"];
include('../class/clsAlumnos.php');
$Alumno = new Alumno();
switch($requestMethod) {
	case 'GET':
		$empId = '';	
		if($_GET['id']) {
			$intAlumno = $_GET['id'];
			$Alumno->set_intAlumno($intAlumno);
		}
		$AlumnoInfo = $Alumno->borrarAlumno();
		if(!empty($AlumnoInfo)) {
	      $js_encode = json_encode(array('status'=>TRUE, 'message'=>'Alumno borrado correctamente.'), true);
        } else {
            $js_encode = json_encode(array('status'=>FALSE, 'message'=>'Alumno borrado incorrectamente.'), true);
        }
		header('Content-Type: application/json');
		echo $js_encode;
		break;
	default:
	header("HTTP/1.0 405 Method Not Allowed");
	break;
}
?>