<?php 
    require_once("../include/initialize.php");

    if (!isset($_SESSION['ACCOUNT_ID'])) {
        header("Location: module/login.php");
        exit;
    } else {
        // Initialize the router
        $router = new Router();
        $router->addRoute('addTransaction', 'doAddTransaction');
        $router->addRoute('receiveCustomerTransaction', 'doReceieveTransaction');
        $router->addRoute('completeCustomerTransaction', 'doUpdateTransactionStatus');
        $router->addRoute('cancelCustomerTransaction', 'doCancelTransactionStatus');
        $router->handle();   
    }

    function doAddTransaction() {

        global $mydb;

        // Sanitize inputs
        $queue_number = htmlspecialchars($_POST['queue_number']);
        $priority_check = htmlspecialchars($_POST['priority_check']);
        // $counter_id = htmlspecialchars($_POST['counter_id']);

        $isPriorityChecked = isset($_POST['priority_check']) && $_POST['priority_check'] === 'on';  // 'on' if checked

        $kiosk1 = new Kiosk1();
        $mydb->beginTransaction();

        try {
            $kiosk1->queue_number = $queue_number;
            $kiosk1->priority = $isPriorityChecked ? 'Yes' : 'No';
            // $kiosk1->counter_id = $counter_id;
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

    function doUpdateTransactionStatus() {
        global $mydb;

        $transactionId = (int) htmlspecialchars($_POST['currentCustomerTransId']);
        $status = "Completed";

        $transactions = new Transactions();
        $cashier_history = new Cashier_History();
        $mydb->beginTransaction(); // Begin transaction

        try {
            // Update user record
            $transactions->transaction_id = $transactionId;
            $transactions->status = $status;

            if (!$transactions->update($transactionId)) {
                throw new Exception("Failed to update transaction record.");
            }

            $cashier_history->transaction_id = $transactionId;
            $cashier_history->status = $status;

            if (!$cashier_history->create()) {
                throw new Exception("Failed to create cashier history.");
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

    function doCancelTransactionStatus() {
        global $mydb;

        $transactionId = (int) htmlspecialchars($_POST['cancelCurrentCustomerTransId']);
        $status = "Cancelled";

        $transactions = new Transactions();
        $cashier_history = new Cashier_History();
        $mydb->beginTransaction(); // Begin transaction

        try {
            // Update user record
            $transactions->transaction_id = $transactionId;
            $transactions->status = $status;

            if (!$transactions->update($transactionId)) {
                throw new Exception("Failed to update transaction record.");
            }

            $cashier_history->transaction_id = $transactionId;
            $cashier_history->status = $status;

            if (!$cashier_history->create()) {
                throw new Exception("Failed to create cashier history.");
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

    function doReceieveTransaction(){
        global $mydb;

        $cashierID = (int) $_POST['cashierID'];
        $limit_num = 10;

        $kiosk1 = new Kiosk1();

        $countCashierTransaction = $kiosk1->getCountCashierPendingTransaction($cashierID);
        $limit_num -= $countCashierTransaction;
        $rows = $kiosk1->getNoCashierPendingTransaction($limit_num);

        // echo "Available Slot Count " . $limit_num;
        // echo "Count Number " . $countCashierTransaction;
        // echo "No Cashier Count " . $rows;

        foreach ($rows as $row) {

            // echo "Transaction ID ".$row->transaction_id;

            $transactions = new Transactions();
            $mydb->beginTransaction();

            try {
                // Update user record
                $transactions->counter_id = $cashierID;

                if (!$transactions->update($row->transaction_id)) {
                    throw new Exception("Failed to update transaction record.");
                }

                $mydb->commitTransaction(); // Commit the transaction

                DoRecordLogs("Transaction with ID $transactionId has been updated successfully!", "UPDATE");
                message("Transaction has been updated successfully!", "success");

            } catch (Exception $e) {
                $mydb->rollbackTransaction(); // Rollback transaction on failure
                message($e->getMessage(), "error");
            }
        }

        redirect(WEB_ROOT);
    }
?>