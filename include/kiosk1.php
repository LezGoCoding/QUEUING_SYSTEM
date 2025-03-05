<?php
	/**
	* Description:	This is a class for member.
	* Author:		Joken Villanueva
	* Date Created:	Nov. 2, 2013
	* Revised By:		
	*/
	require_once(LIB_PATH.DS.'database.php');

	class Kiosk1{
		
		protected static $tbl_name = "transactions";
		function db_fields(){
			global $mydb;
			return $mydb->getFieldsOnOneTable(self::$tbl_name);
		}

		function list_of_cashier(){
			global $mydb;
			$mydb->setQuery("SELECT * FROM ".self::$tbl_name);
			$cur = $mydb->loadResultList();
			return $cur;
		}

		function list_of_kioskTransactions(){
			global $mydb;
			$mydb->setQuery("SELECT t.queue_number, c.counter_name
							FROM ".self::$tbl_name." t
							JOIN counters c on c.counter_id = t.counter_id 
							WHERE DATE(date_created) = CURDATE() AND t.status = 'Pending'
							ORDER BY FIELD(T.priority, 'Yes', 'No') ASC,
				            T.transaction_id ASC");
			$cur = $mydb->loadResultList();
			return $cur;
		}

		function current_queueNumber(){
			global $mydb;
			$mydb->setQuery("SELECT queue_number FROM ".self::$tbl_name." Where DATE(date_created) = CURDATE() ORDER BY transaction_id DESC LIMIT 1");
			$cur = $mydb->loadSingleResult();
			return $cur;
		}

		function list_all_createdTodaysTransctions($emp_id) {
		    global $mydb;
		    $mydb->setQuery("
		        SELECT 
		            t.queue_number, 
		            t.date_created, 
		            GROUP_CONCAT(tt.transaction_name ORDER BY tt.transaction_name SEPARATOR ', ') AS transaction_types, 
		            t.priority, 
		            t.status
		        FROM transactions t
		        JOIN transaction_selections ts ON t.transaction_id = ts.transaction_id
		        JOIN transaction_types tt ON ts.type_id = tt.type_id
		        WHERE 
		            DATE(t.date_created) = CURDATE()  -- Only today's transactions
		            AND t.emp_id = '$emp_id'         -- Filter by employee who created it
		        GROUP BY t.queue_number, t.date_created, t.priority, t.status
		        ORDER BY 
		            t.priority ASC,  -- Higher priority first
		            t.date_created DESC, 
		            t.transaction_id DESC;
		    ");
		    $cur = $mydb->loadResultList();
		    return $cur;
		}


		function list_of_transactionsToday($emp_id) {
		    global $mydb;
		    
		    $query = "
		        SELECT 
		            t.queue_number, 
		            t.date_created,
		            t.priority,
		            t.status,
		            GROUP_CONCAT(tt.transaction_name ORDER BY tt.transaction_name SEPARATOR ', ') AS transaction_types
		        FROM transactions t
		        JOIN transaction_selections ts ON t.transaction_id = ts.transaction_id
		        JOIN transaction_types tt ON ts.type_id = tt.type_id
		        WHERE 
		            t.status IN ('Pending', 'In Progress') 
		            AND DATE(t.date_created) = CURDATE()  -- Filters only today's transactions
		            AND t.emp_id = '$emp_id'      -- Filters by employee ID
		        GROUP BY t.queue_number, t.date_created, t.priority, t.status
		        ORDER BY 
		            t.priority ASC,  -- Higher priority first
		            t.date_created DESC, 
		            t.transaction_id DESC;
		    ";
		    
		    $mydb->setQuery($query); // Bind emp_id to prevent SQL injection
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

		        // Add date created todays date and time 
		        $attributes['date_created'] = date('Y-m-d H:i:s');

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