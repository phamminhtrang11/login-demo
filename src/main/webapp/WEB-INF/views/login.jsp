<!DOCTYPE html>
<html lang="en" ng-app="loginApp">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    <script>
        const app = angular.module('loginApp', []);

        app.controller('loginController', ['$scope', '$http', function($scope, $http) {
            $scope.login = function() {
                $scope.error = false;
                console.log("1111111111111", $scope.username, $scope.password)
                var obj = {
                        username: $scope.username,
                        password: $scope.password
                    };
                if ($scope.loginForm.$valid) {
                    $http.post('/dologin'
                        , JSON.stringify({
                        username: $scope.username,
                        password: $scope.password
                    }), {}, 'application/json;charset=UTF-8').then(function(response) {
                        if (response.data.success) {
                            window.location.href = response.data.redirectURL; // Redirect on success
                        } else {
                            $scope.errorMessage = 'Invalid username or password';
                            $scope.error = true;
                        }
                    }, function(error) {
                        console.error('AJAX Error:', error);
                        $scope.errorMessage = 'An error occurred. Please try again.';
                        $scope.error = true;
                    });
                }
            };
        }]);
    </script>
</head>
<body ng-controller="loginController">
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <h2 class="text-center mt-5">Login</h2>
            <form name="loginForm" class="mt-4" method="post" ng-submit="login()" novalidate>
                <div class="form-group" ng-class="{ 'has-error': loginForm.username.$touched && loginForm.username.$invalid }">
                    <label for="username">Username</label>
                    <input type="text" class="form-control" name="username" id="username" ng-model="username" required>
                    <div class="text-danger" ng-show="loginForm.username.$touched && loginForm.username.$invalid">
                        Username is required
                    </div>
                </div>
                <div class="form-group" ng-class="{ 'has-error': loginForm.password.$touched && loginForm.password.$invalid }">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" name="password" id="password" ng-model="password" required>
                    <div class="text-danger" ng-show="loginForm.password.$touched && loginForm.password.$invalid">
                        Password is required
                    </div>
                </div>
                <button type="submit" class="btn btn-primary btn-block" ng-disabled="loginForm.$invalid">Submit</button>
            </form>
            <p id="error" class="text-danger mt-3" ng-show="error">{{ errorMessage }}</p>
        </div>
    </div>
</div>
</body>
</html>
