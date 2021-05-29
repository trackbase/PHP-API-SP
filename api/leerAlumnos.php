<?php
$requestMethod = $_SERVER["REQUEST_METHOD"];
include('../class/clsAlumnos.php');
$Alumno = new Alumno();
switch($requestMethod) {
	case 'GET':
		$intAlumno = '';	
		if($_GET['id']) {
			$intAlumno = $_GET['id'];
			$Alumno->set_intAlumno($intAlumno);
			$AlumnoInfo = $Alumno->obtenerAlumno();
		} else {
			$intGradoAlumno = $_GET['intGradoAlumno'] != '' ? $_GET['intGradoAlumno'] : NULL;
			$intEstatusAlumno = $_GET['intEstatusAlumno'] != '' ? $_GET['intEstatusAlumno'] : NULL;
			$AlumnoInfo = $Alumno->obtenerAlumnos($intGradoAlumno,$intEstatusAlumno);
			$TotalesInfo = $Alumno->obtenerTotales($intGradoAlumno,$intEstatusAlumno);
		}
		$GeneroInfo = $Alumno->obtenerGeneros();
		$GradoInfo = $Alumno->obtenerGrados();
		$EstatusInfo = $Alumno->obtenerEstatus();
		if(!empty($AlumnoInfo)) {
			$js_encode = json_encode(array('status'=>TRUE, 'AlumnoInfo'=>$AlumnoInfo, 'GeneroInfo'=>$GeneroInfo, 'GradoInfo'=>$GradoInfo, 'EstatusInfo'=>$EstatusInfo, 'TotalesInfo'=>$TotalesInfo), true);
        } else {
			$js_encode = json_encode(array('status'=>FALSE, 'message'=>'No hay registros.', 'GeneroInfo'=>$GeneroInfo, 'GradoInfo'=>$GradoInfo, 'EstatusInfo'=>$EstatusInfo), true);
        }
		header('Content-Type: application/json');
		echo $js_encode;
		break;
	default:
	header("HTTP/1.0 405 Method Not Allowed");
	break;
}
?>