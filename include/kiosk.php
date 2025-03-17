<?php
	/**
	* Description:	This is a class for member.
	* Author:		Joken Villanueva
	* Date Created:	Nov. 2, 2013
	* Revised By:		
	*/
	require_once(LIB_PATH.DS.'database.php');

	class Kiosk{
		
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
			$mydb->setQuery("SELECT t.queue_number, t.priority, DATE_FORMAT(t.date_created, '%h:%i %p') AS time_created
							FROM ".self::$tbl_name." t
							-- JOIN counters c on c.counter_id = t.counter_id 
							WHERE DATE(date_created) = CURDATE() AND t.status = 'Pending'
							ORDER BY FIELD(t.priority, 'Yes', 'No') ASC,
				            DATE(t.date_created) ASC, t.transaction_id ASC LIMIT 18446744073709551615 OFFSET 1");
			$cur = $mydb->loadResultList();
			return $cur;
		}

		function getNext_KioskTransactions(){
			global $mydb;
			$mydb->setQuery("SELECT t.queue_number, t.priority
							FROM ".self::$tbl_name." t
							WHERE DATE(date_created) = CURDATE() AND t.status = 'Pending'
							ORDER BY FIELD(t.priority, 'Yes', 'No') ASC,
				            DATE(date_created) ASC, t.transaction_id ASC LIMIT 1");
			$cur = $mydb->loadSingleResult();
			return $cur;
		}

		function getCountCashierPendingTransaction($counter_id){
			global $mydb;
			$mydb->setQuery("SELECT t.queue_number, t.transaction_id
							FROM ".self::$tbl_name." t
							WHERE t.counter_id = {$counter_id} AND
								DATE(t.date_created) = CURDATE() AND t.status = 'Pending'
							ORDER BY FIELD(t.priority, 'Yes', 'No') ASC,
				            DATE(t.date_created) ASC, t.transaction_id ASC");
			$row_count = $mydb->num_rows();
			return $row_count;
		}

		function getNoCashierPendingTransaction(){
			global $mydb;
			$mydb->setQuery("SELECT t.transaction_id, t.queue_number
							FROM ".self::$tbl_name." t
							WHERE t.counter_name = '' AND
								DATE(date_created) = CURDATE() AND t.status = 'Pending'
							ORDER BY FIELD(t.priority, 'Yes', 'No') ASC,
				            DATE(date_created) ASC, t.transaction_id ASC
				            LIMIT 1");
			$cur = $mydb->loadResultList();
			return $cur;
		}

		function current_queueNumber(){
			global $mydb;
			$mydb->setQuery("SELECT queue_number FROM ".self::$tbl_name." Where DATE(date_created) = CURDATE() ORDER BY transaction_id DESC LIMIT 1");
			$cur = $mydb->loadSingleResult();
			return $cur;
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

		

		

	}
?>