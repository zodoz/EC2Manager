module.exports = (grunt) ->
  grunt.registerTask 'deps', [
    'less:bootstrap'
    'concat:bootstrap'
    'copy:bootstrap'
    'copy:jquery'
    'copy:angular'
    'copy:angularRoute'
    'copy:uiBootstrap'
  ]
