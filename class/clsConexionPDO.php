<?php
class ConexionPDO {
    private $_dbHostname = "localhost";
    private $_dbName = "test";
    private $_dbUsername = "root";
    private $_dbPassword = "";
    private $_con;

    public function __construct() {
    	try {
        	$this->_con = new PDO("mysql:host=$this->_dbHostname;dbname=$this->_dbName;charset=utf8", $this->_dbUsername, $this->_dbPassword);    
        	$this->_con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	    } catch(PDOException $e) {
			echo "La conexión falló: " . $e->getMessage();
		}

    }
    
    public function returnConnection() {
        return $this->_con;
    }
}
?>