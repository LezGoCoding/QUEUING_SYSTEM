document.addEventListener('DOMContentLoaded', function() {
    // Only run countdown if ATTEMPCOUNT >= 3
    var countdownElement = document.getElementById('countdown');
    var loginButton = document.getElementById('loginBtn');

    if (countdownElement) {
        var countdown = parseInt(countdownElement.innerText, 10); // Get the initial countdown value

        var interval = setInterval(function() {
            countdown--; // Decrease the countdown by 1
            countdownElement.innerText = countdown; // Update the display

            if (countdown <= 0) {
                clearInterval(interval); // Stop the countdown
                 var IPADDRESS = $('#REMOTE_ADDR').val(); // Get the value of the input

                    // AJAX request to update attempt count
                    $.ajax({
                        url: "controller.php?action=updatecountattemp",
                        type: "POST",
                        data: { IPADDRESS: IPADDRESS },
                        success: function(data) {
                            window.location = 'login.php';
                        },
                        error: function(xhr, status, error) {
                            window.location = 'login.php';
                        }
                    });
                loginButton.disabled = false; // Enable the login button
            }
        }, 1000); // Run every 1000 ms (1 second)
    }
});