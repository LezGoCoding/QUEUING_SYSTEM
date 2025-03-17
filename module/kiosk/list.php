<?php 
  $kiosk = new Kiosk();
  $queueNumber = new Kiosk();
  $row = $queueNumber->current_queueNumber();
  $lastQueueNumber = (int) substr($row->queue_number, 1); // Remove the "#" and cast to an integer
  $nextQueueNumber = $lastQueueNumber + 1;
  $nextQueueNumberFormatted = "#" . sprintf("%04d", $nextQueueNumber);
  $nextCustomer = $kiosk->getNext_KioskTransactions();
?>

<div class="row">

  <div class="card col-lg-9">
    <section class="section dashboard mt-5">
      <div class="row">
        <div class="col-lg-12">

        <h1 class="text-center">
            <i class="bi bi-journal-text"></i> 
            <b>Select Transaction </b>
            <i class="bi bi-journal-text"></i>
        </h1><br>

          <div class="row">
            <div class="col-lg-4 col-md-6 col-12">
              <div class="card customers-card">
                <button type="button" class="btn btn-lg btn-primary w-100 custom_card">
                  <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                    <i class="fas fa-user"></i>
                  </div>
                  REGULAR
                </button>
              </div>
            </div>

            <div class="col-lg-4 col-md-6 col-12">
              <div class="card customers-card">
                <button type="button" class="btn btn-lg btn-warning w-100 custom_card">
                  <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                    <i class="fas fa-person-cane"></i>
                  </div>
                  SENIOR CITIZEN
                </button>
              </div>
            </div>

            <div class="col-lg-4 col-md-6 col-12">
              <div class="card customers-card bg-purple">
                <button type="button" class="btn btn-lg w-100 custom_card text-white">
                  <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                    <i class="fas fa-wheelchair"></i>
                  </div>
                  PWD
                </button>
              </div>
            </div>

          </div>
        </div>

        <form id="transactionForm" hidden method="POST" action="<?php echo WEB_ROOT; ?>kiosk/controller.php">
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
            </div>
        </form>
      </div>

      <br><br><br><br> <hr><br><br><br>
      <div class="row">
        <div class="col-lg-12">
           <div class="col-lg-12">
            <div class="row d-flex align-items-center justify-content-center">
              <div class="col-lg-6 col-md-6 col-12">

                <h3 class="text-center text-navy-blue">
                  <b>Current Time</b>
                </h3>

                <h1 class="text-center custom-h1">
                    <div id="current-time"></div>
                  </h1>

                  <br><br>
              </div>

            </div>
          </div>
        </div>
      </div>
    </section>
  </div>

  <div class="col-lg-3">
        <section class="section dashboard">
          <div class="row">
            <div class="col-lg-12">

              <!-- Recent Activity -->
              <div class="card">
                <div class="card-header bg-navy-blue text-white">
                  <h5 class="mb-0"><b>Pending Transactions</b> <span>| Today</span></h5>
                </div> <!-- End Card Header -->

                <div class="card-body overflow-auto" style="scrollbar-width: none; -ms-overflow-style: none;">
                  <div class="activity " style="height: 45.5rem;">
                    <div class="row">

                      <!-- First Card Sample -->
                    <div class="col-lg-12 ">
                      <div class="card shadow-sm">
                        <div class="card-body p-3">
                          <div class="d-flex justify-content-between align-items-center">
                            
                            <!-- Left Content -->
                            <div>
                              <h5 class="card-title mb-1 text-navy-blue">NEXT Number:</h5>
                              <!-- <h6 class="text-muted small mb-0">Time Created: 01:13 PM</h6> -->
                            </div>
                            
                            <!-- Right Content -->
                            <div class="text-center">
                              <!-- Right Content -->
                              <h1 class="mb-0 text-orange"><b><?= htmlspecialchars($nextCustomer->queue_number); ?></b></h1>

                               <!-- Priority Icon -->
                              <?php if ($nextCustomer->priority === "Yes"): // Assuming 1 means Priority ?>
                                <span class="badge bg-danger mt-1"><i class="fas fa-fire"></i> Priority</span>
                              <?php else: ?>
                                <span class="badge bg-secondary mt-1"><i class="fas fa-check-circle"></i> Normal</span>
                              <?php endif; ?>
                            </div>

                          </div>
                        </div>
                      </div>
                    </div>

                      <?php
                        $kiosk = new Kiosk(); // Assuming your class name is Transactions
                        $rows = $kiosk->list_of_kioskTransactions();
                      ?>

                      <?php foreach ($rows as $res): ?>
                        <!-- First Card Sample -->
                        <div class="col-lg-12">
                          <div class="card shadow-sm">
                            <div class="card-body p-3">
                              <div class="d-flex justify-content-between align-items-center">
                                
                                <!-- Left Content -->
                                <div>
                                  <h5 class="card-title mb-1 text-navy-blue">Queue Number:</h5>
                                  <h6 class="text-muted small mb-0">Time Created: <?= htmlspecialchars($res->time_created); ?></h6>
                                </div>
                                
                                <!-- Right Content -->
                                <!-- Right Content -->
                                <div class="text-center">
                                  <h4 class="mb-0 text-orange"><b><?= htmlspecialchars($res->queue_number); ?></b></h4>
                                  
                                <!-- Priority Icon -->
                                <?php if ($res->priority === "Yes"): // Assuming 1 means Priority ?>
                                  <span class="badge bg-danger mt-1"><i class="fas fa-fire"></i> Priority</span>
                                <?php else: ?>
                                  <span class="badge bg-secondary mt-1"><i class="fas fa-check-circle"></i> Normal</span>
                                <?php endif; ?>
                              </div>

                              </div>
                            </div>
                          </div>
                        </div>
                      <?php endforeach; ?>

                      


                    </div> <!-- End row -->
                  </div> <!-- End activity -->
                </div> <!-- End Card Body -->
              </div><!-- End Recent Activity -->

            </div>
          </div>
        </section>
      </div>
  </div>
</div>

<script>
    document.querySelectorAll('.custom_card').forEach(button => {
        button.addEventListener('click', function () {
            let isPriority = this.textContent.trim() === "SENIOR CITIZEN" || this.textContent.trim() === "PWD";
            document.getElementById("priority_check").checked = isPriority;

              const { jsPDF } = window.jspdf;
              const doc = new jsPDF({
                unit: 'mm',
                format: [90, 100] // Adjusted to 90mm width
              });

              const schoolName = "CHMSU BINALBAGAN";
              const queueNumber = "<?=$nextQueueNumberFormatted ?>";
              const priority = isPriority ? "Yes" : "No";
              const today = new Date().toLocaleDateString();

              // Center X based on width (90mm / 2 = 45mm)
              const centerX = 45;

              // Header: School Name
              doc.setFont("Helvetica", "bold");
              doc.setFontSize(16);
              doc.text(schoolName, centerX, 15, { align: 'center' });

              // Date
              doc.setFontSize(10);
              doc.text(`Date: ${today}`, centerX, 30, { align: 'center' });

              // Queue Number Label
              doc.setFontSize(12);
              doc.text(`QUEUE NUMBER`, centerX, 40, { align: 'center' });

              // Actual Queue Number
              doc.setFont("Helvetica", "bold");
              doc.setFontSize(28); // Bigger for emphasis
              doc.text(queueNumber, centerX, 60, { align: 'center' });

              // Priority
              doc.setFont("Helvetica", "normal");
              doc.setFontSize(12);
              doc.text(`Priority: ${priority}`, centerX, 80, { align: 'center' });

              // Footer note (optional)
              doc.setFontSize(8);
              doc.text("Please wait for your number to be called.", centerX, 90, { align: 'center' });

              // Open in iframe for print dialog
              const blobURL = doc.output('bloburl');
              const iframe = document.createElement('iframe');
              iframe.style.position = 'fixed';
              iframe.style.right = '0';
              iframe.style.bottom = '0';
              iframe.style.width = '0';
              iframe.style.height = '0';
              iframe.style.border = '0';
              iframe.src = blobURL;

              document.body.appendChild(iframe);

              // Listen for iframe load, then print
              iframe.onload = function () {
                setTimeout(function () {
                  iframe.contentWindow.focus();
                  iframe.contentWindow.print();

                  // Delay form submission slightly to give time for print dialog
                  setTimeout(function () {
                    submitFormData(); // Now submit the form

                    // Optional alert for success
                    alert("Success! Form submitted.");
                      
                    document.body.removeChild(iframe); // Clean up iframe
                  }, 500); // You can adjust this delay if needed

                }, 500);
              };

        });
    });

    function submitFormData() {
        let form = document.getElementById('transactionForm');
        // Just trigger form submission
        form.submit();  // This sends the form data normally, without AJAX
    }

    // Update Current Date & Time
    function updateTime() {
        const now = new Date();
        const dateOptions = { year: 'numeric', month: 'long', day: 'numeric' };
        const timeOptions = { hour: 'numeric', minute: 'numeric', second: 'numeric', hour12: true };

        document.getElementById("current-time").textContent = `${now.toLocaleTimeString(undefined, timeOptions)}`;
    }

    // Update time every second
    setInterval(updateTime, 1000);
    updateTime();

</script>

<script>
  setInterval(function(){
    location.reload();
  }, 20000); // 5000 milliseconds = 5 seconds
</script>


