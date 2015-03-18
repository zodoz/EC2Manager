passport = require 'passport'
LocalStrategy = require 'passport-local'
  .Strategy
User = require '../models/mdlUser'

passport.serializeUser (user, done) ->
  done null, user._id

passport.deserializeUser (id, done) ->
  User.findById id, (err, user) ->
    done err, user

passport.use new LocalStrategy (username, password, done) ->
  console.log 'local-strategy start'
  process.nextTick ->
    console.log 'local-strategy next tick'
    User.findOne
      username: username
      (err, user) ->
        console.log 'local-strategy err', err
        return done err if err?
        console.log 'local-strategy user', user
        if not user
          return done null, false, message: 'Invalid Password'
        console.log 'local-strategy calling done'
        done null, user


module.exports = (req, res, next) ->
  return next() if req.isAuthenticated()
  res.redirect '/login'
