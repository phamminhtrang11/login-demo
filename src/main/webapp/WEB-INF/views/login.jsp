<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#loginForm').submit(function(event) {
                event.preventDefault();
                // Validate username and password
                var username = $('input[name="username"]').val().trim();
                var password = $('input[name="password"]').val().trim();
                var isValid = true;

                if (username === "") {
                    $('#error').text('Username is required').show();
                    isValid = false;
                }

                if (password === "") {
                    $('#error').text('Password is required').show();
                    isValid = false;
                }

                if (!isValid) {
                    return;
                }

                $('#error').hide();

                // AJAX request
                $.ajax({
                    url: '/dologin',
                    type: 'POST',
                    data: $(this).serialize(),
                    success: function(response) {
                        console.log(response);

                        if (typeof response === 'string') {
                            response = JSON.parse(response);
                        }

                        if (response.success) {
                            window.location.href = response.redirectURL; // Redirect on success
                        } else {
                            $('#error').text('Invalid username or password').show();
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error('Error:', status, error);
                        console.error('Response:', xhr.responseText);

                        $('#error').text('An error occurred. Please try again.').show(); // Show general error message
                    }
                });
            });
        });
    </script>
</head>
<body>
<form id="loginForm">
    <table>
        <tr>
            <td>Username</td>
            <td><input type="text" name="username" required></td>
        </tr>
        <tr>
            <td>Password</td>
            <td><input type="password" name="password" required></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="Submit"></td>
        </tr>
    </table>
</form>
<p id="error" style="color:red; display:none;"></p>
</body>
</html>
