<?php
$requestMethod = $_SERVER["REQUEST_METHOD"];
include('../class/clsAlumnos.php');
$Alumno = new Alumno();
switch($requestMethod) {
	case 'POST':
		$strMatricula = $_POST['txtMatricula'];
		$strNombreCompleto = $_POST['txtNombreCompleto'];
		$datFechaNacimiento = $_POST['txtFechaNacimiento'];
		$strGenero = $_POST['cmbGenero'];
		$intGradoAlumno = $_POST['cmbGrado'];
		
	    $Alumno->set_strMatricula($strMatricula);
	    $Alumno->set_strNombreCompleto($strNombreCompleto);
	    $Alumno->set_datFechaNacimiento($datFechaNacimiento);
	    $Alumno->set_strGenero($strGenero);
	    $Alumno->set_intGradoAlumno($intGradoAlumno);
		$AlumnoInfo = $Alumno->crearAlumno();

		if(!empty($AlumnoInfo)) {
	      $js_encode = json_encode(array('status'=>TRUE, 'message'=>'Alumno creado correctamente.'), true);
        } else {
            $js_encode = json_encode(array('status'=>FALSE, 'message'=>'Alumno creado incorrectamente.'), true);
        }
		header('Content-Type: application/json');
		echo $js_encode;	
		break;
	default:
	header("HTTP/1.0 405 Method Not Allowed");
	break;
}
?>