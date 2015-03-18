module.exports = (grunt) ->
  grunt.registerTask 'main', [
    'less:main'
    'coffee:main'
  ]
