<?php
	/**
	* Description:	This is a class for member.
	* Author:		Joken Villanueva
	* Date Created:	Nov. 2, 2013
	* Revised By:		
	*/
	require_once(LIB_PATH.DS.'database.php');

	class Cashier_History{
		
		protected static $tbl_name = "cashier_history";
		function db_fields(){
			global $mydb;
			return $mydb->getFieldsOnOneTable(self::$tbl_name);
		}


		function get_currentLastCompletedQueueNumber($cashierNumber){
		    global $mydb;
		    
		    // Corrected query
		    $mydb->setQuery("
		        SELECT t.queue_number 
		        FROM " . self::$tbl_name . " ch
		        JOIN transactions t ON ch.transaction_id = t.transaction_id 
		        JOIN counters c ON c.counter_id = t.counter_id 
		        WHERE DATE(ch.action_date) = CURDATE() 
		          AND t.status = 'Completed' 
		          AND c.counter_name = :cashierNumber
		         ORDER BY DATE(ch.action_date) ASC, ch.history_id DESC
		        LIMIT 1", [':cashierNumber' => $cashierNumber]);
		    
		    $cur = $mydb->loadSingleResult();  // This will return the second row's queue number
		    return $cur;
		}

		function monitor_get_currentLastCompletedQueueNumber(){
		    global $mydb;
		    
		    // Corrected query
		    $mydb->setQuery("
		        SELECT t.queue_number 
		        FROM " . self::$tbl_name . " ch
		        JOIN transactions t ON ch.transaction_id = t.transaction_id 
		        -- JOIN counters c ON c.counter_id = t.counter_id 
		        WHERE DATE(ch.action_date) = CURDATE() 
		          AND t.status = 'Completed' 
		          -- AND c.counter_name = :cashierNumber
		         ORDER BY DATE(ch.action_date) ASC, ch.history_id DESC
		        LIMIT 1");
		        // ", [':cashierNumber' => $cashierNumber]);
		    
		    $cur = $mydb->loadSingleResult();  // This will return the second row's queue number
		    return $cur;
		}

		function single_cashier_history($id=0){
			global $mydb;
			$mydb->setQuery("SELECT * FROM ".self::$tbl_name." Where emp_id = :id LIMIT 1", [':id' => $id]);
			$cur = $mydb->loadSingleResult();
			return $cur;
		}

		function find_all_cashier_history($name=""){
			global $mydb;
			$mydb->setQuery("SELECT * 
				FROM  ".self::$tbl_name." 
				WHERE  `INST_FULLNAME` ='{$name}'");
			$row_count = $mydb->num_rows();
			return $row_count;
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
		        $attributes['action_date'] = date('Y-m-d H:i:s');

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

		

	}
?>