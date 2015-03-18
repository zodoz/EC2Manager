angular.module 'EC2Manager', ['ui.bootstrap']

angular.module 'EC2Manager'
  .controller 'LoginTabCtrl', ($scope, $window, $http) ->
    $scope.user = null;

    $scope.setUser = (user) ->
      $scope.user = user

    $scope.login = ->
      $http.post '/login', $scope.login.user
        .success (data, status, header, config) ->
          console.log 'login success: ', data
          $scope.user = data.user
        .error (data, status, header, config) ->
          console.log 'login error: ', data

    $scope.signup = ->
      $http.post '/api/users', $scope.signup.user
        .success (data) ->
          console.log 'signup success: ', data
          $scope.user = data.user
        .error (data) ->
          console.log 'signup failure: ', data

    $scope.logout = ->
      $http.post '/logout'
        .success (data) ->
          console.log 'logout success: ', data
          $scope.user = null
        .error (data) ->
          console.log 'logout error: ', data
