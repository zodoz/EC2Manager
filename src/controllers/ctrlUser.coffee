User = require '../models/mdlUser'
bcrypt = require 'bcrypt'
config = require '../../config'

hashPassword = (password) ->
  bcrypt.hashSync password, config.bcrypt.saltWorkFactor

createNewUser = (userParams, cb) ->
  User.findOne username: userParams.username, (err, user) ->
    return cb err if err
    return cb message: "User already exists" if user

    newUser = new User
      username: userParams.username
      password: hashPassword userParams.password
      email: userParams.email

    newUser.save (err) ->
      return cb err if err
      return cb null, newUser

updateUser = (userParams, cb) ->
  User.findOne username: userParams.username, (err, user) ->
    return cb err if err

    for key, value of user
      user[key] = userParams[key] if userParams[key]?

    user.save (err) ->
      return cb err if err
      return cb null, user

module.exports =
  createNewUser: createNewUser
