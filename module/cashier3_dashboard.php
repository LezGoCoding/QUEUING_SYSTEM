<?php
  $cashierHistory = new Cashier_History();
  $transactions = new Transactions();
  $nextNextCustomer = $transactions->get_nextNextQueueNumber("cashier3");
  $nextCustomer = $transactions->get_nextQueueNumber("cashier3");
  $currentCustomer = $transactions->get_currentQueueNumber("cashier3");
  $prevCustomer = $cashierHistory->get_currentLastCompletedQueueNumber("cashier3");

  if (empty($currentCustomer->queue_number)) {
      $buttonStatus = 'disabled';  // If there is no next customer, disable the button
  } else {
      $buttonStatus = '';  // Otherwise, keep the button enabled
  }

?>
<div class="pagetitle">
  <h1>Cashier 3</h1>
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
        Now Processing 
        <i class="bi bi-journal-text"></i>
      </h1><br>

      <div class="row">

        <form hidden id="customerOrderForm" method="POST" action="<?php echo WEB_ROOT; ?>module/dashboard_controller.php">
          <input type="hidden" name="route" value="completeCustomerTransaction">
          <input type="number" name="currentCustomerTransId" value="<?= $currentCustomer->transaction_id?>">
          <button type="submit" hidden class="btn btn-success">Submit</button>
        </form>

        <form hidden id="cancelCustomerOrderForm" method="POST" action="<?php echo WEB_ROOT; ?>module/dashboard_controller.php">
          <input type="hidden" name="route" value="cancelCustomerTransaction">
          <input type="number" name="cancelCurrentCustomerTransId" value="<?= $currentCustomer->transaction_id?>">
          <button type="submit" hidden class="btn btn-success">Submit</button>
        </form>

        <div class="col-lg-4 col-md-6 col-12">
          <h5 class="text-center">
            <!-- <i class="bi bi-arrow-right"></i>  -->
            Next Customer
            <!-- <i class="bi bi-arrow-right"></i> -->
          </h5>
          <div  class="card customers-card">
            <button type="button" disabled class="btn btn-lg btn-primary w-100 custom_card" data-bs-toggle="modal" data-bs-target="#newTransaction">
              <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                <i class="fas fa-user"></i>
              </div>
              <h1><?=(empty($nextCustomer->queue_number)) ? '' : $nextCustomer->queue_number ?></h1>
            </button>
          </div>
        </div>

        <div class="col-lg-4 col-md-6 col-12">
          <h5 class="text-center">
            <!-- <i class="bi bi-arrow-right"></i>  -->
            Now Serving
            <!-- <i class="bi bi-arrow-right"></i> -->
          </h5>
          <div class="card customers-card">
            <button type="button" disabled class="btn btn-lg btn-outline-primary w-100 custom_card" data-bs-toggle="modal" data-bs-target="#newTransaction">
              <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                <i class="fas fa-hand-paper"></i> 
              </div>
              <h1><?=$currentCustomer->queue_number?></h1>
            </button>
          </div>
        </div>

        <div class="col-lg-4 col-md-6 col-12">
          <h5 class="text-center">
            <!-- <i class="bi bi-arrow-right"></i>  -->
            Previous Customer
            <!-- <i class="bi bi-arrow-right"></i> -->
          </h5>
          <div  class="card customers-card">
            <button type="button" disabled class="btn btn-lg btn-outline-success w-100 custom_card" data-bs-toggle="modal" data-bs-target="#newTransaction">
              <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                <i class="fas fa-check"></i>
              </div>
              <h1><?=(empty($prevCustomer->queue_number)) ? '' : $prevCustomer->queue_number ?></h1>
            </button>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-2"></div>
        <div class="col-lg-4 col-md-6 col-12 mb-2">
          <button <?=$buttonStatus?> id="cancelCustomerBtn" type="button" class="btn btn-lg btn-danger w-100 custom_btn_card">
              <i class="fas fa-times"></i> CANCEL
          </button>
        </div>

        <div class="col-lg-4 col-md-6 col-12 mb-2">
          <button <?=$buttonStatus?> id="nextCustomerBtn" onclick="speakText()" type="button" class="btn btn-lg btn-success w-100 custom_btn_card">
              <i class="fas fa-arrow-right"></i> NEXT CUSTOMER 
          </button>
        </div>

        <input hidden type="text" id="textToSpeak" value=" <?=(empty($nextNextCustomer->queue_number)) ? '' : "Please prepare next customer number".sprintf("%04d",(int) substr($nextNextCustomer->queue_number, 1))?>" />

      </div>
    </div>

     <!-- Right side columns -->
    <div class="col-lg-3">
      <!-- Recent Activity -->
      <div class="card">
        <div class="card-body">
          <h5 class="card-title">Pending Transactions <span>| Today</span></h5>
          <div class="activity overflow-auto" style="height: 25rem;">
            <?php
              $transactions = new Transactions(); // Assuming your class name is Transactions
              $rows = $transactions->list_of_cashierKioskTransactions("cashier3");
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

<script>
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

   function cancelFormData() {
      let form = document.getElementById('cancelCustomerOrderForm');
      form.submit();  // This will submit the form data normally, without AJAX
  }


  function submitFormData() {
      let form = document.getElementById('customerOrderForm');
      form.submit();  // This will submit the form data normally, without AJAX
  }

  

</script>

