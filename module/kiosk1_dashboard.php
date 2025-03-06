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
          <h5 class="card-title">Created Transactions <span>| Today</span></h5>
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
                        <?php echo htmlspecialchars($res->counter_name); ?>
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
    <div class="modal-dialog modal-lg">
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

                    <div class="mb-4">
                      <label class="form-label">Select Cashier</label>
                      <div class="row">

                        <?php
                          $cashier1 = new Cashier1(); // Assuming your class name is Transactions
                          $rows = $cashier1->list_of_cashier();
                          ?>

                          <?php foreach ($rows as $res): ?>
                              <div class="col-lg-4 col-md-6 col-12 mb-2">
                                  <button type="button" class="btn cashier-btn btn-outline-primary w-100" data-cashier="<?=$res->counter_name ?>" cashier-id="<?=$res->counter_id ?>">
                                      <i class="fas fa-user"></i> <?=$res->counter_name ?>
                                      <br><small>Pending: <span id="pending_<?=$res->counter_name ?>"><?=$res->pending_count?></span> | 
                                      Completed: <span id="completed_<?=$res->counter_name ?>"><?=$res->completed_count?></span></small>
                                  </button>
                              </div>
                          <?php endforeach; ?>
                          
                      </div>
                      <input type="hidden" id="counter_id" name="counter_id">
                      <input type="hidden" id="printCounter" name="printCounter">
                  </div>

                    <div class="modal-footer">
                        <button type="submit" hidden class="btn btn-success">Submit</button>
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
        <p><strong>Cashier:</strong> <span id="print_next_counter"></span></p>
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

    document.querySelectorAll('.cashier-btn').forEach(button => {
      button.addEventListener('click', function () {
          document.querySelectorAll('.cashier-btn').forEach(btn => {
              btn.classList.remove('btn-primary');
              btn.classList.add('btn-outline-primary'); // Add outline back to others
              btn.style.color = ""; // Reset text color to default
          });

          this.classList.remove('btn-outline-primary'); // Remove outline effect
          this.classList.add('btn-primary'); // Make selected button solid blue
          this.style.color = "white"; // Ensure text turns white

          document.getElementById("counter_id").value = this.getAttribute("cashier-id");
          document.getElementById("printCounter").value = this.getAttribute("data-cashier");

          printTransaction();
        });
    });

    function printTransaction() {
        let queueNumber = document.getElementById("queue_number").value;
        let nextCounter = document.getElementById("printCounter").value;

        let priority = document.getElementById("priority_check").checked ? "Yes (Priority)" : "No";

        document.getElementById("print_queue_number").textContent = queueNumber;
        document.getElementById("print_next_counter").textContent = nextCounter;
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
