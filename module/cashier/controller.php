<?php 
    require_once("../../include/initialize.php");

    if (!isset($_SESSION['ACCOUNT_ID'])) {
        header("Location: module/login.php");
        exit;
    } else {
        // Initialize the router
        $router = new Router();
        $router->addRoute('receiveCustomerTransaction', 'doGetAnotherTransaction');
        $router->addRoute('completeCustomerTransaction', 'doUpdateTransactionStatus');
        $router->addRoute('cancelCustomerTransaction', 'doCancelTransactionStatus');
        $router->handle();   
    }

    function doUpdateTransactionStatus() {

        global $mydb;

        $transactionId = (int) htmlspecialchars($_POST['customerCurrentTransId']);
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
            $cashier_history->catered_by = $_SESSION['ACCOUNT_NAME'];
            $cashier_history->status = $status;

            if (!$cashier_history->create()) {
                throw new Exception("Failed to create cashier history.");
            }

            $mydb->commitTransaction(); // Commit the transaction

            DoRecordLogs("Transaction with ID $transactionId has been updated successfully!", "UPDATE");
            message("Transaction has been completed successfully!", "success");

            doGetAnotherTransaction(); // get another customer to the transaction with pending status and no assign window yet.

        } catch (Exception $e) {
            $mydb->rollbackTransaction(); // Rollback transaction on failure
            message($e->getMessage(), "error");
        }

        // redirect(WEB_ROOT. 'cashier');
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
            $cashier_history->catered_by = $_SESSION['ACCOUNT_NAME'];
            $cashier_history->status = $status;

            if (!$cashier_history->create()) {
                throw new Exception("Failed to create cashier history.");
            }

            $mydb->commitTransaction(); // Commit the transaction

            DoRecordLogs("Transaction with ID $transactionId has been updated successfully!", "UPDATE");
            message("Transaction has been cancelled!", "success");

            doGetAnotherTransaction(); 

        } catch (Exception $e) {
            $mydb->rollbackTransaction(); // Rollback transaction on failure
            message($e->getMessage(), "error");
        }

        // redirect(WEB_ROOT. 'cashier');
    }

    function doGetAnotherTransaction(){
        global $mydb;

        $kiosk = new Kiosk();
        $cashier_history = new Cashier_History();

        $status = "Now Serving";
        $rows = $kiosk->getNoCashierPendingTransaction();


        foreach ($rows as $row) {

            // echo "Transaction ID ".$row->transaction_id;

            $transactions = new Transactions();
            $mydb->beginTransaction();

            try {
                // Update user record
                $transactions->counter_name = $_SESSION['ACCOUNT_USERNAME'];
                $transactions->status = $status;

                if (!$transactions->update($row->transaction_id)) {
                    throw new Exception("Failed to update transaction record.");
                }

                $cashier_history->transaction_id = $row->transaction_id;
                $cashier_history->catered_by = $_SESSION['ACCOUNT_NAME'];
                $cashier_history->status = $status;

                if (!$cashier_history->create()) {
                    throw new Exception("Failed to create cashier history.");
                }

                $mydb->commitTransaction(); // Commit the transaction

                DoRecordLogs("Transaction with ID $transactionId has been updated successfully!", "UPDATE");
                // message("Transaction has been updated successfully!", "success");

                echo json_encode(sprintf("%04d",(int) substr($row->queue_number, 1)));

            } catch (Exception $e) {
                $mydb->rollbackTransaction(); // Rollback transaction on failure
                message($e->getMessage(), "error");
            }
        }

        // redirect(WEB_ROOT. 'cashier');
    }
?>