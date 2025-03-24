<?php 
    require_once("../../include/initialize.php");

    // Initialize the router
    $router = new Router();
    $router->addRoute('addTransaction', 'doAddTransaction');
    $router->handle();  

    function doAddTransaction() {

        // echo "working";

        global $mydb;

        // Sanitize inputs
        $queue_number = htmlspecialchars($_POST['queue_number']);
        $priority_check = htmlspecialchars($_POST['priority_check']);
        // $counter_id = htmlspecialchars($_POST['counter_id']);

        $isPriorityChecked = isset($_POST['priority_check']) && $_POST['priority_check'] === 'on';  // 'on' if checked

        $kiosk = new Kiosk();
        $mydb->beginTransaction();

        try {
            $kiosk->queue_number = $queue_number;
            $kiosk->priority = $isPriorityChecked ? 'Yes' : 'No';
            // $kiosk1->counter_id = $counter_id;
            $kiosk->status = "Pending";
            
            if (!$kiosk->create()) {
                throw new Exception("Failed to create transaction record.");
            }

            $mydb->commitTransaction();

            message("New Transaction has been created successfully!", "success");
            DoRecordLogs("New Transaction has been created successfully!", "INSERT");

        } catch (Exception $e) {
            $mydb->rollbackTransaction();
            message($e->getMessage(), "error");
        }

        redirect(WEB_ROOT. 'kiosk');  // Redirect to WEB_ROOT if the condition is met
    }

  
?>