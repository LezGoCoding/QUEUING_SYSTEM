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

            doGetAnotherTransaction(); // get another customer to the transaction with pending status and no assign window yet.

        } catch (Exception $e) {
            $mydb->rollbackTransaction(); // Rollback transaction on failure
            message($e->getMessage(), "error");
        }

        redirect(WEB_ROOT. 'cashier1');
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

            doGetAnotherTransaction(); // get another customer to the transaction with pending status and no assign window yet.

        } catch (Exception $e) {
            $mydb->rollbackTransaction(); // Rollback transaction on failure
            message($e->getMessage(), "error");
        }

        redirect(WEB_ROOT. 'cashier1');
    }

    function doGetAnotherTransaction(){
        global $mydb;

        $kiosk1 = new Kiosk1();

        $status = "Now Serving";
        $rows = $kiosk1->getNoCashierPendingTransaction();

        foreach ($rows as $row) {

            // echo "Transaction ID ".$row->transaction_id;

            $transactions = new Transactions();
            $mydb->beginTransaction();

            try {
                // Update user record
                $transactions->counter_id = 1;
                $transactions->status = $status;

                if (!$transactions->update($row->transaction_id)) {
                    throw new Exception("Failed to update transaction record.");
                }

                $mydb->commitTransaction(); // Commit the transaction

                // DoRecordLogs("Transaction with ID $transactionId has been updated successfully!", "UPDATE");
                message("Transaction has been updated successfully!", "success");

            } catch (Exception $e) {
                $mydb->rollbackTransaction(); // Rollback transaction on failure
                message($e->getMessage(), "error");
            }
        }

        redirect(WEB_ROOT. 'cashier1');
    }
?>