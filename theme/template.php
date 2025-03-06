<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Meta -->
    <meta name="description" content="Responsive Bootstrap4 Dashboard Template">
    <meta name="author" content="ParkerThemes">
    <link rel="shortcut icon" href="<?php echo WEB_ROOT ?>img/no.png" />

    <!-- Title -->
    <title>SQMS System</title>

    <!-- Bootstrap css -->
    <link rel="stylesheet" href="<?php echo WEB_ROOT ?>css/bootstrap.min.css">
    <!-- Icomoon Font Icons css -->
    <link rel="stylesheet" href="<?php echo WEB_ROOT ?>fonts/style.css">
    <!-- Bootstrap Select CSS -->
    <link rel="stylesheet" href="<?php echo WEB_ROOT ?>vendor/bs-sel/bs-sel.css" />
    <!-- DateRange css -->
    <link rel="stylesheet" href="<?php echo WEB_ROOT ?>vendor/daterange/daterange.css" />
    <!-- Data Tables -->
    <link rel="stylesheet" href="<?php echo WEB_ROOT ?>vendor/datatables/dataTables.bs4.css" />
    <link rel="stylesheet" href="<?php echo WEB_ROOT ?>vendor/datatables/dataTables.bs4-custom.css" />
    <link href="<?php echo WEB_ROOT ?>vendor/datatables/buttons.bs.css" rel="stylesheet" />
    <link rel="stylesheet" href="<?php echo WEB_ROOT ?>vendor/font-awesome/css/all.css">
    <!-- Notify -->
    <link rel="stylesheet" href="<?php echo WEB_ROOT ?>vendor/notify/notify-flat.css" />
    <!-- Datepicker css -->
    <link rel="stylesheet" href="<?php echo WEB_ROOT ?>vendor/datepicker/css/classic.css" />
    <link rel="stylesheet" href="<?php echo WEB_ROOT ?>vendor/datepicker/css/classic.date.css" />
    <!-- Include RowReorder CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <!-- Toastr -->
    <link rel="stylesheet" type="text/css" href="<?php echo WEB_ROOT ?>vendor/toastr/toastr.min.css">
    <!-- Steps Wizard CSS -->
    <link rel="stylesheet" href="<?php echo WEB_ROOT ?>vendor/wizard/jquery.steps.css" />

    <!-- =============================================================================================== -->
    <!-- Nice admin assets -->
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

</head>

<style type="text/css">

   .wizard > .content > .body {
    width: 100%;
    height: auto;
    padding: 15px;
    position: relative; }

    .custom-table2 {
       border: 1px solid #000; 
   }
   .custom-table2 thead {
       background: #eef0f5; 
   }
   .custom-table2 thead th {
       border: 1px solid #000; 
   }
   .custom-table2 > tbody td {
       border: 1px solid #000; 
   }

   .custom-table2 tfoot th {
    border: 1px solid #000; 
}
.custom-table2 > tfoot td {
    border: 1px solid #000; 
}

.custom-toast-container {
    position: fixed;
    right: 0;
    bottom: 0;
    z-index: 1050;
    margin-bottom: 1rem;
}

.custom-toast {
    opacity: 0;
    transform: translateY(100%);
    transition: opacity 0.3s, transform 0.3s;
    width: 330px;
    height: auto;
    padding: 10px 15px;
    background-color: #ffffff;
    border-radius: 140px;
    box-shadow: 0 9px 10px rgb(0 0 0 / 29%);
    margin-right: 1rem;
    align-items: center;
    display: flex;
    margin-bottom: 0.5rem;
}

.custom-toast.show {
    opacity: 1;
    transform: translateY(0);
}

.custom-toast .icon-container {
    display: flex;
    align-items: center;
    margin-right: 10px;
}

.custom-toast .icon-container > svg {
    height: 34px;
}

.custom-toast .content-container {
    display: flex;
    flex-direction: column;
    flex: 1;
}

.custom-toast .content-container .title {
    font-weight: 600;
    font-size: 15px;
}

.custom-toast .content-container .message {
    font-size: 14px;
    font-weight: 400;
    color: #111215;
}

.custom-toast > button {
    background-color: transparent;
    font-size: 25px;
    color: #9b9dab;
    cursor: pointer;
    border: 0;
    padding: 0;
    margin: 0;
    height: 34px;
    width: 34px;
}

.custom-toast.success .icon-container > svg {
    fill: #47D764;
}

.custom-toast.success .content-container .title {
    color: #47d764;
}

.custom-toast.error .icon-container > svg {
    fill: #ff355b;
}

.custom-toast.error .content-container .title {
    color: #ff355b;
}

.custom-toast.info .icon-container > svg {
    fill: #2F86EB;
}

.custom-toast.info .content-container .title {
    color: #2F86EB;
}

.custom-toast.warning .icon-container > svg {
    fill: #FFC021;
}

.custom-toast.warning .content-container .title {
    color: #FFC021;
}

.custom-toast-container .custom-toast:last-child {
    margin-bottom: 1rem;
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

/* Fix header row */
.thead-fixed th {
    position: sticky;
    top: 0;
    background: white; /* Ensure header background is visible */
    z-index: 10; /* Keep it above the table content */
}

/* Prevent table stretching */
.table-responsive {
    overflow-x: auto;
    width: 100%;
}

.custom_card {
    height: 11rem; 
    display: flex;
    flex-direction: column; 
    justify-content: center; 
    align-items: center;
}

.custom_btn_card {
    height: 4rem; 
}

.bg-purple {
    background-color: #6a0dad; 
    color: white;
}

.btn-outline {
    border-color: lightgray;
}

@media (max-width: 568px) {
    .custom-toast {
        margin: auto 0.5rem;
        left: 0;
        right: 0;
        width: calc(100% - 1rem);
        margin-bottom: 0.5rem;
    }

.custom-toast-container {
    margin: 0;
}

}
</style>


<!-- remove the toggle-sidebar class if u included a sidebar.php -->
<body class="toggle-sidebar"> 

    <?php //require_once("sidebar.php") ; ?>
    <?php require_once("topnav.php") ; ?>

    <!-- Page header end -->

    <!-- Main container start -->
    <main id="main" class="main">
        <?php require_once $content; ?>
    <!-- Main container end -->
    </main><!-- End #main -->

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
<!-- Download / CSV / Copy / Print -->
<script src="<?php echo WEB_ROOT ?>vendor/datatables/buttons.min.js"></script>
<script src="<?php echo WEB_ROOT ?>vendor/datatables/jszip.min.js"></script>
<script src="<?php echo WEB_ROOT ?>vendor/datatables/pdfmake.min.js"></script>
<script src="<?php echo WEB_ROOT ?>vendor/datatables/vfs_fonts.js"></script>
<script src="<?php echo WEB_ROOT ?>vendor/datatables/html5.min.js"></script>
<script src="<?php echo WEB_ROOT ?>vendor/datatables/buttons.print.min.js"></script>
<!-- Bootstrap Select JS -->
<script src="<?php echo WEB_ROOT ?>vendor/bs-sel/bs-sel.min.js"></script>
<script src="<?php echo WEB_ROOT ?>js/jquery.easing.1.3.js"></script>
<script src="<?php echo WEB_ROOT ?>vendor/notify/notify.js"></script>
<!-- Datepickers -->
<script src="<?php echo WEB_ROOT ?>vendor/datepicker/js/picker.js"></script>    
<script src="<?php echo WEB_ROOT ?>vendor/datepicker/js/picker.date.js"></script>
<script src="<?php echo WEB_ROOT ?>vendor/datepicker/js/custom-picker.js"></script>
<!-- Apex Charts -->
<script src="<?php echo WEB_ROOT ?>vendor/apex/apexcharts.min.js"></script>
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

<!-- ================================================================================================== -->

  <!-- Template Main JS File -->
  <script src="<?php echo WEB_ROOT ?>assets/js/main.js"></script>
  
<!-- NICE ADMIN  -->

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

<!-- Vendor JS Files -->
  <script src="<?php echo WEB_ROOT ?>assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="<?php echo WEB_ROOT ?>assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="<?php echo WEB_ROOT ?>assets/vendor/chart.js/chart.umd.js"></script>
  <script src="<?php echo WEB_ROOT ?>assets/vendor/echarts/echarts.min.js"></script>
  <script src="<?php echo WEB_ROOT ?>assets/vendor/quill/quill.js"></script>
  <script src="<?php echo WEB_ROOT ?>assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="<?php echo WEB_ROOT ?>assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="<?php echo WEB_ROOT ?>assets/vendor/php-email-form/validate.js"></script>

<!-- ADMIN DASHBOARD && EMPLOYEE DASHBOARD JAVASCRIPT-->

</body>
</html>

