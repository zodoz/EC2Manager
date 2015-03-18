config = require './config'
glob = require 'glob'
loadGruntTasks = require 'load-grunt-tasks'
path = require 'path'
_ = require 'lodash'

loadConfig = (dir) ->
  fullObject = {}
  options = glob.sync '*', cwd: dir
  options.forEach (optionFile) ->
      _.merge fullObject, require dir + optionFile

  return fullObject

module.exports = (grunt) ->
  gruntConfig =
    pkg: grunt.file.readJSON 'package.json'
    config: config
    env: process.env

  _.merge gruntConfig, loadConfig './tasks/options/'

  grunt.initConfig gruntConfig

  # close brace same line to account for grunt internal old coffeescript version
  loadGruntTasks grunt

  grunt.loadTasks './tasks'

  grunt.registerTask 'default', [
      'devLaunch'
    ]
