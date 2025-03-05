<?php
	/**
	* Description:	This is a class for member.
	* Author:		Joken Villanueva
	* Date Created:	Nov. 2, 2013
	* Revised By:		
	*/
	require_once(LIB_PATH.DS.'database.php');

	class Employees{
		
		protected static $tbl_name = "employees";
		function db_fields(){
			global $mydb;
			return $mydb->getFieldsOnOneTable(self::$tbl_name);
		}

		function list_of_employees(){
			global $mydb;
			$mydb->setQuery("SELECT * FROM ".self::$tbl_name);
			$cur = $mydb->loadResultList();
			return $cur;
		}

		function single_employees($id=0){
			global $mydb;
			$mydb->setQuery("SELECT * FROM ".self::$tbl_name." Where emp_id = :id LIMIT 1", [':id' => $id]);
			$cur = $mydb->loadSingleResult();
			return $cur;
		}


		function find_all_customers($name=""){
			global $mydb;
			$mydb->setQuery("SELECT * 
				FROM  ".self::$tbl_name." 
				WHERE  `INST_FULLNAME` ='{$name}'");
			$row_count = $mydb->num_rows();
			return $row_count;
		}


		static function AuthenticateEmployee($username = "", $password = "") {
			global $mydb;
			$sql = "SELECT * FROM employees WHERE `username` = :username LIMIT 1";
			$params = [
				':username' => $username
			];
			$mydb->setQuery($sql, $params);
			$row_count = $mydb->num_rows();

			if ($row_count == 1) {
				$found_user = $mydb->loadSingleResult();

				if (password_verify($password, $found_user->password)) {
					$_SESSION['ACCOUNT_ID'] 	 	= $found_user->emp_id;
					$_SESSION['ACCOUNT_NAME'] 		= $found_user->last_name. ', ' . $found_user->first_name;
					$_SESSION['ACCOUNT_USERNAME']	= $found_user->role;
					$_SESSION['EMPID'] 				= $found_user->role;
					return true;
				}
			}

			return false;
		} 


	
		/*---Instantiation of Object dynamically---*/
		static function instantiate($record) {
			$object = new self;

			foreach ($record as $attribute => $value) {
		        // Directly set the attribute if it exists
				if (array_key_exists($attribute, $object->attributes())) {
					$object->$attribute = $value;
				}
			}
			return $object;
		}

		/*--Cleaning the raw data before submitting to Database--*/
		protected function attributes() {
			$attributes = array();
			foreach ($this->db_fields() as $field) {
				if (property_exists($this, $field)) {
					$attributes[$field] = $this->$field;
				}
			}
			return $attributes;
		}

		protected function sanitized_attributes() {
			$attributes = $this->attributes();
			$sanitized = [];

	    	// Sanitize each attribute's value
			foreach ($attributes as $key => $value) {
	        // General sanitization; can be customized for each field type if necessary
				$sanitized[$key] = htmlspecialchars($value);
			}

			return $sanitized;
		}

		/*--Create,Update and Delete methods--*/
		public function save() {
			try {
		        // Determine whether to create a new record or update an existing one
				if (isset($this->id) && !empty($this->id)) {
		            // If an ID is set, perform an update
					return $this->update($this->id);
				} else {
		            // If no ID is set, perform a create operation
					return $this->create();
				}
			} catch (Exception $e) {
		        // Handle any exceptions that may occur
				error_log("Error saving record: " . $e->getMessage());
				echo "An error occurred while saving the record. Please try again later.";
				return false;
			}
		}

		public function create() {
		    global $mydb;

		    try {
		        $attributes = $this->sanitized_attributes();

		        $uniqid = uniqid();

		        // Directory to save the QR code image (make sure this directory exists and is writable)
		        $qrCodePath = __DIR__ . '/../phpqrcode/qrlib.php';
				// if (!file_exists($qrCodePath)) {
				//     message("The QR code generator file is missing.", "error");
				//     redirect(WEB_ROOT . 'employees/');
				//     return;
				// }

				require_once $qrCodePath;  // require the path of the phpqrcode qrlib.php

				$upload_dir = __DIR__ . '/../img/QRCodes/'; // path to save qrcode

				// if (!file_exists($upload_dir)) {
				//     message("The QR codes folder is missing.", "error");
				//     redirect(WEB_ROOT . 'employees/');
				//     return;
				// }

				$uniqid = uniqid();
				$qr_filename = $uniqid . $this->username . '.png';
				$qr_full_path = $upload_dir . $qr_filename;

				QRcode::png($qr_filename, $qr_full_path, QR_ECLEVEL_L, 4); // generate a qrcode and save in to file path

		        // Add the qr_code filename attribute into database
		        $attributes['qr_code'] = $qr_filename; 

		        // Build the SQL with placeholders
		        $placeholders = array_map(function($key) {
		            return ":{$key}";
		        }, array_keys($attributes));

		        $sql = "INSERT INTO " . self::$tbl_name . " (" . join(", ", array_keys($attributes)) . ") VALUES (" . join(", ", $placeholders) . ")";

		        // Bind parameters dynamically
		        $params = [];
		        foreach ($attributes as $key => $value) {
		            $params[":{$key}"] = $value;
		        }

		        $mydb->InsertThis($sql, $params);

		        return true;

		    } catch (PDOException $e) {
		        error_log("Error inserting record: " . $e->getMessage());
		        echo "An error occurred while creating the record. Please try again later.";
		        return false;
		    } catch (Exception $e) { // Catch other exceptions (like directory creation issues)
		        error_log("Error creating QR Code or directory: " . $e->getMessage());
		        echo "An error occurred while creating the QR Code. Please try again later.";
		        return false;
		    }
		}

		public function update($id = 0) {
			global $mydb;

			try {
				$attributes = $this->sanitized_attributes(); 

				$attribute_pairs = [];
				foreach ($attributes as $key => $value) {
					$attribute_pairs[] = "{$key} = :{$key}";
				}

				$sql = "UPDATE " . self::$tbl_name . " SET " . join(", ", $attribute_pairs) . " WHERE `SERVICE_ID` = :id";

		        // Bind parameters dynamically
				$params = [':id' => $id];
				foreach ($attributes as $key => $value) {
					$params[":{$key}"] = $value;  
				}
				$mydb->InsertThis($sql, $params);

				return true;

			} catch (PDOException $e) {
		        // Handle the exception
				error_log("Error updating record: " . $e->getMessage());
				echo "An error occurred while updating the record. Please try again later.";
				return false;
			}
		}

		public function delete($id = 0) {
			global $mydb;

			try {
		        // Construct the SQL query with a placeholder
				$sql = "DELETE FROM " . self::$tbl_name . " WHERE `SERVICE_ID` = :id LIMIT 1";

		        // Bind the parameter
				$params = [':id' => $id];
		        // Execute the query
				$mydb->InsertThis($sql, $params);
				
				return true;
			} catch (PDOException $e) {
		        // Handle the exception
				error_log("Error deleting record: " . $e->getMessage());
				echo "An error occurred while deleting the record. Please try again later.";
				return false;
			}
		}

		

	}
?>