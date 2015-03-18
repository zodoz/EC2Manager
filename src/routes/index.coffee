express = require 'express'
apiRouter = require './api'
User = require '../models/mdlUser'
auth = require './auth'

routeRestApi = (router) ->
  ###
  for httpMethod in ['get', 'post', 'put', 'delete']
    router[httpMethod] '/api/:controller', (req, res, next) ->
      route httpMethod, req.params.controller, 'index', req, res, next
    router[httpMethod] '/api/:controller/:method', (req, res, next) ->
      route httpMethod, req.params.controller, req.params.method, req, res, next
    router[httpMethod] '/api/:controller/:method/:id', (req, res, next) ->
      route httpMethod, req.params.controller, req.params.method, req, res, next
  ###

route = (httpMethod, controlerName, methodName, req, res, next) ->
  httpMethod = 'get' if not httpMethod?
  controllerName = 'index' if not controllerName?
  controller = null
  try
    controller = require "controllers/ctrl#{controllerName}"
  catch
    # TODO: log that controller was not found
    next()
    return
  if controller[httpMethod]? and
      typeof controller[httpMethod][methodName] is 'function'
    method = controller[methodName].bind controller
    method req, res, next
  else
    # TODO: log that no method was found
    next()

routeUserPages = (router) ->
  router.route '/user/:username'
    .get (req, res) ->
      console.log 'get /users/:username'
      console.log req.params
      User.findOne username: req.params.username, (err, user) ->
        #TODO: render better errors
        if err? then return res.sendStatus 400
        res.render 'user', user

module.exports = (app) ->
  router = express.Router()

  apiRouter app

  routeRestApi router
  routeUserPages router
  # TODO: find other rout files in current foler and call their route functions

  router.get '/', (req, res) ->
    res.render 'index'

  auth.routeAuth router

  ###
  # cannot find requested url, so present 404 error
  router.all '/*', (req, res) ->
    # TODO: log 404 request
    res.statusCode = 404
    res.render '404', 404
  ###

  app.use '/', router
