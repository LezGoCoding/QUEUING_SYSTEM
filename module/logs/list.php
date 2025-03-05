<ol class="breadcrumb">
    <li class="breadcrumb-item ">Dashboard</li>
    <li class="breadcrumb-item active">Logs</li>
</ol>
<div class="row gutters">
	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
		<div class="card">
			<div class="card-header">
				<div class="card-title">Activity</div>
			</div>
			<div class="card-body">
				<div class="customScroll4">
					<ul class="project-activity">
						<?php 
						$logs = new Logs();
						$list = $logs->listOfLogs();
						?>
						<?php foreach ($list as $listlogs): ?>
							<?php 
						 	// Given date and time
							$givenDate = $listlogs->DATELOG;
							$givenTime = $listlogs->TIMELOG;

                                // Combine date and time into a single string
							$givenDateTimeString = $givenDate . ' ' . $givenTime;

                                // Validate and create a DateTime object for the given date and time
							
							try {
								$givenDateTime = new DateTime($givenDateTimeString);

                                    // Create a DateTime object for the current date and time
								$currentDateTime = new DateTime();

                                    // Calculate the difference between the two DateTime objects
								$interval = $currentDateTime->diff($givenDateTime);

                                    // Convert the difference to a human-readable format
								if ($interval->y > 0) {
									$result = $interval->y . ' year' . ($interval->y > 1 ? 's' : '') . ' ago';
								} elseif ($interval->m > 0) {
									$result = $interval->m . ' month' . ($interval->m > 1 ? 's' : '') . ' ago';
								} elseif ($interval->d > 0) {
									$result = $interval->d . ' day' . ($interval->d > 1 ? 's' : '') . ' ago';
								} elseif ($interval->h > 0) {
									$result = $interval->h . ' hour' . ($interval->h > 1 ? 's' : '') . ' ago';
								} elseif ($interval->i > 0) {
									$result = $interval->i . ' minute' . ($interval->i > 1 ? 's' : '') . ' ago';
								} else {
									$result = $interval->s . ' second' . ($interval->s > 1 ? 's' : '') . ' ago';
								}

							} catch (Exception $e) {
								error_log("Error: " . $e->getMessage());
								$result = "Invalid date/time";
							}
							
							?>
							<li class="activity-list">
								<div class="detail-info">
									<p class="date"><?php echo $listlogs->USER_NAME; ?> <small> -<?php echo $result ?></small></p>
									<p class="info"><?php echo $listlogs->ACTION; ?></p>
								</div>
							</li>
						<?php endforeach ?>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>