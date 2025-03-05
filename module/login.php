<?php
require_once("../include/initialize.php");
global $mydb;

check_message();

if (isset($_SESSION['ACCOUNT_ID'])) {
	header("Location: ../index.php");
	exit();
} else { ?>

<?php
$success_message = "";
$error_message = "";

$query = "SELECT * FROM loginattemp WHERE IPADDRESS = :ipaddress";
$mydb->setQuery($query, [
    ':ipaddress' => $_SERVER['REMOTE_ADDR'],
]);

$single_res = $mydb->loadSingleResult();

 $displayWarning = 'style="display:none;"'; // Default to hidden
      if ($single_res && isset($single_res->ATTEMPCOUNT)) {
        if ($single_res->ATTEMPCOUNT >= 2) {
            $displayWarning = '';
     }
}

if (isset($_POST['btnLogin'])) {
   $email = htmlspecialchars(trim($_POST['username']));
   $upass = htmlspecialchars(trim($_POST['userpass']));
   $h_upass = $upass;

   // Check if either the email or password fields are empty
   if ($email == '' or $upass == '') {
      message("Invalid Username and Password!", "error");
      redirect("login.php");
   } else {
      $employee = new Employees();

      // Authenticate the user
      $res = $employee::AuthenticateEmployee($email, $h_upass);

      if ($res == true) {
            // Session variables
            $_SESSION['last_activity'] = time();
			$_SESSION['ACCOUNT_ID']       = $_SESSION['ACCOUNT_ID'];
			$_SESSION['ACCOUNT_NAME']     = $_SESSION['ACCOUNT_NAME'] ;
			$_SESSION['ACCOUNT_USERNAME'] = $_SESSION['ACCOUNT_USERNAME'];
			$_SESSION['EMPID']     = $_SESSION['EMPID'];
			$_SESSION['ip']          =    $_SERVER['REMOTE_ADDR'];
			$_SESSION['userAgent']   = $_SERVER['HTTP_USER_AGENT'];

			$query = "UPDATE `loginattemp` SET ATTEMPCOUNT = 0 WHERE IPADDRESS = :ipaddress";
            $istrue = $mydb->InsertThis($query, [
              ':ipaddress' => $_SERVER['REMOTE_ADDR'],
            ]);

            DoRecordLogs('Login to the system.', 'LOGIN');
            $success_message = "Login Successfull!";
            // redirect(WEB_ROOT.'index.php'); // redirect to index.php
            redirect(WEB_ROOT); // redirect also to the index.php but trigger the sidebar first menu

      } else {

         if (!isset($_SESSION['accesscount'])) {
            $_SESSION['accesscount'] = 0;
         }
         $_SESSION['accesscount']++;
           $ipAddress = $_SERVER['REMOTE_ADDR'];
          $query = "SELECT * FROM loginattemp WHERE IPADDRESS = :ipaddress";
          $mydb->setQuery($query, [
              ':ipaddress' => $ipAddress,
          ]);
          $rowcheck = $mydb->num_rows();

          if ($rowcheck > 0) {
              $updateQuery = "UPDATE `loginattemp` SET `ATTEMPCOUNT` = `ATTEMPCOUNT` + 1 WHERE IPADDRESS = :ipaddress";
              $mydb->InsertThis($updateQuery, [
                  ':ipaddress' => $ipAddress,
              ]);
          } else {
              $insertQuery = "INSERT INTO `loginattemp`(`IPADDRESS`,`ATTEMPCOUNT`) VALUES (:ipaddress, 1)";
              $mydb->InsertThis($insertQuery, [
                  ':ipaddress' => $ipAddress,
              ]);
          }

         $remaining = 2 - $single_res->ATTEMPCOUNT;
         $error_message = 'Account does not exist! You have only ' . $remaining . ' attempt(s) remaining.';
          
      }
   }
}
?>
<!doctype html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

		<meta name="description" content="Responsive Bootstrap4 Dashboard Template">
		<meta name="author" content="ParkerThemes">
		<title>SQMS - Login</title>

		<!-- Bootstrap css -->
		<link rel="stylesheet" href="<?php echo WEB_ROOT ?>css/bootstrap.min.css">
		<link rel="stylesheet" href="<?php echo WEB_ROOT ?>vendor/font-awesome/css/all.css">

		<!-- NICE ADMIN ASSETS -->
		<!-- Favicons -->
		<link href="<?php echo WEB_ROOT ?>assets/img/favicon.png" rel="icon">
		<link href="<?php echo WEB_ROOT ?>assets/img/apple-touch-icon.png" rel="apple-touch-icon">

		<!-- Google Fonts -->
		<link href="https://fonts.gstatic.com" rel="preconnect">
		<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

		<!-- Vendor CSS Files -->
		<link href="<?php echo WEB_ROOT ?>assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="<?php echo WEB_ROOT ?>assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
		<link href="<?php echo WEB_ROOT ?>assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
		<link href="<?php echo WEB_ROOT ?>assets/vendor/quill/quill.snow.css" rel="stylesheet">
		<link href="<?php echo WEB_ROOT ?>assets/vendor/quill/quill.bubble.css" rel="stylesheet">
		<link href="<?php echo WEB_ROOT ?>assets/vendor/remixicon/remixicon.css" rel="stylesheet">
		<link href="<?php echo WEB_ROOT ?>assets/vendor/simple-datatables/style.css" rel="stylesheet">

		<!-- Template Main CSS File -->
		<link href="<?php echo WEB_ROOT ?>assets/css/style.css" rel="stylesheet">

		<!-- DISPLAY CSS -->
		<style type="text/css">

			.scanner-body {
				text-align: center;
			}
			.scanner-con, .qr-detected-container {
				width: 100%;
				margin: 10px;
				background-color: white;
				padding: 20px;
				border-radius: 8px;
				box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
			}

			.scanner-con h5, .qr-detected-container h5 {
				margin-bottom: 20px;
				color: #333;
			}

			#interactive {
				width: 100%;
				max-width: 600px;
				height: auto;
				border-radius: 8px;
				border: 2px solid #ccc;
			}

			.scanner-btn {
				margin-top: 20px;
				background-color: #008ae6;
				color: white;
				font-weight: bold;
				padding: 10px 20px;
				border-radius: 5px;
				cursor: pointer;
				border: none;
			}

			.scanner-btn:hover {
				background-color: #007bb5;
			}

			.qr-detected-container input {
				width: 80%;
				padding: 10px;
				font-size: 16px;
				border: 2px solid #ccc;
				border-radius: 4px;
				margin-top: 10px;
				background-color: #f9f9f9;
			}

			#qr-validation-result {
				margin-top: 20px;
				font-size: 18px;
				font-weight: bold;
			}

			.valid-result {
				color: green;
			}

			.invalid-result {
				color: red;
			}

			/* Style for login buttons */
			.login-buttons {
				position: absolute;
				top: 10px;
				right: 20px;
				display: flex;
				gap: 10px;
			}

			.login-buttons a {
				background-color: #008ae6;
				color: white;
				padding: 8px 16px;
				border-radius: 5px;
				text-decoration: none;
				font-weight: bold;
				transition: background-color 0.3s;
			}

			.login-buttons a:hover {
				background-color: #007bb5;
			}

			#login-screen {
				display: none;
			}

			#login-screen.show-login {
				display: block;
			}

			#scanner-screen {
				display: block;
			}

			#scanner-screen.hide-scanner {
				display: none;
			}

			#goToLoginScreen {
				margin-top: 20px;
				padding: 10px 20px;
				background-color: #007bff;
				color: white;
				border: none;
				border-radius: 5px;
				cursor: pointer;
				text-decoration: none;
			}

			#scanner-screen {
				display: flex; 
				justify-content: center;
				align-items: center; 
				height: 100vh; 
				width: 100vw;
			}

			.dataTables_filter {
				float: right !important;
				display: flex;
				justify-content: flex-end;
			}

			.dataTables_paginate {
				float: right !important;
				text-align: right;
			}
			
		</style>

	</head>

	<body>
		<div class="container">
			<section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

							<div class="d-flex justify-content-center py-4">
								<a href="#" class="logo d-flex align-items-center w-auto">
									<img src="<?php echo WEB_ROOT ?>assets/img/logo.png" alt="">
									<span class="d-none d-lg-block">SQMS System</span>
								</a>
							</div><!-- End Logo -->

							<div class="card mb-3">
								<div class="card-body">
									<div class="pt-4 pb-2">
										<h5 class="card-title text-center pb-0 fs-4">Login to Your Account</h5>
										<p class="text-center small">Enter your username & password to login</p>
									</div>

									<form class="row g-3 needs-validation" novalidate method="post" action="#">
										<div class="col-12">
											<label for="yourUsername" class="form-label">Username</label>
											<div class="input-group has-validation">
												<span class="input-group-text" id="inputGroupPrepend">@</span>
												<input type="text" class="form-control" name="username" placeholder="" required>
												<div class="invalid-feedback">Please enter your username.</div>
											</div>
										</div>

										<div class="col-12">
											<label for="yourPassword" class="form-label">Password</label>
											<input type="password" class="form-control" name="userpass" placeholder="" />
											<div class="invalid-feedback">Please enter your password!</div>
										</div>

										<div class="form-group" style="text-align: center;">
											<p <?php echo $displayWarning; ?> style="color:red; display: inline; margin: 0;">
												<i class="fa fa-ban" style="font-size:20px;color:red;"></i>
												You are temporarily blocked <span id="countdown" style="display: inline;">60</span> sec(s). Don't refresh the page!
											</p>

											<?php if ($displayWarning == 'style="display:none;"' && !empty($error_message)): ?>
											<p style="color:red; display: inline; margin: 0;" class="message error"><?php echo $error_message; ?></p>
											<?php endif; ?>
										</div>

										<input type="hidden" name="REMOTE_ADDR" id="REMOTE_ADDR" value="<?php echo $_SERVER['REMOTE_ADDR']; ?>" />

										<div class="col-12">
											<button type="submit" class="btn btn-primary w-100" name="btnLogin">Login</button>
										</div>
									</form>

								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</body>
</html>

<?php
}
?>

<!-- Required jQuery first, then Bootstrap Bundle JS -->
<script src="<?php echo WEB_ROOT ?>js/jquery.min.js"></script>
<script src="<?php echo WEB_ROOT ?>js/bootstrap.bundle.min.js"></script>
<script src="<?php echo WEB_ROOT ?>js/moment.js"></script>
<!-- Slimscroll JS -->
<script src="<?php echo WEB_ROOT ?>vendor/slimscroll/slimscroll.min.js"></script>
<script src="<?php echo WEB_ROOT ?>vendor/slimscroll/custom-scrollbar.js"></script>
<!-- Daterange -->
<script src="<?php echo WEB_ROOT ?>vendor/daterange/daterange.js"></script>
<script src="<?php echo WEB_ROOT ?>vendor/daterange/custom-daterange.js"></script>
<!-- Data Tables -->
<script src="<?php echo WEB_ROOT ?>vendor/datatables/dataTables.min.js"></script>
<script src="<?php echo WEB_ROOT ?>vendor/datatables/dataTables.bootstrap.min.js"></script>
<!-- Custom Data tables -->
<script src="<?php echo WEB_ROOT ?>vendor/datatables/custom/custom-datatables.js"></script>
<script src="<?php echo WEB_ROOT ?>vendor/datatables/custom/fixedHeader.js"></script>

<!-- Include RowReorder JS -->
<script type="text/javascript" src="https://cdn.datatables.net/rowreorder/1.2.8/js/dataTables.rowReorder.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
<!-- Main JS -->
<script src="<?php echo WEB_ROOT ?>js/main.js"></script>
<!-- Steps wizard JS -->
<script src="<?php echo WEB_ROOT ?>vendor/wizard/jquery.steps.min.js"></script>
<script src="<?php echo WEB_ROOT ?>vendor/wizard/jquery.steps.custom.js"></script>
<script type="text/javascript" src="<?php echo WEB_ROOT ?>vendor/font-awesome/js/all.js"></script>
<script type="text/javascript" src="<?php echo WEB_ROOT ?>vendor/toastr/toastr.min.js"></script>


<!-- NICE ADMIN SCRIPTS -->
<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

<!-- Vendor JS Files -->
<script src="<?php echo WEB_ROOT; ?>assets/vendor/apexcharts/apexcharts.min.js"></script>
<script src="<?php echo WEB_ROOT; ?>assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="<?php echo WEB_ROOT; ?>assets/vendor/chart.js/chart.umd.js"></script>
<script src="<?php echo WEB_ROOT; ?>assets/vendor/echarts/echarts.min.js"></script>
<script src="<?php echo WEB_ROOT; ?>assets/vendor/quill/quill.js"></script>
<script src="<?php echo WEB_ROOT; ?>assets/vendor/simple-datatables/simple-datatables.js"></script>
<script src="<?php echo WEB_ROOT; ?>assets/vendor/tinymce/tinymce.min.js"></script>
<script src="<?php echo WEB_ROOT; ?>assets/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="<?php echo WEB_ROOT; ?>assets/js/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
