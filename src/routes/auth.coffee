passport = require 'passport'
ensureAuthenticated = require '../auth/passport'

routeAuth = (router) ->
    router.get '/login', (req, res) ->
      if req.isAuthenticated()
        console.log 'authenticated'
        return res.render 'login', user: req.user
      res.render 'login'

    router.post '/login',
      (req, res, next) ->
        (
          passport.authenticate 'local', (err, user, info) ->
            console.log 'authenticate err', err, info
            return next err if err?
            console.log 'authenticate user', user
            if not user
              return res.status 401
                .send err: 'Invalid username and password combination.'
            req.logIn user, (err) ->
              next err
        ) req, res, next
      (req, res) ->
        res.send
          message: 'successful login',
          user: req.user

    router.post '/logout',
      #ensureAuthenticated,
      (req, res) ->
        req.logout()
        res.send
          message: 'successful logout'

module.exports =
  routeAuth: routeAuth
