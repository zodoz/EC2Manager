express = require 'express'
ctrlUser = require '../../controllers/ctrlUser'
User = require '../../models/mdlUser'

routeUserRestApi = (router) ->
  console.log 'resting user routes'
  router.route '/users'
    .post (req, res) ->
      if not req.body? then return res.sendStatus 400
      ctrlUser.createNewUser req.body, (err, user) ->
        if err? then return res.sendStatus 400
        res.set 'Content-Type', 'application/json'
        return res.status 200
          .send user

  router.route '/users/:username'
    .get (req, res) ->
      console.log 'get /users/:username'
      console.log req.params
      User.findOne username: req.params.username, (err, user) ->
        #TODO: render better errors
        if err? then return res.sendStatus 400
        res.render 'user', user
    .put (req, res) ->
      if not req.body? then return res.sendStatus 400
      #TODO: authenticate user has rights to change requested user
      ctrlUser.updateUser req.body, (err, user) ->
        if err? then return res.sendStatus 400
        res.set 'Content-Type', 'application/json'
        return res.status 200
          .send user

module.exports = (router) ->
  routeUserRestApi router
