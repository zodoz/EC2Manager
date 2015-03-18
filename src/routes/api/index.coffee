express = require 'express'
routeUsers = require './users'

module.exports = (app) ->
  router = express.Router()

  console.log 'routing api'
  routeUsers router

  app.use '/api', router
