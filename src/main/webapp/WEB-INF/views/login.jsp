<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.20.1/dist/jquery.validate.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#loginForm').validate({
                rules: {
                    username: {
                        required: true
                    },
                    password: {
                        required: true
                    }
                },
                messages: {
                    username: {
                        required: "Username is required"
                    },
                    password: {
                        required: "Password is required"
                    }
                },
                submitHandler: function(form, event) {
                    event.preventDefault();
                    $('#error').hide();

                    // AJAX request
                    $.ajax({
                        url: '/dologin',
                        type: 'POST',
                        data: $(form).serialize(),
                        success: function(response) {
                            console.log('AJAX Success:', response);

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
                            console.error('AJAX Error:', status, error);
                            console.error('Response:', xhr.responseText);

                            $('#error').text('An error occurred. Please try again.').show(); // Show general error message
                        }
                    });

                    return false; // Prevent default form submission
                }
            });
        });
    </script>
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <h2 class="text-center mt-5">Login</h2>
            <form id="loginForm" class="mt-4" method="post">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" class="form-control" name="username" id="username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" name="password" id="password" required>
                </div>
                <button type="submit" class="btn btn-primary btn-block">Submit</button>
            </form>
            <p id="error" class="text-danger mt-3" style="display:none;"></p>
        </div>
    </div>
</div>
</body>
</html>
