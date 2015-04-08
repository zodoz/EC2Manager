angular.module 'EC2Manager'
  .factory 'UserService', ($rootScope, $http, Session)->
    login = (username, password, cb) ->
      $http.post '/login',
          username: username
          password: password
        .success (data) ->
          Session.create data.id, data.user
          cb null, data.user
        .error (data, status, header, config) ->
          Session.destroy()
          cb data
          #TODO find ways to report errors

    signup = (username, password, cb) ->
      $http.post '/api/users',
          username: username
          password: password
        .success (data) ->
          Session.create data.id, data.user
          cb null, data.user
        .error (data) ->
          Session.destroy()
          console.log 'signup failure: ', data
          cb data
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
