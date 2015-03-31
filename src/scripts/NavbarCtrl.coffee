angular.module 'EC2Manager'
  .controller 'NavbarCtrl', ($scope, UserService, $modal) ->
    $scope.isLoggedIn = UserService.isLoggedIn
    
    $scope.showLogin = ->
      $scope.loginModal = $modal.open
        templateUrl: 'loginModal.html'

    $scope.loginClick = ->
      UserService.login $scope.login.username, $scope.login.password, (err) ->
        if err?
          #show error to user
        else
          $scope.loginModal.close()

    $scope.signupClick = ->
      UserScope.signup $scope.signup.username, $scope.signup.password, (err) ->
        if err?
          #show error to user
        else
          $scope.loginModal.close()
