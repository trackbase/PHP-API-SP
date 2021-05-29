<?php
$requestMethod = $_SERVER["REQUEST_METHOD"];
include('../class/clsAlumnos.php');
$Alumno = new Alumno();
switch($requestMethod) {	
	case 'POST':
		$intAlumno = $_POST['hAlumno'];
		$strMatricula = $_POST['txtMatriculaEditar'];
		$strNombreCompleto = $_POST['txtNombreCompletoEditar'];
		$datFechaNacimiento = $_POST['txtFechaNacimientoEditar'];
		$strGenero = $_POST['cmbGeneroEditar'];
		$intGradoAlumno = $_POST['cmbGradoEditar'];
		$intEstatusAlumno = $_POST['cmbEstatus'];
		
		$Alumno->set_intAlumno($intAlumno);
	    $Alumno->set_strMatricula($strMatricula);
	    $Alumno->set_strNombreCompleto($strNombreCompleto);
	    $Alumno->set_datFechaNacimiento($datFechaNacimiento);
	    $Alumno->set_strGenero($strGenero);
	    $Alumno->set_intGradoAlumno($intGradoAlumno);
		$Alumno->set_intEstatusAlumno($intEstatusAlumno);
		$AlumnoInfo = $Alumno->actualizarAlumno();
		if(!empty($AlumnoInfo)) {
			$js_encode = json_encode(array('status'=>TRUE, 'message'=>'Alumno actualizado correctamente.'), true);
        } else {
            $js_encode = json_encode(array('status'=>FALSE, 'message'=>'Alumno actualizado incorrectamente.'), true);
        }
		header('Content-Type: application/json');
		echo $js_encode;	
		break;
	default:
	header("HTTP/1.0 405 Method Not Allowed");
	break;
}
?>