express = require 'express'
bodyParser = require 'body-parser'
session = require 'express-session'
passport = require 'passport'
mongoose = require 'mongoose'
routes = require './src/routes'
config = require './config'

app = express()

app.set 'views', "#{__dirname}/src/views"
app.set 'view engine', 'jade'

app.use bodyParser.json()
app.use session
  secret: config.app.sessionSecret
  resave: true
  saveUninitialized: true
app.use passport.initialize()
app.use passport.session()
app.use express.static "#{__dirname}/dist"

routes app

mongoose.connect config.db.url

app.listen(config.app.port)
