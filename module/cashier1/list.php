<?php
  $counterName = $_SESSION['ACCOUNT_USERNAME'];
  $windowLabel = ($counterName == 'cashier1') ? 'WINDOW 1' : '';


  $cashierHistory = new Cashier_History();
  $transactions = new Transactions();
  $currentCustomer = $transactions->get_currentQueueNumber($windowLabel);

  if (empty($currentCustomer->queue_number)) {
      $buttonStatus = 'disabled';  // If there is no next customer, disable the button
  } else {
      $buttonStatus = '';  // Otherwise, keep the button enabled
  }

  if (!empty($currentCustomer->queue_number)) {
      $receiveStatus = 'disabled';  // If there is no next customer, disable the button
  } else {
      $receiveStatus = '';  // Otherwise, keep the button enabled
  }

?>

<div class="row">
  <div class="card col-lg-7 col-md-12 col-sm-12">

    <section class="section dashboard mt-5">
      <div class="row">
        <div class="col-lg-12">
          <div class="row d-flex align-items-center justify-content-center">

            <div class="col-lg-8 col-md-6 col-12">
              <h3 class="text-center text-orange">
                <b>Current Serving</b>
              </h3>

              <h1 class="text-center custom-h1">
                Queue Number
              </h1>

              <div class=" customers-card">
                <div disabled class="monitor_custom_card" >
                  <div class="d-flex align-items-center justify-content-center">
                  </div>
                  <h1 class="responsive-heading" style="font-size: 8.5rem;"><?=$currentCustomer->queue_number?></h1>
                  <h4 class="text-center text-orange">
                    <b class="window-name"><?=$currentCustomer->counter_name?></b>
                  </h4>
                </div>
              </div>
            </div>

          </div>
        </div>
      </div>

      <div class="row mt-4">
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
    </section>
  </div>

  <div class="col-lg-2 col-md-6 col-sm-12">
    <section class="section dashboard">
      <div class="row">
        <div class="col-lg-12 ">

          <form hidden id="customerOrderForm" method="POST" action="<?php echo WEB_ROOT; ?>cashier1/controller.php">
          <input type="hidden" name="route" value="completeCustomerTransaction">
          <input type="number" name="currentCustomerTransId" value="<?= $currentCustomer->transaction_id?>">
          <button type="submit" hidden class="btn btn-success">Submit</button>
        </form>

          <form hidden id="cancelCustomerOrderForm" method="POST" action="<?php echo WEB_ROOT; ?>cashier1/controller.php">
            <input type="hidden" name="route" value="cancelCustomerTransaction">
            <input type="number" name="cancelCurrentCustomerTransId" value="<?= $currentCustomer->transaction_id?>">
            <button type="submit" hidden class="btn btn-success">Submit</button>
          </form>

          <form hidden id="receiveCustomerForm" method="POST" action="<?php echo WEB_ROOT; ?>cashier1/controller.php">
          <input type="hidden" name="route" value="receiveCustomerTransaction">
          <button type="submit" hidden class="btn btn-success">Submit</button>
        </form>

          <!-- Recent Activity -->
          <div class="card">
            <div class="card-header bg-navy-blue text-white">
              <h5 class="mb-0 text-center"><b>ACTIONS</b></h5>
            </div> <!-- End Card Header -->

            <div class="card-body overflow-auto" style="scrollbar-width: none; -ms-overflow-style: none;">
              <div class="activity " style="height: 45.5rem;">
                <div class="row">
                    <!-- Card Wrapper -->
                    <div class="col-lg-12 mt-2">
                      <!-- CALL CUSTOMER Button -->
                      <div class="card shadow-sm mb-2">
                        <button <?=$buttonStatus?> id="callCustomerBtn" onclick="callCurrentCustomer()" type="button" class="btn-customer btn btn-lg bg-orange text-white w-100 custom_btn_card">
                          <i class="fas fa-bullhorn"></i> CALL CUSTOMER
                        </button>
                      </div>

                      <!-- NEXT CUSTOMER Button -->
                      <div class="card shadow-sm mb-2">
                        <button <?=$buttonStatus?> id="nextCustomerBtn" onclick="proceedCurrentCustomer()" type="button"  class="btn-customer btn btn-lg btn-success w-100 custom_btn_card">
                          <i class="fas fa-play"></i> NEXT CUSTOMER
                        </button>
                      </div>

                      <!-- NEXT CUSTOMER Button -->
                      <div  class="card shadow-sm mb-2">
                        <button <?=$receiveStatus?> id="receiveCustomerBtn" onclick="proceedCurrentCustomer()" type="button" class="btn-customer btn btn-lg bg-navy-blue  text-white w-100 custom_btn_card">
                          <i class="fas fa-handshake"></i> RECEIVE CUSTOMER
                        </button>
                      </div>

                      <!-- CANCEL CUSTOMER Button (Placed at the bottom) -->
                      <div class="card shadow-sm">
                        <button <?=$buttonStatus?>  id="cancelCustomerBtn" onclick="proceedCurrentCustomer()" type="button" class="btn-customer btn btn-lg btn-danger w-100 custom_btn_card">
                          <i class="fas fa-times"></i> CANCEL CUSTOMER
                        </button>
                      </div>

                    </div>

                    <input hidden type="text" id="textCurrentCustomer" value=" <?=(empty($currentCustomer->queue_number)) ? '' : "Please Go to WINDOW 1, customer number".sprintf("%04d",(int) substr($currentCustomer->queue_number, 1))?>" />

                    <input hidden type="text" id="currentCustomerNumber" value=" <?=(empty($currentCustomer->queue_number)) ? '' : "WINDOW 1, Now serving, customer number".sprintf("%04d",(int) substr($currentCustomer->queue_number, 1))?>" />

                  </div> <!-- End row -->

              </div> <!-- End activity -->
            </div> <!-- End Card Body -->
          </div><!-- End Recent Activity -->

        </div>
      </div>
    </section>
  </div>

  <div class="col-lg-3 col-md-6 col-sm-12">
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

                  <?php
                    $kiosk1 = new Kiosk1(); // Assuming your class name is Transactions
                    $rows = $kiosk1->list_of_kioskTransactions();
                  ?>

                  <?php foreach ($rows as $res): ?>
                    <!-- First Card Sample -->
                    <div class="col-lg-12 ">
                      <div class="card shadow-sm">
                        <div class="card-body p-3">
                          <div class="d-flex justify-content-between align-items-center">
                            
                            <!-- Left Content -->
                            <div>
                              <h5 class="card-title mb-1 text-navy-blue">Queue Number:</h5>
                              <h6 class="text-muted small mb-0">Time Created: 01:13 PM</h6>
                            </div>
                            
                            <!-- Right Content -->
                            <h4 class="mb-0 text-orange"><b><?= htmlspecialchars($res->queue_number); ?></b></h4>

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

<script>
  function callCurrentCustomer() {
      const text = document.getElementById('textCurrentCustomer').value;
      
      if (text !== '') {
          const speech = new SpeechSynthesisUtterance(text);
          speech.lang = 'en-US';  // Set the language of the speech
          speech.volume = 1;      // Volume: 0 (muted) to 1 (max)
          speech.rate = 1;        // Speed: 0.1 to 10 (1 is normal speed)
          speech.pitch = 1;       // Pitch: 0 (lowest) to 2 (highest)
          
          // Speak the text
          window.speechSynthesis.speak(speech);
      }
    }

    function proceedCurrentCustomer() {
      const text = document.getElementById('currentCustomerNumber').value;
      
      if (text !== '') {
          const speech = new SpeechSynthesisUtterance(text);
          speech.lang = 'en-US';  // Set the language of the speech
          speech.volume = 1;      // Volume: 0 (muted) to 1 (max)
          speech.rate = 1;        // Speed: 0.1 to 10 (1 is normal speed)
          speech.pitch = 1;       // Pitch: 0 (lowest) to 2 (highest)
          
          // Speak the text
          window.speechSynthesis.speak(speech);
      }
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

    function speakText() {
        const text = document.getElementById('textToSpeak').value;
        
        if (text !== '') {
            const speech = new SpeechSynthesisUtterance(text);
            speech.lang = 'en-US';  // Set the language of the speech
            speech.volume = 1;      // Volume: 0 (muted) to 1 (max)
            speech.rate = 1;        // Speed: 0.1 to 10 (1 is normal speed)
            speech.pitch = 1;       // Pitch: 0 (lowest) to 2 (highest)
            
            // Speak the text
            window.speechSynthesis.speak(speech);
        }
      }

    document.getElementById('nextCustomerBtn').addEventListener('click', function () {
        // Now submit the form
        submitFormData();
    });

    document.getElementById('cancelCustomerBtn').addEventListener('click', function () {

        // Now submit the form
        cancelFormData();
    });

    document.getElementById('receiveCustomerBtn').addEventListener('click', function () {
        // Now submit the form
        receiveCustomerFormData();
    });

    function submitFormData() {
        let form = document.getElementById('customerOrderForm');
        form.submit();  // This will submit the form data normally, without AJAX
    }

     function cancelFormData() {
        let form = document.getElementById('cancelCustomerOrderForm');
        form.submit();  // This will submit the form data normally, without AJAX
    }

    function receiveCustomerFormData() {
        let form = document.getElementById('receiveCustomerForm');
        form.submit();  // This will submit the form data normally, without AJAX
    }

</script>

