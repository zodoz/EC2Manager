angular.module 'EC2Manager'
  .factory 'UserService', ($rootScope, $http, Session)->
    login = (username, password) ->
      $http.post '/login',
          username: username
          password: password
        .success (data) ->
          Session.create data.id, data.user
        .error (data, status, header, config) ->
          Session.destroy()
          #TODO find ways to report errors

    signup = (username, password) ->
      $http.post '/api/users',
          username: username
          password: password
        .success (data) ->
          Session.create data.id, data.user
        .error (data) ->
          Session.destroy()
          console.log 'signup failure: ', data
          #TODO find ways to report errors

    logout = ->
      $http.post '/logout'
        .success (data) ->
          console.log 'logout success', data
          Session.destroy()
        .error (data) ->
          console.log 'logout error', data

    isLoggedIn = ->
      !!Session.user

    login: login
    logout: logout
    signup: signup
    isLoggedIn: isLoggedIn
