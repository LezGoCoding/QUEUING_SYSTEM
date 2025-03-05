<?php 
    require_once("../include/initialize.php");

    if (!isset($_SESSION['ACCOUNT_ID'])) {
        header("Location: module/login.php");
        exit;
    } else {
        // Initialize the router
        $router = new Router();
        $router->addRoute('addTransaction', 'doAddTransaction');
        $router->addRoute('edit', 'doEdit');
        $router->addRoute('completeCustomerTransaction', 'doUpdateTransactionStatus');
        $router->addRoute('del', 'doRemove');
        $router->handle();   
    }

    function doAddTransaction() {

        global $mydb;

        // Sanitize inputs
        $queue_number = htmlspecialchars($_POST['queue_number']);
        $priority_check = htmlspecialchars($_POST['priority_check']);
        $counter_id = htmlspecialchars($_POST['counter_id']);

        $isPriorityChecked = isset($_POST['priority_check']) && $_POST['priority_check'] === 'on';  // 'on' if checked

        $kiosk1 = new Kiosk1();
        $mydb->beginTransaction();

        try {
            $kiosk1->queue_number = $queue_number;
            $kiosk1->priority = $isPriorityChecked ? 'Yes' : 'No';
            $kiosk1->counter_id = $counter_id;
            $kiosk1->status = "Pending";
            
            if (!$kiosk1->create()) {
                throw new Exception("Failed to create transaction record.");
            }

            $mydb->commitTransaction();

            message("New Transaction has been created successfully!", "success");
            DoRecordLogs("New Transaction has been created successfully!", "INSERT");

        } catch (Exception $e) {
            $mydb->rollbackTransaction();
            message($e->getMessage(), "error");
        }

        redirect(WEB_ROOT);  // Redirect to WEB_ROOT if the condition is met
    }


    function doEdit() {
        global $mydb;
        // Sanitize inputs
        $serviceId = htmlspecialchars($_POST['serviceId']);
        $serviceName = htmlspecialchars($_POST['serviceName']);
        $serviceFee = htmlspecialchars($_POST['serviceFee']);
        $dateCreated = htmlspecialchars($_POST['dateCreated']);

        $service = new Services();

        $mydb->beginTransaction(); // Begin transaction

        try {
            // Update user record
            $service->SERVICE = $serviceName;
            $service->SERVICE_FEE = $serviceFee;

            if (!$service->update($serviceId)) {
                throw new Exception("Failed to update user record.");
            }

            $mydb->commitTransaction(); // Commit the transaction

            DoRecordLogs("User with ID $serviceId has been updated successfully!", "UPDATE");
            message("User has been updated successfully!", "success");

        } catch (Exception $e) {
            $mydb->rollbackTransaction(); // Rollback transaction on failure
            message($e->getMessage(), "error");
        }

        redirect(WEB_ROOT.'employees/');
    }

    function doUpdateTransactionStatus() {
        global $mydb;

        $transactionId = (int) htmlspecialchars($_POST['currentCustomerTransId']);
        $status = "Completed";

        $transactions = new Transactions();
        $mydb->beginTransaction(); // Begin transaction

        try {
            // Update user record
            $transactions->transaction_id = $transactionId;
            $transactions->status = $status;

            if (!$transactions->update($transactionId)) {
                throw new Exception("Failed to update user record.");
            }

            $mydb->commitTransaction(); // Commit the transaction

            DoRecordLogs("Transaction with ID $transactionId has been updated successfully!", "UPDATE");
            message("Transaction has been updated successfully!", "success");

        } catch (Exception $e) {
            $mydb->rollbackTransaction(); // Rollback transaction on failure
            message($e->getMessage(), "error");
        }

        redirect(WEB_ROOT);
    }

    function doEditEmployee() { 

        global $mydb;

        $empId = (int) htmlspecialchars($_POST['editEmpId']);
        $firstName = htmlspecialchars($_POST['first_name']);
        $lastName = htmlspecialchars($_POST['last_name']);

        $employee = new Employees();

        $mydb->beginTransaction(); // Begin transaction

        try {
            // Update user record
            $employee->first_name = $firstName;
            $employee->last_name = $lastName;

            if (!$employee->update($empId)) {
                throw new Exception("Failed to update user record.");
            }

            $mydb->commitTransaction(); // Commit the transaction

            DoRecordLogs("Employee with ID $empId has been updated successfully!", "UPDATE");
            message("Employee has been updated successfully!", "success");

        } catch (Exception $e) {
            $mydb->rollbackTransaction(); // Rollback transaction on failure
            message($e->getMessage(), "error");
        }

        redirect(WEB_ROOT.'employees/?details&'.$empId);
    }

    function doRemove() {
        global $mydb;
        $uid = (int) $_POST['uid'];

        $service = new Services();

        $mydb->beginTransaction(); // Begin transaction

        try {
            if (!$service->delete($uid)) {
                throw new Exception("Failed to remove service record.");
            }

            $mydb->commitTransaction(); // Commit the transaction

            DoRecordLogs("Service has been removed successfully!", "DELETE");
            message("Service has been removed successfully!", "success");
            echo json_encode(['status' => 1, 'message' => 'Service has been removed successfully!']);
            
        } catch (Exception $e) {
            $mydb->rollbackTransaction(); // Rollback transaction on failure
            message($e->getMessage(), "error");
            echo json_encode(['status' => 0, 'message' => $e->getMessage()]);
        }
    }
?>