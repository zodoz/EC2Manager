angular.module 'EC2Manager'
  .controller 'NavbarCtrl', ($scope, UserService, $modal) ->
    $scope.isLoggedIn = UserService.isLoggedIn
    $scope.loginActive = true
    $scope.signupActive = false
    $scope.tab = 'login'

    $scope.setTab = (tabName) ->
      $scope.tab = tabName
      console.log 'test'

    $scope.showLoginModal = ->
      $scope.loginModal = $modal.open
        templateUrl: 'loginModal.html'
        controller: 'NavbarCtrl'
        scope: $scope
        #resolve:
          #login: -> $scope.login
          #signup: -> $scope.signup

    $scope.clickLogin = ->
      UserService.login $scope.login.username, $scope.login.password, (err) ->
        if err?
          #show error to user
        else
          $scope.loginModal.close()

    $scope.clickLoginSignup = ->
      console.log 'click login signup', $scope.login, $scope.signup

    $scope.clickSignup = ->
      UserService.signup $scope.signup.username, $scope.signup.password, (err) ->
        if err?
          #show error to user
        else
          $scope.loginModal.close()

    $scope.logoutClick = UserService.logout

  .controller 'NavbarLoginCtrl', ($scope, $modalInstance) ->
    $scope.clickLoginSignup = ->
      console.log 'modal instance clickLoginSign', $scope
