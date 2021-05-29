<?php
include("clsConexionPDO.php");
class Alumno 
{
    protected $db;
    private $_intAlumno;
    private $_strMatricula;
    private $_strNombreCompleto;
    private $_datFechaNacimiento;
    private $_strGenero;
    private $_intGradoAlumno;
	private $_intEstatusAlumno;

    public function set_intAlumno($intAlumno) {
        $this->_intAlumno = $intAlumno;
    }
    public function set_strMatricula($strMatricula) {
        $this->_strMatricula = $strMatricula;
    }
    public function set_strNombreCompleto($strMatricula) {
        $this->_strNombreCompleto = $strMatricula;
    }
    public function set_datFechaNacimiento($datFechaNacimiento) {
        $this->_datFechaNacimiento = $datFechaNacimiento;
    }
    public function set_strGenero($strGenero) {
        $this->_strGenero = $strGenero;
    }
    public function set_intGradoAlumno($intGradoAlumno) {
        $this->_intGradoAlumno = $intGradoAlumno;
    }
    public function set_intEstatusAlumno($intEstatusAlumno) {
        $this->_intEstatusAlumno = $intEstatusAlumno;
    }

    public function __construct() {
        $this->db = new ConexionPDO();
        $this->db = $this->db->returnConnection();
    }

    public function crearAlumno() {
		try {
    		$sql = 'CALL sp_crearAlumno(:strMatricula, :strNombreCompleto, :datFechaNacimiento, :strGenero, :intGradoAlumno);';
    		$data = [
			    'strMatricula' => $this->_strMatricula,
			    'strNombreCompleto' => $this->_strNombreCompleto,
			    'datFechaNacimiento' => $this->_datFechaNacimiento,
			    'strGenero' => $this->_strGenero,
			    'intGradoAlumno' => $this->_intGradoAlumno,
			];
	    	$stmt = $this->db->prepare($sql);
	    	$stmt->execute($data);
			$status = $stmt->rowCount();
            return $status;

		} catch (Exception $e) {
    		die("Error en la consulta.");
		}

    }

    public function actualizarAlumno() {
        try {
		    $sql = "CALL sp_actualizarAlumno(:intAlumno, :strMatricula, :strNombreCompleto, :datFechaNacimiento, :strGenero, :intGradoAlumno, :intEstatusAlumno);";
		    $data = [
			    'strMatricula' => $this->_strMatricula,
			    'strNombreCompleto' => $this->_strNombreCompleto,
			    'datFechaNacimiento' => $this->_datFechaNacimiento,
			    'strGenero' => $this->_strGenero,
			    'intGradoAlumno' => $this->_intGradoAlumno,
			    'intEstatusAlumno' => $this->_intEstatusAlumno,
			    'intAlumno' => $this->_intAlumno
			];
			$stmt = $this->db->prepare($sql);
			$stmt->execute($data);
			$status = $stmt->rowCount();
            return $status;
		} catch (Exception $e) {
			die("Error en la consulta.");
		}
    }
   
    public function obtenerAlumnos($var_intGradoAlumno,$var_intEstatusAlumno) {
    	try {
    		$sql = "CALL sp_obtenerAlumnos('$var_intGradoAlumno', '$var_intEstatusAlumno');";
		    $stmt = $this->db->prepare($sql);
		    $stmt->execute();
		    $result = $stmt->fetchAll(\PDO::FETCH_ASSOC);
            return $result;
		} catch (Exception $e) {
		    die("Error en la consulta.");
		}
    }

    public function obtenerTotales($var_intGradoAlumno,$var_intEstatusAlumno) {
    	try {
    		$sql = "CALL sp_obtenerTotales('$var_intGradoAlumno', '$var_intEstatusAlumno');";
		    $stmt = $this->db->prepare($sql);
		    $stmt->execute();
		    $result = $stmt->fetchAll(\PDO::FETCH_ASSOC);
            return $result;
		} catch (Exception $e) {
		    die("Error en la consulta.");
		}
    }

	public function obtenerGeneros() {
    	try {
    		$sql = "CALL sp_obtenerGeneros();";
		    $stmt = $this->db->prepare($sql);
			
		    $stmt->execute();
		    $result = $stmt->fetchAll(\PDO::FETCH_ASSOC);
            return $result;
		} catch (Exception $e) {
		    die("Error en la consulta.");
		}
    }

    public function obtenerGrados() {
    	try {
    		$sql = "CALL sp_obtenerGrados();";
		    $stmt = $this->db->prepare($sql);
			
		    $stmt->execute();
		    $result = $stmt->fetchAll(\PDO::FETCH_ASSOC);
            return $result;
		} catch (Exception $e) {
		    die("Error en la consulta.");
		}
    }

    public function obtenerEstatus() {
    	try {
    		$sql = "CALL sp_obtenerEstatus();";
		    $stmt = $this->db->prepare($sql);
			
		    $stmt->execute();
		    $result = $stmt->fetchAll(\PDO::FETCH_ASSOC);
            return $result;
		} catch (Exception $e) {
		    die("Error en la consulta.");
		}
    }

    public function obtenerAlumno() {
    	try {
    		$sql = "CALL sp_obtenerAlumno(:intAlumno);";
		    $stmt = $this->db->prepare($sql);
		    $data = [
		    	'intAlumno' => $this->_intAlumno
			];
		    $stmt->execute($data);
		    $result = $stmt->fetch(\PDO::FETCH_ASSOC);
            return $result;
		} catch (Exception $e) {
		    die("Error en la consulta.");
		}
    }

    public function borrarAlumno() {
    	try {
	    	$sql = "CALL sp_borrarAlumno(:intAlumno);";
		    $stmt = $this->db->prepare($sql);
		    $data = [
		    	'intAlumno' => $this->_intAlumno
			];
	    	$stmt->execute($data);
            $status = $stmt->rowCount();
            return $status;
	    } catch (Exception $e) {
		    die("Error en la consulta.");
		}
    }


}
?>