<?php
/**
 * Description: The main class for Database.
 * Author: Joken Villanueva
 * Date Created: October 27, 2013
 * Revised By: Joken Villanueva 
 * Revised Date: September 7, 2024
 * Revision: Convert MySQLi ---> PDO
 * Revised Date: September 5, 2024
 * Revision: Fix potential security vulnerabilities related to SQL injection.
 */

require_once(__DIR__ . '/../config/config.php');

class Database {
    private $conn;
    private $query;
    
    public function __construct() {
        $this->open_connection();
    }
    
    public function open_connection() {
        try {
            $this->conn = new PDO("mysql:host=" . DB_SERVER . ";dbname=" . DB_NAME, DB_USER, DB_PASS);
            // Disable ONLY_FULL_GROUP_BY
            $this->conn->exec("SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''))");
            $this->conn->exec("SET time_zone = '+08:00';");
            // Set the PDO error mode to exception
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            error_log("Database connection error: " . $e->getMessage());
            echo "Problem in database connection! Contact administrator.";
        }
    }

     // Transaction Methods
    public function beginTransaction() {
        $this->conn->beginTransaction();
    }

    public function commitTransaction() {
        $this->conn->commit();
    }

    public function rollbackTransaction() {
        $this->conn->rollBack();
    }
    
    public function InsertThis($sql, $params = []) {
        return $this->execute($sql, $params);
    }
    
    public function setQuery($sql = '', $params = []) {
        $this->execute($sql, $params);
    }
    
    private function execute($sql, $params = []) {
        try {
            $this->query = $this->conn->prepare($sql);
            foreach ($params as $param => $value) {
                $this->query->bindValue($param, $value);
            }
            return $this->query->execute();
        } catch (PDOException $e) {
            error_log("Database query error: " . $e->getMessage());
            echo $e->getMessage();
            // echo "An error occurred while processing the request. Please try again later.";
            return false;
        }
    }

    public function loadResultList() {
        try {
            return $this->query->fetchAll(PDO::FETCH_OBJ);
        } catch (PDOException $e) {
            error_log("Error fetching multiple results: " . $e->getMessage());
            echo "An error occurred while fetching the results. Please try again later.";
            return [];
        }
    }
    
    public function loadSingleResultAssoc() {
        try {
            return $this->query->fetch(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            error_log("Error fetching single associative result: " . $e->getMessage());
            echo "An error occurred while fetching the result. Please try again later.";
            return null;
        }
    }

    public function num_rows() {
        try {
            return $this->query->rowCount();
        } catch (PDOException $e) {
            error_log("Error fetching row count: " . $e->getMessage());
            echo "An error occurred while fetching the row count. Please try again later.";
            return 0;
        }
    }

    public function loadSingleResult() {
        try {
            return $this->query->fetch(PDO::FETCH_OBJ);
        } catch (PDOException $e) {
            error_log("Error fetching single result: " . $e->getMessage());
            echo "An error occurred while fetching the result. Please try again later.";
            return null;
        }
    }
    
    public function getFieldsOnOneTable($tbl_name) {
        try {
            $sql = "DESC " . $tbl_name;
            $this->setQuery($sql);
            $rows = $this->loadResultList();
            $fields = [];
            foreach ($rows as $row) {
                if (isset($row->Field)) {
                    $fields[] = $row->Field;
                }
            }
            return $fields;
            
        } catch (PDOException $e) {
            error_log("Error describing table '$tbl_name': " . $e->getMessage());
            echo "An error occurred while retrieving table fields. Please try again later.";
            return [];
        }
    }
    
    public function fetch_array() {
        try {
            return $this->query->fetch(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            error_log("Error fetching array: " . $e->getMessage());
            echo "An error occurred while fetching the result. Please try again later.";
            return null;
        }
    }
    
    public function insert_id() {
        try {
            return $this->conn->lastInsertId();
        } catch (PDOException $e) {
            error_log("Error retrieving last insert ID: " . $e->getMessage());
            echo "An error occurred while retrieving the last insert ID. Please try again later.";
            return null;
        }
    }

    public function close_connection() {
        $this->conn = null;
    }
}

$mydb = new Database();

?>
