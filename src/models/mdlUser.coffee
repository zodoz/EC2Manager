mongoose = require 'mongoose'
bcrypt = require 'bcrypt'
config = require '../../config'

UserSchema = new mongoose.Schema
  username: String
  password: String
  email: String

UserSchema.methods.comparePassword = (attemptedPassword, cb) ->
  bcrypt.compare attemptedPassword, @password, (err, isMatch) ->
    if err then cb err
    cb null, isMatch

UserSchema.statics.isValidLogin = (username, password, done) ->
  @findOne
    username: username
    (err, user) ->
      if err then return done err
      if not user
        return done null, false, message: "Unknown user #{username}"
      user.comparePassword password, (err, isMatch) ->
        if err then return done err
        return done null, user if isMatch
        return done null, false, message: "Invalid password"

module.exports = mongoose.model 'User', UserSchema
