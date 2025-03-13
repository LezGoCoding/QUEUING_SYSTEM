<?php 
  $queueNumber = new Kiosk1();
  $row = $queueNumber->current_queueNumber();
  $lastQueueNumber = (int) substr($row->queue_number, 1); // Remove the "#" and cast to an integer
  $nextQueueNumber = $lastQueueNumber + 1;
  $nextQueueNumberFormatted = "#" . sprintf("%04d", $nextQueueNumber);
?>

<div class="pagetitle">
  <h1>KIOSK 1</h1>
  <nav>
    <ol class="breadcrumb">
      <li class="breadcrumb-item active">All Information</li>
    </ol>
  </nav>
</div><!-- End Page Title -->

<section class="section dashboard">
  <div class="row">
    <div class="col-lg-9">

    <h1 class="text-center">
        <i class="bi bi-journal-text"></i> 
        Select Transaction 
        <i class="bi bi-journal-text"></i>
    </h1><br>

      <div class="row">
        <div class="col-lg-4 col-md-6 col-12">
          <div class="card customers-card">
            <button type="button" class="btn btn-lg btn-primary w-100 custom_card" data-bs-toggle="modal" data-bs-target="#newTransaction">
              <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                <i class="fas fa-user"></i>
              </div>
              REGULAR
            </button>
          </div>
        </div>

        <div class="col-lg-4 col-md-6 col-12">
          <div class="card customers-card">
            <button type="button" class="btn btn-lg btn-warning w-100 custom_card" data-bs-toggle="modal" data-bs-target="#newTransaction">
              <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                <i class="fas fa-user"></i>
              </div>
              SENIOR CITIZEN
            </button>
          </div>
        </div>

        <div class="col-lg-4 col-md-6 col-12">
          <div class="card customers-card bg-purple">
            <button type="button" class="btn btn-lg w-100 custom_card text-white" data-bs-toggle="modal" data-bs-target="#newTransaction">
              <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                <i class="fas fa-user"></i>
              </div>
              PWD
            </button>
          </div>
        </div>

      </div>
    </div>

     <!-- Right side columns -->
    <div class="col-lg-3">
      <!-- Recent Activity -->
      <div class="card">

        <div class="card-body">
          <h5 class="card-title"><span>Queue #</span> <span>| Is Priority</span></h5>
          <div class="activity overflow-auto" style="height: 25rem;">
            <?php
              $kiosk1 = new Kiosk1(); // Assuming your class name is Transactions
              $rows = $kiosk1->list_of_kioskTransactions();
            ?>

            <?php foreach ($rows as $res): ?>
                <div class="activity-item d-flex">
                    <div class="activite-label"><?php echo htmlspecialchars($res->queue_number); ?></div>
                    <i class='bi bi-circle-fill activity-badge text-primary align-self-start'></i>
                    <div class="activity-content">
                        <?php echo htmlspecialchars($res->priority); ?>
                    </div>
                </div><!-- End activity item-->
            <?php endforeach; ?>
          </div>
        </div>

      </div><!-- End Recent Activity -->
    </div><!-- End Right side columns -->
    
  </div>
</section>

<div class="modal fade" id="newTransaction" tabindex="-1">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header bg-primary">
                <h5 class="modal-title text-white">Create New Transaction</h5>
                <button type="button" class="btn-close bg-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="transactionForm" method="POST" action="<?php echo WEB_ROOT; ?>module/dashboard_controller.php">
                    <input type="hidden" name="route" value="addTransaction">

                    <div class="mb-4">
                      <div class="row">

                        <div class="col-lg-6">
                          <label class="form-label">Queue Number</label>
                          <input type="text" class="form-control" id="queue_number" name="queue_number" value="<?=$nextQueueNumberFormatted?>" readonly>
                        </div>

                        <div class="col-lg-6">
                          <input type="checkbox" id="priority_check" name="priority_check" class="form-check-input" readonly>
                          <label class="form-label">Priority</label>
                          <label class="form-check-label" for="priority_check">Senior Citizen / PWD</label>
                        </div>

                      </div>
                    </div>

                    <div class="modal-footer">
                        <button type="submit" hidden class="btn btn-success">Submit</button>

                         <button type="submit" onclick="printTransaction()"  class="btn btn-success">Submit</button>

                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div id="printableArea" style="display: none;">
    <div style="border: 2px solid black; padding: 20px; width: 300px; text-align: center; margin: auto;">
        <h3>Transaction Receipt</h3>
        <p><strong>Queue Number:</strong> <span id="print_queue_number"></span></p>
        <p><strong>Priority:</strong> <span id="print_priority"></span></p>
        <hr>
        <p><small>Date: <span id="print_date"></span></small></p>
    </div>
</div>

<script>
    document.querySelectorAll('.custom_card').forEach(button => {
        button.addEventListener('click', function () {
            let isPriority = this.textContent.trim() === "SENIOR CITIZEN" || this.textContent.trim() === "PWD";
            document.getElementById("priority_check").checked = isPriority;
        });
    });

    function printTransaction() {
        let queueNumber = document.getElementById("queue_number").value;

        let priority = document.getElementById("priority_check").checked ? "Yes (Priority)" : "No";

        document.getElementById("print_queue_number").textContent = queueNumber;
        document.getElementById("print_date").textContent = new Date().toLocaleString();
        document.getElementById("print_priority").textContent = priority;

        let printContent = document.getElementById("printableArea").innerHTML;
        let printWindow = window.open('', '', 'width=800,height=500');
        printWindow.document.open();
        printWindow.document.write(`
            <html>
            <head>
                <title>Print Transaction</title>
                <style>
                    body { font-family: Arial, sans-serif; text-align: center; }
                    #printableArea { border: 2px solid black; padding: 20px; width: 300px; margin: auto; }
                    hr { width: 100%; border: 0.5px solid lightgray; margin: 10px 0; }
                </style>
            </head>
            <body onload="window.print(); window.close();">
                ${printContent}
            </body>
            </html>`);

        printWindow.document.close();

        submitFormData(); // Call form submission after the print is finished

    }

    function submitFormData() {
        let form = document.getElementById('transactionForm');
        // Just trigger form submission
        form.submit();  // This sends the form data normally, without AJAX
    }
</script>
