angular.module 'EC2Manager'
  .controller 'NavbarCtrl', ($scope, UserService, $modal) ->
    $scope.isLoggedIn = UserService.isLoggedIn
    $scope.loginActive = true
    $scope.signupActive = false
    $scope.tab = 'login'

    $scope.showLoginModal = ->
      console.log 'showing login modal'
      loginModal = $modal.open
        templateUrl: 'loginModal.html'
        controller: 'NavbarLoginCtrl'
        #scope: $scope
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

  .controller 'NavbarLoginCtrl', ($scope, $modalInstance, UserService, $element) ->
    $scope.tab = 'login'
    $scope.login = {}
    $scope.signup = {}
    $scope.alert =
      show: false
      message: ""

    doLogin = (creds) ->
      UserService.login creds.username, creds.password, (err) ->
        if err?
          #show error to user
          console.log 'error in login', err
        else
          console.log 'closing modal'
          $modalInstance.close 'logged in'

    doSignup = (creds) ->
      if creds.password != creds.confirmPassword
        $scope.showAlert 'passwords must match!'
      else
        UserService.signup creds.username, creds.password, (err) ->
          if err?
            #show error to user
            console.log 'error in signup', err
          else
            console.log 'closing modal'
            $modalInstance.close 'signed up and logged in'

    $scope.clickLogin = ->
      doLogin $scope.login

    $scope.clickSignup = ->
      doSignup $scope.signup

    $scope.setTab = (tabName) ->
      $scope.tab = tabName
      console.log 'test'

    $scope.closeAlert = ->
      $scope.alert.show = false

    $scope.showAlert = (msg) ->
      $scope.alert.show = true
      $scope.alert.message = msg
      $ $element
        .effect 'shake'

    $scope.clickLoginSignup = ->
      console.log 'modal instance clickLoginSign', $scope
      $modalInstance.close
        login: $scope.login
        signup: $scope.signup


    $scope.cancelModal = ->
      console.log 'dismissing modal'
      $modalInstance.dismiss 'cancel'
