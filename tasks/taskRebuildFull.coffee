module.exports = (grunt) ->
  grunt.registerTask 'rebuildFull', [
    'clean'
    'deps'
    'main'
  ]
